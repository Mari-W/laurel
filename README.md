# Laurel

Laurel is a combination of multiple services into one learning platform, with a single login. It includes (but is not
limited to):

- Authentication
    - Connects to the University LDAP server and acts as OpenID Connect provider for all laurel
      services
    - See more [here](https://github.com/Mari-W/laurel-auth-server)
- Customized Git
    - Permission control (on a directory level, using git-hooks)
    - Custom templates with minimal distraction for students
    - Templates include custom logic to show available courses, tutors, exercise deadline, gradings, etc
    - See more in the gitea-exercises directory
- Courses Management
    - Create Courses and Exercises which will automatically create corresponding repositories/directories in Gitea and
      channels/teams in Rocket Chat
    - Add Tutors which all get the needed permissions to perform grading, etc
    - API for fetching exercise point distributions among students, time spent on exercises, etc
    - See more [here](https://github.com/Mari-W/laurel-courses-server)
- Exam Management
    - Provides network directories per student based on template directory
    - During exams all work will always be saved on the server, when editing files inside the mounted network folder locally
    - See more [here](https://github.com/Mari-W/laurel-exam-server)
- Build Server
    - Very simple build service using docker
    - Uses dependency graph of commands to execute
    - Gitea support
    - Triggers on student pushes
    - See more [here](https://github.com/Mari-W/laurel-build-server)
- Chat
    - Rocket Chat instance with channels for each exercise (per course) and global team channel for each course (can be used for
      announcements)
    - Is connected to Jitsi, can be used for tutorial sessions
- Tutor CLI
    - Fetches assigned students, takes care of cloning, pulling and pushing to all student repositories
    - Appends build logs to README files
    - Validates grading, so that no student is left out

# Setup Instructions

setup instructions for one specific service can be found in its directory

1. create new docker network named laurel: `docker network create laurel`
2. setup traefik-proxy
3. setup postgres-sql
4. setup auth-server
5. setup rocket-chat
6. setup gitea-exercises
7. setup courses-server
8. setup build-server
9. setup exam-server
