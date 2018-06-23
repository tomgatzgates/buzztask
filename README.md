

# Buzztask ![Github status](https://circleci.com/gh/tomgatzgates/buzztask.png?circle-token=60b32951209d8cd8f261f87348c0d2dd60e68fe4)
First an foremost, Buzztask is a side project to scratch development itches.
However, the idea of Buzztask has long been floating round in my head to solve issues I have with many todo/task management apps available today whilst loosely following the principles of GTD.

**Firstly, the binary nature of a todo.** Quite often, I can be working on several things at once. A todo app tends to present tasks as a long list with items that are either outstanding or done. However, this does not accurately reflect the state of a task which can often be blocked on external factors, waiting for review or simply in progress for an extended period of time.

**Secondly, enforcing simplistic titles and notes.** Many todo apps assume a task is small enough to be represented by few characters and in some cases, a sentence or two. I find this to be very limiting as tasks can have much more structured and detailed descriptions from external resources to highly formatted descriptions and even code blocks.

## Goals
- Clearly see what work is in progress and what is waiting for review, rather than just binary todo or done.
- Group similar tasks together to clearly see what is outstanding for a goal/project.
- Easily store useful links or details in an easy to read and clear manner per task and/or project.  
- Filter tasks within a list or project to see only specific tasks (think tags).


## How Buzztask works

### Tasks
A task is a single thing to complete. It could be "Do the washing up" or more complex like "Book flights for summer vacation".
A task description can contain structured, formatted data such as a link to a comparison website, a voucher code, a list of requirements.

Rules for adding new tasks:
- New tasks are added to the end of their list
- Adding a new task in **Scheduled** list requires a date
- Adding a new task in **Focus** auto focuses it
- Adding a new task to project adds it to the bottom of the All tasks (inbox/list) section


#### Actions
A task has a main action `When` which decides which list it ends up in.
- Focus (focus)
- Next (next)
- Date picker (scheduled)
- Someday (someday)

A task can also be tagged and added to a project. This should be as easy as click to edit.

### Lists
All new tasks* end up in the **Inbox**. The Inbox is the pensive for your thoughts. Write it down and process it later. It should be incredibly easy to add a task.

\*If you're viewing a project or list, adding a new task should add it to that project or list by default.

There are two types of list, [-]standard and [\*] computed.
- Inbox (new tasks without a project)
* Focus (stuff I want to do today)
- Next (stuff you want to get to next)
* Scheduled (stuff with a date attached)
- Someday (stuff you want to keep track of but doesn't matter when you do it)
- Logbook (all completed tasks, excluding deleted
- Trash (all deleted tasks, including completed but deleted)

### Projects
Projects are to group related tasks. For example "Redecorate the bathroom" might become a project, with many tasks to complete; "Book decorator", "Buy materials", "Pay decorator".

A project will be split into various headings:
- Focus (Focus at the top including where scheduled == today)
- Tasks (Inbox then Next)
- Scheduled (this block cannot accept tasks from other lists, unless a pop up asks for a day)
- Someday (optional show)
- Logbook (optional show)

\*A focussed `scheduled` task will appear in focus section and greyed out in scheduled section.

### Ordering
- When viewing a list, tasks are ordered by their `list_position`
- In a project, tasks are ordered by their `project_position`
- When looking `focus`, tasks are ordered by their position in `focussed_tasks`

### Spaces
Spaces would allow you to group tasks and projects. For example you might have a "work" space and a "home" space. This is just an idea.

## Notes
- Can't use hover for actions as it does not work on mobile
- Sidebar becomes the main screen on mobile. No hamburger menu.
-
