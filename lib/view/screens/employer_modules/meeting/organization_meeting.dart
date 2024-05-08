import 'package:flutter/material.dart';
import 'package:hrms/view/screens/employer_modules/meeting/widgets/organization_event_list.dart';



class OrganizationMeeting extends StatefulWidget {
  const OrganizationMeeting({super.key});

  @override
  State<OrganizationMeeting> createState() => _OrganizationMeetingState();
}

class _OrganizationMeetingState extends State<OrganizationMeeting> {
  @override
  Widget build(BuildContext context) {
    return const OrganizationEventList();
  }
}
