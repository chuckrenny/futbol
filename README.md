# FUTBOL PROJECT

## SCHEDULE/CHECKINS/RETRO (MST)
**Retro:** 4th August 2023, Friday, 2:00 PM - 4:00 PM 

**Checkins:** Standup prior to Work Session, check-ins if blockers are persistent, check-in at conclusion

**Regular work sessions:** Weekdays 7:00 PM - 11:00 PM, flexible weekends

**Defined break times:** 4:00 PM - 6:00 PM 

## Project Management

**Project Management Tool:** [Trello Board](https://trello.com/b/nZVs6Do1/futbol)
1. Adopt an Agile approach, utilizing Trello to manage daily standups, tickets, and any potential backlogs.
2. GitHub is utilized for version control and code collaboration/documentation to ensure seamless integration with the development workflow.
3. Weekly retro to assess project progress and reevaluate design and architecture structure.

**Git Workflow:** 
1. Commit/Push/Pull often.
2. Clear commit messages with prefixes (feat:, test:, doc:, fix:, refactor:).
3. Pull Requests never merged by the creator - will request review via slack each time it's submitted.
4. Pull requests will have the following: 
   - Outline of all methods developed or iterated categorized by class.
   - Potential additional work to complete and suggestions for future refactors.
5. Inline comments on commits for PR requests from reviewers.
6. All team members will be set as reviewers - both reviewers will leave comments, only required to merge.

**General Task Assignment:**
1. Initial sessions will take place together to develop method structures.
2. After grouped/paired sessions, we will divvy up methods based on return values and the level of comfort.
3. For more complex methods, we may choose to work together or split apart and come back with individual solutions.
4. Individual contributors will be responsible for pushing their tasks along the Trello task board.

## Code Design

**Summary:** We will begin by building out all objects and parsing files through the stat tracker. We will then build relevant methods in classes. Eventually, we will move methods into modules for each class and leave the classes to only have instance variables. We will perhaps also have a module for standard calculations such as percentage calculations, etc. 

**Classes:**  
- GameStat
- LeagueStat 
- SeasonStat 
- StatTracker 

**Modules:**  
- GameStatable
- LeagueStatable
- SeasonStatable

**External Files:**  
- Data files
- Sample data files
- Runner
- Spec Harness

**Open Coverage Report:** 
To Display Test Coverage
- gem install simplecov
- bundle install
- Terminal Input: open coverage/index.html

**Additional Documents:**  
[Futbol Architecture](https://miro.com/app/board/uXjVMxAWfME=/#tpicker-content)  
[Google Doc Brainstorm](https://docs.google.com/document/d/1gS0AAn056CZI1Cn7MSnpMDbgAODSe6wiQGfNmsCnGRE/edit)  
[DTR Document](https://docs.google.com/document/d/1ge9dOOicZM7uRql86bdureXG470FcPbfWdJxfzakB2k/edit)  

## Contributors:
- Charles Ren - [GitHub](https://github.com/chuckrenny), [LinkedIn](https://www.linkedin.com/in/charles-ren-42673816b/)
- Antoine Aube - [GitHub](https://github.com/Antoine-Aube), [LinkedIn](https://www.linkedin.com/in/antoine-aube-4b40a11b3/)
- Jimmy Trulock - [GitHub](https://github.com/JimmyTrulock), [LinkedIn](https://www.linkedin.com/in/thomas-trulock-253976281/)
