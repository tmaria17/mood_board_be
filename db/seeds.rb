require 'date'

current_date = Date.today

user_1 = User.create(name: "Kelly Smith", password: "password", email: "kelly_smith@email.com", refresh_token: "ReWxYFNYJdA-O7_fn65R0Irx47VE39aZTQtkVbL8NWrj9rricJvq6kcOm2jCx5hQVDAorovhTaE2CkPAQviCs5z_1W_l-zR1y-JIiqmlKaflKt1wZIyBbzyrRJ_-RBCDcu1RLDHticJ-6E7jkvxTnYha7p1roPH9XxIDinqfDmnR-fSkc6XPCKkRn5R_To-yTGQXH5FRaFbVRd-T5R8doYB3Ck4nownlDUaII2e7JwPwNcOLbDrb-E_uhScnWt7wISI4-P9bu3kpzQQBoH9HTx8y4AQ6h2A_R0_cMZW94bmWBze8q0AquwdjuMHNi2nwoAq3GE3hGzWP9OIvhyDscNpdVaakVMpCc1BrzPktznYTrZO5EgQIHISipTxkqZ-8PqQX7ldnmw0iA-A4MwiV0tHH1iNCN3GtmINVkx2g6U5xspWVcrihyuIEJMF4QqgXCkCr7vWMuwKIMIX1S2D_lw4h6wz61TmR86beF9_13Xs9INzbhL7IYTkR49_XuwXAovQozqVfdrYBELXQf2ZVoexpe4IgLCVVcguU-8cIYtokXiS9kFn8tki6atTxBb8zFkGO3HVio-LSE9bx2FLald_it4_muWBFkSk24xZ8c8yGq978gHRTJRt6P5JIjKJIEgWbXzbne5NV7vwpXFisSQMEUpsa0MXTuAbPRhmxnMV6zfDHDKYbzNBLoMgKyPDRIxN5GHwbGWfmbfVIQeat19WtvoT8y1BlQYCj7aHkwTJKwZvN2CKCGwd3d_AM_fSEd1u0AzUPzY2WKiFfIRB2smREg-ETrBRixmh39tenqiS9FzxcTD7WITKQM8OeZkRuR3e-nLOfaA_CpgtFsysGRDvcApDhMLW9Q2pc8OqtcnTwM9QFzaK2RENQ_WvjsIR_dv1odUA7wM-WyjTFBa36u350qmpZwDxpSKLaFISkx19yJToaqmuJfNFT2kHJ-JEn-P5ldI9peMr7MvfTUISZO-sP")

entry_1 = JournalEntry.create(entry_text: "We had a quiet holiday - actually it got messed up. My father-in-law decided to act like an ass. So I had a bad start. Now I find I have a reacurring ear infection and am now on my second round of antibiotics - Why can't I get a damn break in my writing career? Is it so damn hard to be a writer? I'm so annoyed with all of this back and forth that goes nowhere. Its because of incompetent people in the publishing industry", user: user_1, created_at: current_date - 1.days)

ToneResponse.create(primary_tone: "anger", primary_score: 0.57, journal_entry: entry_1, created_at: current_date - 1.days)

entry_2 = JournalEntry.create(entry_text: "I guess it was inevitable, but I have had some problems with my book and the website. In fact a few days ago, I was very depressed. I worked and continue to work very hard on my writing, but I dont think it means anything important. When I finally recieved a copy of the book in the mail it was of poor quality. Then there were problems with pricing. I just cannot justify charging too much for my book. Then there were problems with the website. Combine all that with the frustration of not getting work yet, and I was a mess! The good news is I contacted my publisher and explained everything to him. Hopefully my book will be a success.", user: user_1, created_at: current_date - 2.days)

ToneResponse.create(primary_tone: "sadness", primary_score: 0.57, journal_entry: entry_2, created_at: current_date - 2.days)

entry_3 = JournalEntry.create(entry_text: "I recently recieved an unusual email.  It was from a gentleman who wants a book written.  Apparently it will be for his son.  He has notes and ideas but needs some help.  He wants me to write it.  I am excited but a little nervous.  It will be my first paying job.  I have never really taken on an endeavor like this before. However I think I can do it.  I have written him, as I need the information. I also think I need a contract of some sort. I guess we will work everything out, when I hear from him - at least I hope so.", user: user_1, created_at: current_date - 3.days)

