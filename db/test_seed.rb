des = User.create(nickname: "dhnaranjo", name: "tom tom", email: "d@tom.com", uid: "123456", provider: "github", token: "654321", cohort: Cohort.find_by(name: 'Fiery Skippers'))
josh = User.create(nickname: "jmharvey0", name: "tom tom", email: "j@tom.com", uid: "123457", provider: "github", token: "654321", cohort: Cohort.find_by(name: 'Rock Doves'))
alycit = User.create(nickname: "alycit", name: "tom tom", email: "a@tom.com", uid: "123458", provider: "github", token: "654321", cohort: Cohort.find_by(name: 'Staff'))

(1..10).each do |n|
  Pitch.create(title: "Pitch #{n}", description: "Wow!", pitchers: alycit.nickname, user: alycit)
end
