import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/notebooks/v1.dart';
import 'package:googleapis/notebooks/v2.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';



class OrganizationEventList extends StatefulWidget {
  const OrganizationEventList({super.key});

  @override
  State<OrganizationEventList> createState() => _OrganizationEventListState();
}

class _OrganizationEventListState extends State<OrganizationEventList> {

  /*GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/calendar.readonly',
    ],
  );*/

  //List<calendar.Event> _events = [];


  /*Future<void> _fetchEvents() async {
    try {
      await _googleSignIn.signIn();
      var httpClient = (await _googleSignIn.authenticatedClient()).httpClient;
      var calendarAPI = calendar.CalendarApi(httpClient);
      var events = await calendarAPI.events.list('primary');
      setState(() {
        _events = events.items;
      });
    } catch (error) {
      print('Error fetching events: $error');
    }
  }

  Future<void> _createEvent() async {
    try {
      await _googleSignIn.signIn();
      var httpClient = (await _googleSignIn.authenticatedClient()).httpClient;
      var calendarAPI = calendar.CalendarApi(httpClient);

      var event = calendar.Event()
        ..summary = 'Google Meet Event'
        ..description = 'This is a Google Meet event created programmatically'
        ..start = calendar.EventDateTime()
        ..dateTime = DateTime.now().add(Duration(hours: 1)) // Start time
        ..end = calendar.EventDateTime()
        ..dateTime = DateTime.now().add(Duration(hours: 2)) // End time
        ..attendees = [
          calendar.EventAttendee()
            ..email = 'example@example.com', // Email of the attendee
          // Add more attendees if needed
        ]
        ..conferenceData = calendar.ConferenceData()
        ..createRequest = calendar.CreateConferenceRequest();

      var createdEvent = await calendarAPI.events.insert(event, 'primary');
      print('Event created: ${createdEvent.id}');
    } catch (error) {
      print('Error creating event: $error');
    }
  }*/

  static const appId = "37c64fdb68144006b11d982c4ac5499d";
  //static const token = "007eJxTYMhf/XL9dgaeZN+FW689qvJdfvLOh3kvOPe1ymjOXB0VyrVIgcHYPNnMJC0lyczC0MTEwMAsydAwxdLCKNkkMdnUxNIyRXeVQVpDICND+fVoRkYGCATxWRgyinKLGRgApvggDw==";
  static const token = "007eJxTYPAzf5HkK7FqW6auQveDLffFLUKMpi2I2cGWWMFxJiiozU+Bwdg82cwkLSXJzMLQxMTAwCzJ0DDF0sIo2SQx2dTE0jKlK88irSGQkYH3czMLIwMEgvisDCWpxSXGDAwAqKsc9Q==";
  static const channel = "test3";


  bool isJoined = false,
      openMicrophone = true,
      enableSpeakerphone = true,
      playEffect = false;
  bool _enableInEarMonitoring = false;
  double _recordingVolume = 100,
      _playbackVolume = 100,
      _inEarMonitoringVolume = 100;

  List _remoteUid=[];
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera,Permission.audio,].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint(">>>>>>> local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint(">>>>> >>>>>remote user $remoteUid joined");
          setState(() {
            _remoteUid.add(remoteUid);
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint(">>>>>> >>>>>> >>>>>>remote user $remoteUid left channel");
          setState(() {
            _remoteUid .clear();
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '>>>>> >>>>> >>>> >>>>[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
    //await _engine.enableAudio();
    //await _engine.enableLocalAudio(true);
    //await _engine.enableLocalVideo(true);
  }

 

  _switchMicrophone() async {
    // await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine.enableLocalAudio(!openMicrophone).then((value) {
      setState(() {
        openMicrophone = !openMicrophone;
      });
    }).catchError((err) {
      //logSink.log('enableLocalAudio $err');
    });
  }

  _switchSpeakerphone() {
    _engine.setEnableSpeakerphone(!enableSpeakerphone).then((value) {
      setState(() {
        enableSpeakerphone = !enableSpeakerphone;
      });
    }).catchError((err) {
      //logSink.log('setEnableSpeakerphone $err');
    });
  }

  _switchEffect() async {
    if (playEffect) {
      _engine.stopEffect(1).then((value) {
        setState(() {
          playEffect = false;
        });
      }).catchError((err) {
        //logSink.log('stopEffect $err');
      });
    } else {
      final path =
      (await _engine.getAssetAbsolutePath("assets/Sound_Horizon.mp3"))!;
      _engine.playEffect(soundId: 1, filePath: path, loopCount: 1,pitch: 1.0,pan: 1.0,gain: 1).then((value) {
        setState(() {
          playEffect = true;
        });
      }).catchError((err) {
        //logSink.log('playEffect $err');
      });
    }
  }



  //screen share
  

  @override
  void dispose() {
    super.dispose();

    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: _remoteVideo(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      width: 100,
                      height: 150,
                      child: Center(
                        child: _localUserJoined
                            ? AgoraVideoView(
                          controller: VideoViewController(
                            rtcEngine: _engine,
                            canvas: const VideoCanvas(uid: 0),
                          ),
                        )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //mic
                  InkWell(
                    onTap: (){
                      _switchMicrophone();
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Center(child: Icon(openMicrophone?Icons.mic:Icons.mic_off,color: Colors.grey,),),
                    ),
                  ),

                  //camera
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Center(child: Icon(Icons.video_camera_back,color: Colors.grey,),),
                  ),

                  //screen share
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Center(child: Icon(Icons.screen_share,color: Colors.grey,),),
                  ),

                  //speaker
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Center(child: Icon(Icons.volume_up,color: Colors.grey,),),
                  ),

                  //Stop
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                      child: Center(child: Icon(Icons.close,color: Colors.white,),),
                    ),
                  )
                ],
              ),
            ),
          )



        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid .length>0) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade900,
        child:
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //crossAxisSpacing:0,
                //mainAxisSpacing: 0,
                childAspectRatio: 2/3
            ),
            itemCount: _remoteUid.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 200.h,
                  width: 100.w,
                  child: Center(
                    child: AgoraVideoView(
                      controller: VideoViewController.remote(
                        rtcEngine: _engine,
                        canvas: VideoCanvas(uid: _remoteUid[index]),
                        connection: const RtcConnection(channelId: channel),
                      ),
                    ),
                  ),
                ),
              );
            },

          )
        /*ListView.builder(
          itemCount: _remoteUid.length,
          itemBuilder: (context,index){
            return Container(
              height: 300,
              width: 200,
              child: Center(
                child: AgoraVideoView(
                  controller: VideoViewController.remote(
                    rtcEngine: _engine,
                    canvas: VideoCanvas(uid: _remoteUid[index]),
                    connection: const RtcConnection(channelId: channel),
                  ),
                ),
              ),
            );
          },
        ),*/
      );

    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
