# Individual Intent Content
## Schedule Meeting
First, let's go to the "schedule_meeting" section and click on "Details".

![](../../../../../../images/en/intro-004.png)

Next, create five domain slots as shown in the image below: "member", "meeting_room", "meeting_subject", "ended_time", and "started_time".

![](../../../../../../images/en/intro-005.png)

Create four slot groups for the slots: started_time, ended_time, meeting_subject, and meeting_room.

![](../../../../../../images/en/intro-006.png)

Add the following sample dialogues: "Reserve a meeting room {meeting_room}", "I want to reserve a meeting", "I want to reserve a meeting from {started_time} to {ended_time}".

![](../../../../../../images/en/intro-007.png)

Fill in the "Completion" field as shown below to complete the "Schedule Meeting" intent.

![](../../../../../../images/en/intro-008.png)
## Cancel Meeting

Go to the "Cancel Meeting" section and click on "Details".

![](../../../../../../images/en/intro-013.png)

Create two slot groups for the slots: started_time and meeting_room.

![](../../../../../../images/en/intro-022.png)

Add the following sample dialogues: "I want to cancel the meeting starting at {started_time} in {meeting_room}", "I want to cancel the meeting starting at {started_time}", "I want to cancel the meeting".

![](../../../../../../images/en/intro-023.png)

Fill in the "Completion" field as shown below to complete the "Cancel Meeting" intent.

![](../../../../../../images/en/intro-024.png)

## Invite Members

Go to the "Invite Members" section and click on "Details".

![](../../../../../../images/en/intro-014.png)

Create three slot groups for the slots: started_time, meeting_room, and member.

![](../../../../../../images/en/intro-015.png)

Add the following sample dialogues: "Invite {member} to the meeting at {started_time}", "I want to invite {member} to the meeting".

![](../../../../../../images/en/intro-016.png)

Fill in the "Completion" field as shown below to complete the "Invite Members" intent.

![](../../../../../../images/en/intro-017.png)

## Modify Meeting Time

Go to the "Modify Meeting Time" section and click on "Details".

![](../../../../../../images/en/intro-018.png)

he trigger condition should meet the requirement of "Meeting subject is packed", as shown below.

![](../../../../../../images/en/intro-019.png)

Create two slot groups for the slots: start_time and end_time.

![](../../../../../../images/en/intro-020.png)

Fill in the "Completion" field as shown below to complete the "Modify Meeting Time" intent.

![](../../../../../../images/en/intro-021.png)

# NEXT
- [Publishing and Testing](../../tutorials/intro/deploy-test.html)
