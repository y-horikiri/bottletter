yhorikiri = User.create(name: 'yhorikiri')
yhorikiri.letters.create!(content: <<~"EOS"
  Bottletterの使い心地はいかがですか？
  ご意見などあれば作者Twitter（画面右下）までご連絡いただけると助かります。
EOS
                         )

# 偉人
socrates = User.create(name: 'Socrates')
socrates.letters.create!(content: <<~"EOS"
  本をよく読むことで自分を成長させていきなさい。
  本は著者がとても苦労して身に付けたことを、たやすく手に入れさせてくれるのだ。
EOS
                        )

socrates.letters.create!(content: <<~"EOS"
  自分自身が無知であることを知っている人間は、自分自身が無知であることを知らない人間より賢い。
EOS
                        )

# ミュージシャン
clapton = User.create(name: 'Eric Clapton')
clapton.letters.create!(content: <<~"EOS"
  ステージに上がった時、自分が一番上手いと思え。
  ステージを降りている時、自分は一番下手だと思え。
EOS
                       )

s_clarke = User.create(name: 'Stanley Clarke')
s_clarke.letters.create!(content: <<~"EOS"
  重要なのは３P。プラクティス、プラクティス、プラクティス。それしかないよ。
  誰の手にも魔法が宿ってるわけじゃないんだ。
EOS
                        )

# マンガ、アニメ
steel = User.create(name: 'Steven Steel')
steel.letters.create!(content: <<~"EOS"
  真の失敗とはッ！ 開拓の心を忘れ！
  困難に挑戦する事に、 無縁のところにいる者たちのことをいうのだッ！
EOS
                     )

rebecca = User.create(name: 'うみの むこうの レベッカ')
rebecca.letters.create!(content: <<~"EOS"
  ありきたりな かぐに あきあきしてたの。
  だから DIYしちゃったのよ！
  ステキなかぐを アタシのために！
  だれかに このレシピを つたえたくて、
  ひっそりと ボトルに つめてみたの。
  ざいりょうを あつめて、つくってみて！
  https://limia.jp/idea/699330/
EOS
                       )
hakase = User.create(name: 'でんせつの しょくにん ハカセ')
hakase.letters.create!(content: <<~"EOS"
  こないだ マラソンで ランナーズハイに
  なったんだけど、そのときに
  こんなDIYのレシピが おりてきたんだ！
  みんなにも つくってほしいから レシピを
  おしえるぞ！ へへっ、おどろくなよー？
  はりきりすぎて ケガするなよ！
  https://kurashinista.jp/articles/detail/5757
EOS
                      )

miyabi = User.create(name: 'みやび')
miyabi.letters.create!(content: <<~"EOS"
  かがみがひとつあると みだしなみを
  ととのえるのに すごくべんりなんですよ。
  ステキなかがみの つくりかたを
  いれておくので つくってみてくださいね。
  かがみをつかって いまのイメージに
  ピッタリのあなたに なれますように。
  https://hands-media.jp/795
EOS
                      )
