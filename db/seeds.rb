# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ps = [  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ipsa pariatur repudiandae, eaque molestiae impedit fuga ex! Recusandae officia nulla minima voluptatum, molestiae dolor incidunt, obcaecati quae, deleniti officiis unde.",
    "Impedit consequatur iste expedita deleniti. Ea vero adipisci, blanditiis animi aut ratione, accusamus mollitia quibusdam eveniet iusto corporis at ullam maiores alias voluptatum explicabo cum laudantium velit totam recusandae voluptate.",
    "Iure facilis modi fugit recusandae, cupiditate neque. Dolore, provident a autem odit aliquid amet, sint saepe quis architecto vel. Enim atque repudiandae culpa ipsam incidunt, maxime dolorum vero impedit ex.",
    "Animi corrupti labore odio perferendis tenetur, placeat sit nostrum eligendi reprehenderit ipsum, ipsa et, officiis ad! Non quibusdam odio, sequi in cumque obcaecati, quas enim eveniet vel modi quos dolorum.",
    "Voluptate cupiditate atque, porro error dolores alias dolorum quia dolore eaque odio ipsum harum provident soluta iste rem totam magnam repellat nesciunt corrupti iusto quod similique mollitia corporis minima. Veniam.",
    "Illo enim ratione ipsa! Recusandae cupiditate, nisi numquam voluptatem voluptatum temporibus iusto culpa quibusdam delectus aliquam! Quibusdam hic, quae animi, corporis vel autem quam voluptatem ullam ratione quod doloremque, placeat.",
    "Non, dignissimos! Saepe iusto, repellat accusamus officiis doloribus culpa rerum dolor vero voluptatum perferendis! Ipsa libero quasi totam, blanditiis voluptatem, dolorum, temporibus repellendus incidunt deserunt, et quisquam maiores nobis minima.",
    "Minima dignissimos asperiores repellat eveniet. Itaque enim, rem quasi cupiditate, maxime quaerat eaque rerum doloribus autem cumque deserunt molestias magnam dolor dolores voluptatum nobis iste delectus dicta quis architecto recusandae.",
    "Optio laborum facere maxime voluptatem animi ad assumenda fugit nam aliquam dolor, eveniet, saepe officia expedita maiores vitae. Esse culpa magni accusamus. Laboriosam explicabo eos omnis magnam amet ipsum, maiores.",
    "Repellat, velit qui neque eaque a, recusandae corporis pariatur commodi. Numquam vel recusandae, unde quasi iste, dignissimos voluptas eius odio sequi nesciunt ipsum veritatis animi tempora soluta, quo dicta voluptates."]

as = ["It is certain.",
"It is decidedly so.",
"Without a doubt.",
"Yes, definitely.",
"You may rely on it.",
"As I see it, yes.",
"Most likely.",
"Outlook good.",
"Yes baby.",
"Signs point to yes.",
"Reply hazy try again.",
"Ask again later.",
"Better not tell you now.",
"Cannot predict now.",
"Concentrate and ask again.",
"Don't count on it.",
"My reply is no.",
"My sources say no.",
"Outlook not so good.",
"Very doubtful."]

qs = ["At what age is a person an adult? Why do you think so?",
"If could change one rule that your family has, what would you change?",
"What is something that makes your family special?",
"Of all the things you are learning, what do you think will be the most useful when you are an adult?",
"Are you a good friend? Why do you think so?",
"How would the world be different if animals could talk?",
"Would you cheat on a test if you knew you would not get caught? Why or why not?",
"If you could grow up to be famous, what would you want to be famous for?",
"If you could be invisible for a day, what would you do?",
"What is the best gift you have ever given? Why was it so special?",
"What is the hardest thing about being a kid?",
"If you were a teacher, and the kids in your class would not listen to you, what would you do?",
"Where is your favorite place in the world?",
"If you could give one gift to every single child in the world, what gift would you give?",
"If you could travel back in time three years and visit your younger self, what advice would you give yourself?",
"What five words do you think most describe you?",
"If you could invent something that would make life easier for people, what would you invent?",
"When was a time that you felt lucky?",
"What do you think would be the hardest thing about being blind?",
"If you could make one rule that everyone in the world had to follow, what rule would you make? Why?"]

names = ["jimbo", "dennis", "kim", "bethalyser", "Beatric"]

(1..20).to_a.each do |i|
  name = "#{ names.sample }#{ i }"
  email = "#{name}@askterix.com"
  User.create({:name => name, :email => email, :password => "chicken", :password_confirmation => "chicken"})
end

Users = User.all.to_a

(1..50).to_a.each do |i|
  user = Users.sample
  title = qs.sample
  n = (1..10).to_a.sample
  text = ps.sample(n).join('
  ')
  q = Question.create({ :title => title, :text => text, :user_id => user.id, :score => 1 })
  p q.errors
end

Questions = Question.all.to_a

(1..200).to_a.each do |i|
  user = Users.sample
  question = Questions.sample
  coin = [1,2].sample
  if coin == 1
    text = as.sample
  else
    n = (1..10).to_a.sample
    text = ps.sample(n).join('
    ')
  end
  Answer.create({:text => text, :user_id => user.id, :question_id => question.id, :score => 1})
end

Answers = Answer.all.to_a
