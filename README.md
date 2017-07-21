# Perfect Pitch
Application that allows DBC phase 3 students to vote on final project pitches.

[![CircleCI](https://circleci.com/gh/chi-rock-doves-2017/dbc-pitch-day-voting.svg?style=shield)](https://circleci.com/gh/chi-rock-doves-2017/dbc-pitch-day-voting)

## Team Pitch
| Members Names  | Github Handles |
| -------------- |:--------------:|
| Rachel Kerner  | *bb8bear* |
| James Moody | *jameswmoody* |
| Desmond Naranja | *dhnaranjo* |
| Josh Harvey | *jmharvey0* |

## Local Setup
1. Clone the Repo. Click [here](https://help.github.com/articles/cloning-a-repository/) if you need more information
2. Change to the directory
```
$ cd dbc-pitch-day-voting
```
3. Bundle install
```
$ bundle install
```
4. Create and migrate the database with rake commands
```
$ bundle exec rake db:create

$ bundle exec rake db:migrate
```
5. Run the Rails server
```
$ rails server
```
6. Open [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) and go to localhost:3000 t o view the Perfect Pitch
7. Vote on the Pitches, or create new ones. See the *How to Perfect Pitch* section

## How to use Perfect Pitch
> I don't know how to use this app yet SAD FACE

## Overall
- Total guest wall.
- Invite functionality.
- Mobile first.
- DBC style guide.
- Jumbotron landing page.
- Store user email.
- CSS Grid.
- Github account creation/login.
- When pitching is over, “Voting in Progress” view for P1/P2.

## Voting
- Top 5 ranking.
- Ranked choice.
- 2 rounds of voting.
- Restricted to P3.
- Save user ranking in order - can edit.
- Ranking is not submitted until voting closes.

## Pitches
- Show winning pitches.
- Fields: Pitches, App Name, Description.
- No edits of pitches after closing.

## Teams
- Based on preferences.
- Align user teams w/votes.
- Teachers can rank student relations.
- Team selection based on their pitch votes.

## Admin
- Explicit ending of pitches.
- Admin/Teacher sets “Pitch Day”
- \# of teams
- Date
- Pitches
- \# of last round pitches



### Resources
[simplecov](https://github.com/colszowka/simplecov)
[rspec/rails](https://github.com/rspec/rspec-rails)
[capybara](https://github.com/teamcapybara/capybara)
[octokit](https://github.com/octokit/octokit.rb)
