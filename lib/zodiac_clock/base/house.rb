# 1st	Aries	Vita	Life	House of Self	Physical appearance, traits and characteristics. First impressions. General outlook into the world. Ego. Beginnings and initiatives.[8]
# 2nd	Taurus	Lucrum	Wealth	House of Value	Material and immaterial things of certain value. Money. Belongings, property, acquisitions. Cultivation and growth. Substance. Self-worth.[9]
# 3rd	Gemini	Fratres	Brothers	House of Communications	Early education and childhood environment. Communication. Happiness. Intelligence. Achievements. Siblings. Neighborhood matters. Short, local travel, and transportation.[10]
# 4th	Cancer	Genitor	Parent	House of Home and Family	Ancestry, heritage, roots. Early foundation and environment. Mother or mothers as figure. The caretaker of the household. Comfort. Cyclic end of matters.[11]
# 5th	Leo	Nati	Children	House of Pleasure	Recreational and leisure activities. Things which makes for enjoyment and entertainment. Games and gambling. Children. Love and romance. Creative self-expression.[12]
# 6th	Virgo	Valetudo	Health	House of Health	Routine tasks and duties. Skills or training acquired. Jobs and Employments. Health and overall well-being. Service performed for others. Caretaking. Pets and small domestic animals.[13]
# 7th	Libra	Uxor	Spouse	House of Partnerships	Close, confidante-like relationships. Marriage and business partners. Agreements and treaties. Matters dealing with diplomatic relations of all kinds, including open (known) enemies. Attraction to qualities we admire from the other partner.[14]
# 8th	Scorpio	Mors	Death	House of Reincarnation	Cycles of Deaths And Rebirth. Sexual relationships and deeply committed relationships of all kinds. Joint funds, finances. Other person's resource. Occult, psychic and taboo matters. Regeneration. Self-transformation.[15]
# 9th	Sagittarius	Iter	Journeys	House of Philosophy	Foreign travel and foreign countries. Culture. Long distance travels and journeys. Religion. Law and ethics. Higher education. Knowledge. Experience through expansion.[16]
# 10th	Capricorn	Regnum	Kingdom	House of Social Status	Ambitions. Motivations. Career. Status in society. Government. Authority. Father or father figure. The breadwinner of the household. One's public appearance/impression at-large (audience).[17]
# 11th	Aquarius	Benefacta	Friendship	House of Friendships	Friends and acquaintances of like-minded attitudes. Groups, clubs and societies. Higher associations. Benefits and fortunes from career. One's hopes and wishes.[18]
# 12th	Pisces	Carcer	Prison	House of Self-Undoing

class House
  attr_reader :number
  attr_reader :title
  attr_reader :interpretation

  def initialize(number, title, interpretation)
    @number             = number
    @title              = title
    @interpretation     = interpretation
  end
end