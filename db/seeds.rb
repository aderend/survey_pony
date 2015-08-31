bojack = User.create!(username: "bojack_horseman", email: "bojack@horse.com", password: "1234")
carolyn = User.create!(username: "princess_carolyn", email: "caroline@cat.com", password: "1234")
todd = User.create!(username: "todd_chavez", email: "todd@human.com", password: "1234")
vincent = User.create!(username: "vincent_adultman", email: "vincent@human.com", password: "1234")
sextina = User.create!(username: "sextina_aqaufina", email: "sextina@dolphin.com", password: "1234")
neal = User.create!(username: "neal_mcbeal", email: "neal@seal.com", password: "1234")


survey_1 = bojack.created_surveys.create(title: "Bojack Horseman, One Trick Pony")

survey_2 = bojack.created_surveys.create(title: "OR")


s1_q1 = survey_1.questions.create(body:"Which folder on Bojack's laptop would you be most inclined to open?")
s1_q2 = survey_1.questions.create(body:"Who was your favorite guest appearance on JD Salinger's Hollywoo Stars and Celebrities: What Do They Know? Do The Know Things?? Let's Find Out!'")
s1_q3 = survey_1.questions.create(body:"Which one of these stars is likely going places?")
s1_q4 = survey_1.questions.create(body:"With whom was Princess Carolyn's relationship most mature...")

s2_q1 = survey_2.questions.create(body:"Tomato or Tomato?")
s2_q2 = survey_2.questions.create(body:"Soup or Salad?")
s2_q3 = survey_2.questions.create(body:"Paper or Plastic?")
s2_q4 = survey_2.questions.create(body:"Potato or Potato?")


s1_q1_choices = ["Bojack fan club","Horsin' around fan club","Not_porn_2"]
s1_q1_choices.each { |choice| s1_q1.choices.create(body: choice)}

s1_q2_choices = ["Bojack Horseman","Daniel Radcliffe","Lance Bass"]
s1_q2_choices.map! { |choice| s1_q2.choices.create(body: choice)}

s1_q3_choices = ["Sara Lynn","Sextina Aquafina","Quentin Tarantullno"]
s1_q3_choices.map! { |choice| s1_q3.choices.create(body: choice)}

s1_q4_choices = ["Vincent Adultman","Bojack Horseman","Rutabaga Rabbitowitz"]
s1_q4_choices.map! { |choice| s1_q4.choices.create(body: choice)}


s2_q1_choices = ["Tomato","Tomato","Neither"]
s2_q1_choices.each { |choice| s2_q1.choices.create(body: choice)}

s2_q2_choices = ["Soup","Salad","Neither"]
s2_q2_choices.map! { |choice| s2_q2.choices.create(body: choice)}

s2_q3_choices = ["Paper","Plastic","bananas"]
s2_q3_choices.map! { |choice| s2_q3.choices.create(body: choice)}

s2_q4_choices = ["Potato","Potato","Potato Soup"]
s2_q4_choices.map! { |choice| s2_q4.choices.create(body: choice)}


taken_1 = TakenSurvey.create(survey_id: 1, taker_id: 3)
taken_2 = TakenSurvey.create(survey_id: 1, taker_id: 5)
taken_3 = TakenSurvey.create(survey_id: 1, taker_id: 2)
taken_4 = TakenSurvey.create(survey_id: 2, taker_id: 2)
taken_5 = TakenSurvey.create(survey_id: 2, taker_id: 4)
taken_6 = TakenSurvey.create(survey_id: 2, taker_id: 5)

[1,5,8,10].each {|choice| taken_1.selections.create(choice_id: choice, user_id: taken_1.taker_id)}
[2,4,8,10].each {|choice| taken_2.selections.create(choice_id: choice, user_id: taken_2.taker_id)}
[3,6,7,11].each {|choice| taken_3.selections.create(choice_id: choice, user_id: taken_3.taker_id)}
[14,16,19,22].each {|choice| taken_4.selections.create(choice_id: choice, user_id: taken_4.taker_id)}
[15,16,20,23].each {|choice| taken_4.selections.create(choice_id: choice, user_id: taken_5.taker_id)}
[13,18,20,24].each {|choice| taken_4.selections.create(choice_id: choice, user_id: taken_6.taker_id)}