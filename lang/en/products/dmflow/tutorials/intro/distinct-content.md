---
title: DMflow Intent Example-Individual Intent Content | DMflow
description: DMflow Intent Example-Individual Intent Content
---

# Individual Intent Content

## Schedule Meeting
First, let's go to the "schedule_meeting" section and click on "Details".

![DMflow Intent Example-Schedule Meeting](../../../../../../images/en/intro-004.png "DMflow Intent Example-Schedule Meeting")

Next, create five domain slots as shown in the image below: "member", "meeting_room", "meeting_subject", "ended_time", and "started_time".

![DMflow Intent Example-Schedule Meeting](../../../../../../images/en/intro-005.png "DMflow Intent Example-Schedule Meeting")

Create four slot groups for the slots: started_time, ended_time, meeting_subject, and meeting_room.

![DMflow Intent Example-Schedule Meeting](../../../../../../images/en/intro-006.png "DMflow Intent Example-Schedule Meeting")

Add the following sample dialogues: "Reserve a meeting room {meeting_room}", "I want to reserve a meeting", "I want to reserve a meeting from {started_time} to {ended_time}".

![DMflow Intent Example-Schedule Meeting](../../../../../../images/en/intro-007.png "DMflow Intent Example-Schedule Meeting")

Fill in the "Completion" field as shown below to complete the "Schedule Meeting" intent.

![DMflow Intent Example-Schedule Meeting](../../../../../../images/en/intro-008.png "DMflow Intent Example-Schedule Meeting")
## Cancel Meeting

Go to the "Cancel Meeting" section and click on "Details".

![DMflow Intent Example-Cancel Meeting](../../../../../../images/en/intro-013.png "DMflow Intent Example-Cancel Meeting")

Create two slot groups for the slots: started_time and meeting_room.

![DMflow Intent Example-Cancel Meeting](../../../../../../images/en/intro-022.png "DMflow Intent Example-Cancel Meeting")

Add the following sample dialogues: "I want to cancel the meeting starting at {started_time} in {meeting_room}", "I want to cancel the meeting starting at {started_time}", "I want to cancel the meeting".

![DMflow Intent Example-Cancel Meeting](../../../../../../images/en/intro-023.png "DMflow Intent Example-Cancel Meeting")

Fill in the "Completion" field as shown below to complete the "Cancel Meeting" intent.

![DMflow Intent Example-Cancel Meeting](../../../../../../images/en/intro-024.png "DMflow Intent Example-Cancel Meeting")

## Invite Members

Go to the "Invite Members" section and click on "Details".

![DMflow Intent Example-Invite Members](../../../../../../images/en/intro-014.png "DMflow Intent Example-Invite Members")

Create three slot groups for the slots: started_time, meeting_room, and member.

![DMflow Intent Example-Invite Members](../../../../../../images/en/intro-015.png "DMflow Intent Example-Invite Members")

Add the following sample dialogues: "Invite {member} to the meeting at {started_time}", "I want to invite {member} to the meeting".

![DMflow Intent Example-Invite Members](../../../../../../images/en/intro-016.png "DMflow Intent Example-Invite Members")

Fill in the "Completion" field as shown below to complete the "Invite Members" intent.

![DMflow Intent Example-Invite Members](../../../../../../images/en/intro-017.png "DMflow Intent Example-Invite Members")

## Modify Meeting Time

Go to the "Modify Meeting Time" section and click on "Details".

![DMflow Intent Example-Modify Meeting Time](../../../../../../images/en/intro-018.png "DMflow Intent Example-Modify Meeting Time")

he trigger condition should meet the requirement of "Meeting subject is packed", as shown below.

![DMflow Intent Example-Modify Meeting Time](../../../../../../images/en/intro-019.png "DMflow Intent Example-Modify Meeting Time")

Create two slot groups for the slots: started_time and ended_time.

![DMflow Intent Example-Modify Meeting Time](../../../../../../images/en/intro-020.png "DMflow Intent Example-Modify Meeting Time")

Fill in the "Completion" field as shown below to complete the "Modify Meeting Time" intent.

![DMflow Intent Example-Modify Meeting Time](../../../../../../images/en/intro-021.png "DMflow Intent Example-Modify Meeting Time")

# NEXT
- [Publishing and Testing](../../tutorials/intro/deploy-test.html)

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)