ToneResponse.create(primary_tone: "tentative", primary_score: 0.67, journal_entry: entry_3, created_at: current_date - 3.days)

entry_4 = JournalEntry.create(entry_text: "Well along with disappointments, come triumphs! I have some job leads. I got a call from the publishign company that the individuals will send me what is owed. I have had some more work published, and that makes me happy. I have had some luck lately, so I hope it continues. I have had some help along the way though. My mother-in-law has helped me and given me encouragement when I needed it most. I look forward to more accomplishments in the future.", user: user_1, created_at: current_date - 4.days)

ToneResponse.create(primary_tone: "joy", primary_score: 0.79, journal_entry: entry_4, created_at: current_date - 4.days)

entry_5 = JournalEntry.create(entry_text: "I am still battling to get the money owed to me by this company Elite Corner. I have written up a collection letter and sent it. I have not heard from them but know that I will. A gentleman wrote to me telling me they owed him money too and we are now corresponding. He thinks he may get the payment but I know we will. The whole thing is a scam, but I'm going to fight it. On a better note, I wrote a press release for my book. I am now getting payment for writing one for a client. I am happy about finally making some money. I am looking into other avenues as well.I will be able to concentrate more on my writing when I am alone.", user: user_1, created_at: current_date - 5.days)

ToneResponse.create(primary_tone: "confident", primary_score: 0.79, journal_entry: entry_5, created_at: current_date - 5.days)

entry_6 = JournalEntry.create(entry_text: "Recently I started a blog. My boyfriend had time off from work and visited an internet cafe and read my entries. Normally that would make me nervous, however it was a good thing. He phoned me and told me that he was cooking me dinner and that he was picking up the necessary ingredients. I was shocked! He came home and I was barricaded in our bedroom while he prepared the meal. Finally, it was ready. I came out to a candlelit dinner and a lovely stir-fry and caesar salad my favourite. He had even bought me a dozen orange roses which were lovely. It was a nice evening and we spent the rest in bed watching television.I am the type of person who is shy and sometimes I can't express my feelings verbally.  I guess that is what drew me to writing and poetry.  I was hesitant about blogging, but I think it just may be a relationship builder.", user: user_1, created_at: current_date - 6.days)

ToneResponse.create(primary_tone: "analytical", primary_score: 0.69, journal_entry: entry_6, created_at: current_date - 6.days)

entry_7 = JournalEntry.create(entry_text: "I think finally I may have an actual writing job. I have submitted some articles for a particular site. I have had alot of emails with this individual back and forth. Finally he has agreed to pay me for my work. I am awaiting answer this week as to the prior work. I would like to get some payment before I continue writing. I think that is only fair. I am crossing my fingers that everything works out. It is not alot of compensation, but I am going to fight for my personal worth.", user: user_1, created_at: current_date - 7.days)

ToneResponse.create(primary_tone: "confident", primary_score: 0.77, journal_entry: entry_7, created_at: current_date - 7.days)

entry_8 = JournalEntry.create(entry_text: "Today was actually really tough. I was late to work, and when I got in Sharon yelled at me. Like, actually yelled. Why is she such a bully?", user: user_1, created_at: current_date - 8.days)

ToneResponse.create(primary_tone: "fear", primary_score: 0.69, journal_entry: entry_8, created_at: current_date - 8.days)

Affirmation.create(created_at: current_date - 2.days, affirmation_text: "I am smart.", user: user_1)
Affirmation.create(created_at: current_date - 2.days, affirmation_text: "I am smart.", user: user_1)
Affirmation.create(created_at: current_date - 3.days, affirmation_text: "You can do this.", user: user_1)
Affirmation.create(created_at: current_date - 4.days, affirmation_text: "Believe in yourself.", user: user_1)
Affirmation.create(created_at: current_date - 5.days, affirmation_text: "You are loved.", user: user_1)
Affirmation.create(created_at: current_date - 6.days, affirmation_text: "I am important.", user: user_1)
Affirmation.create(created_at: current_date - 7.days, affirmation_text: "I am worthy.", user: user_1)
Affirmation.create(created_at: current_date - 7.days, affirmation_text: "I am worthy.", user: user_1)

puts "seed done!"
