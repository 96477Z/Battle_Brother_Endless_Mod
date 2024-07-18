var TranslateShiJian_WenBen2 = function(text)
{
//传奇 扎营
	text = text.replace("Afer a well deserved rest, the company Sergeant hands you a report from the previous nights activites.", "好好休息之后，营地管理给了你一份这几天情况的报告。");

	
//SS
//crcheck_difficulty_event
	text = text.replace("Nothing in particular but a periodical event for you to optimize the strength difficulty after played a fair long time, aiming to help you have a better experience.", "没有什么特别的，只是一个定期的事件，让您在玩了一段时间后调整战力难度，旨在帮助您获得更好的体验。");
	text = text.replace("This event changes nothing but your party strength and is not multiplicable, i.e. difficulty is determined by the most recent choice.", "这一事件只会改变你的队伍的战力，不可倍增，即难度取决于最近的选择。");
	text = text.replace("Easy difficulty set.", "设定为简单难度。");
	text = text.replace("I have full confidence in your courage, devotion to duty, and skill in battle. We will accept nothing less than full victory. Good Luck!", "我对你的勇气、对责任的忠诚和战斗技巧充满信心。我们将接受完全胜利。祝你好运");
	text = text.replace("Normal difficulty set.", "设定为一般难度。");
	text = text.replace("Success consists of going from failure to failure without loss of enthusiasm.", "成功在于从失败走向失败，而不丧失热情。");
	text = text.replace("Expert difficulty set.", "设定为专家难度。");
	text = text.replace("Nothing great is done without great men, and they are great because they wanted it.", "没有伟人就不会有伟大的成就，他们之所以伟大是因为他们想要。");
	text = text.replace("Legendary difficulty set.", "设定为传奇难度。");
	text = text.replace("For the enemy is strong. He may hurl back our forces. Success may not come with rushing speed, but we shall return again and again.", "因为敌人是强大的。他可能会击退我们的军队。成功可能不会以飞快的速度到来，但我们会一次又一次地回来。");
	text = text.replace("Extreme difficulty set.", "设定为极端难度。");
	text = text.replace("I have nothing to offer but blood toil, tears, and sweat.", "我所能奉献的只有热血、辛劳、眼泪和汗水。");
	text = text.replace("Insane difficulty set.", "设定为疯狂难度。");
	text = text.replace("Despise the enemy strategically, but take him seriously tactically.", "战略上轻视敌人，战术上认真对待敌人。");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
//no_food_event.nut
	text = text.replace("Food stocks have run out!", "食物储备已经用完了！");
	text = text.replace(/Despite the horrors of this world, the (.*?) can\'t be fielding a company of skeletons!/, "尽管这个世界有着一堆恐怖的事物，但是 $1 也不可能驱使一群不吃不喝的骷髅去战斗！");
	text = text.replace("You need to get the men food fast before they rightfully leave.", "在他们离开之前，你要让他们快点吃饭。");
	text = text.replace("Even the most loyal of men is only as good as about five or six missed meals.", "就算最忠诚的成员也只能支持两天没有食物补给。");
	text = text.replace("After that, anyone is apt to leave and get themselves fed.", "在那之后，任何人都倾向于离开为了填饱自己的肚子。");
	text = text.replace("Acquire food - and do it fast before the company falls apart!", "买些食物－在团队解散之前赶快行动！");
	text = text.replace(/You\'ve miscalculated the food reserves and placed the (.*?) into a unique danger - that of going hungry\./, "你错误地计算了食物储备并且把 $1 置于一个巨大的危机之中－断粮。");
	text = text.replace("Even the deadliest of companies would fall apart in days if it goes unfed and this company will be no different if you don\'t change things fast!", "即使是最冷血的团队也会在几天内分崩离析如果你不迅速改变现在的状况你的团队也将如此！");

//no_food_variety_event.nut
	text = text.replace("You find the mercenaries circled around a campfire, except they\'ve no real food to put over the flames.", "你发现雇佣兵簇拥在营火旁边，只是他们没有把能够被称作食物的东西放在火上。");
	text = text.replace("One throws his bowl of soup down.", "一个人将他碗里的汤倒了出来。");
	text = text.replace(/It is such a sludge that it barely moves to spill which is, honestly, quite disgusting\. (.*?) looks at you\./, "那个汤就像污泥一样粘稠的粘在碗上没有流出去的迹象，说老实话，这个实在是太恶心了。$1 看见了你。");
	text = text.replace("Sir, please, let us get some meat!", "先生，求求你了，让我们吃一些肉吧！");
	text = text.replace("Or something beyond this shite!", "或者任何一样比这个狗屎强的东西！");
	text = text.replace("A bit of variety wouldn\'t hurt, you agree.", "你同意，说有点变化不会有什么坏处。");
	text = text.replace(/(.*?) comes to you and slams a spoon on your desk\./, "$1 走到你面前，用勺子猛击你的办公桌。");
	text = text.replace("There\'s something on the spoon, but what exactly you can\'t tell.", "勺子上有东西，但你不确定那是什么。");
	text = text.replace("The mercenary leans back, thumbs jacked into his beltline, his chest growing with breath.", "雇佣兵靠在椅背上，双手插在腰间，愤怒似乎要从胸膛喷涌而出。");
	text = text.replace("Then he sighs, for he knows not to behave in such ill-manner in your presence.", "然后他叹了口气，因为他知道在你面前不该表现的这么无礼。");
	text = text.replace("But he does explain himself.", "但是他也对自己的行为做出了解释。");
	text = text.replace("Sir, the men are complaining about the food.", "先生，伙计们在抱怨食物。");
	text = text.replace("I think it\'d be great for company morale if perhaps we picked up some meats and other goods in the next town.", "我想如果我们在下一个城镇买些肉和其他食物能够鼓舞团里面兄弟的士气。");
	text = text.replace("Only a suggestion, of course.", "当然，这只是一个建议。");
	text = text.replace("He quickly leaves. You pick up the spoon and look at whatever is in the scoop of it.", "他起身走了。你拿起勺子，仔细琢磨勺子里的东西是什么。");
	text = text.replace("That... that can\'t really be what they\'re eating out there, can it?", "这个…这个不会是他们在外面吃的东西把，这东西人能吃吗？");
	text = text.replace("Perhaps some variety wouldn\'t hurt...", "也许有些变化也无妨…");
	text = text.replace(/(.*?) approaches with a bowl in hand\./, "$1 手里拿着碗向你走了过来。");
	text = text.replace("He tilts it forward, showing the contents which are colorless and slide ever so slowly down the rim of the bowl.", "他把碗向前倾斜，露出里面无色的东西，然后慢慢地沿着碗边滑下去。");
	text = text.replace("The mercenary shakes his head.", "这个雇佣兵摇摇头。");
	text = text.replace("The men are unhappy sir, and myself too, about the dinners we\'ve been eating.", "先生，同伴们今晚都不高兴，我也不高兴，就是因为这个东西。");
	text = text.replace("A man can only eat the same contents day after day for so long, especially when he knows he can afford so much more.", "一个人不可能忍受的了长时间吃同样的东西，特别是当他知道他可以担负起其他美味价格的时候。");
	text = text.replace("It is only a suggestion, sir, from myself and from all the men, that perhaps we liven up our food stocks so that not every meal is... well, this.", "这只是一个建议，先生，既是我的也是其他人的，也许我们应该增加其他粮食的储备这样就不会每顿饭都…嗯，这样。");
	text = text.replace("He sets the bowl down and walks off.", "他放下碗走了。");
	text = text.replace("A few of your mercenaries are complaining around a campfire.", "有几个雇佣兵围着营火抱怨。");
	text = text.replace("You stay within earshot, carefully listening as they might say things they wouldn\'t in your presence.", "你呆在能听到的范围内，仔细倾听因为他们可能会说一些在你面前不会说的事情。");
	text = text.replace("Thankfully, it\'s not a mutiny in motion, but instead a series of cooking criticisms.", "谢天谢地，这不是一场密谋的背叛，而是一系列对食物的批评。");
	text = text.replace("There simply is not enough variety in the company\'s food stocks.", "团队里面食品库存品种实在是太少了。");
	text = text.replace("They\'re tired of eating the same thing over and over.", "他们早已厌倦了一遍又一遍地吃同样的东西。");
	text = text.replace(/Perhaps this could be remedied in the next town the (.*?) visits\?/, "也许 $1 的食物水平应该在下一个城镇拜访中得到提高？");

//noble_more_pay_lowborn_event.nut
	text = text.replace(/(.*?) suddenly enters your tent\./, "$1 突然进入你的帐篷。");
	text = text.replace("He\'s attired in armor and his weapon is at his side.", "他穿着盔甲佩戴着武器。");
	text = text.replace("It almost seems as if he dressed up for this occasion, and he does indeed stand upright and proper.", "他看起来是精心打扮过之后来的似乎很重视这次会面的而且他确实站得很端正。");
	text = text.replace("You ask what it is he wants, and he speaks with his head held high and his eyes looking straight ahead.", "你问他想要什么，他昂着头眼睛直视前方。");
	text = text.replace(/It has come to my attention that (.*?) is paid more than I\./, "我注意到 $1 得到的报酬比我多。");
	text = text.replace("While I\'ve no issue with the man personally, I do want to point out that he is a man with no birthright to anything but his own two feet.", "尽管我对他个人没有什么意见，但是我想要指出他除了行走的双脚以外没有任何与生俱来的东西。");
	text = text.replace("You can\'t possibly have a lowborn being paid more than a man of the purple.", "一个出身卑贱的人不可能比一个出身高贵的人挣得多。");
	text = text.replace("We noblemen deserve more.", "我们贵族应该得到更多。");
	text = text.replace("You don\'t necessarily agree with him, but at the same time you can see that denying this request may cause some heretofore unseen problems..", "你不一定同意他的观点，但同时你也可以看到拒绝这个要求可能会导致一些无法预测的问题。");
	text = text.replace(/With a few dashes of your quill pen across the roster scroll, you assign (.*?) a higher salary and tell him to expect a heavier purse come next payday\./, "在花名册上划上几笔，你给 $1 分配了更高的工资，并告诉他下一个发薪日将会提高他的工资。");
	text = text.replace("The man finally looks at you and bows from the waist.", "那个人终于将眼睛转向你并且向你深深的鞠了一躬。");
	text = text.replace("You\'ve made the good and proper decision.", "你做了一个正确的决定。");
	text = text.replace("He turns on his heels and marches back out with as much gusto as he did coming in.", "他转过身来保持着那副高傲的身姿大步走了出去。");
	text = text.replace("You tell the man to look at you.", "你叫那个人看着你。");
	text = text.replace("He slowly shifts his eyes to yours.", "他慢慢地把目光转向你的。");
	text = text.replace("Having his attention, you explain how it is around here.", "在他的注视下，你解释了现在的情况。");
	text = text.replace("I pay on seniority and veterancy, not who you were before you signed the dotted line.", "我关注的是经验和战斗技巧，而不是你在签署合同之前的身份。");
	text = text.replace("You could be a goatfarmer for all I care, if you can swing a sword you\'ll get paid, and if you can swing it better than the next man then I\'ll be damned, you\'ll be getting paid more than the next man!", "我不在意你之前是个牧羊人还是其他什么的，只要你会挥剑战斗我就给你报酬，如果你的经验和战斗技巧远比其他人高超我可以向你保证，你绝对会比别人得到的更多！");
	text = text.replace("Anything in that you don\'t understand?", "你还有什么不明白的地方？");
	text = text.replace(/(.*?)\'s jowls quiver as he bottles a sudden spurt of rage\./, "$1 似乎受到了极大的侮辱脸颊不断抽动。");
	text = text.replace("He speaks through clenched teeth.", "他咬着牙说。");
	text = text.replace("No, sir.", "没有，先生。");
	text = text.replace("With a flick of a wrist, you tell him to get out of your sight.", "你挥了挥手腕，示意让他离开。");
	text = text.replace("He leaves in a hurry, his upright stance falling into a seething slouch.", "他匆忙地离开了，他原本笔直的站姿瞬间就垮了下来。");
	text = text.replace("You stand up out of your chair and yell at the man to look at you.", "你从椅子上站起来，对着那个看着你的这位成员喝骂。");
	text = text.replace("He does as told and so you explain what is going to happen.", "他会如同刚才说的那样所以你也要向他解释他将会遭遇上面样的状况。");
	text = text.replace(/(.*?) made it through this world by dragging himself out of the mud\./, "$1 通过自己的努力把自己从原来的泥潭中拉出来向这个世界证明自己的实力。");
	text = text.replace("You were born with a silver spoon, but this isn\'t where you were born now is it?", "你是出身高贵没错，但是在这里出身没有任何用处不是吗？");
	text = text.replace("So from today consider your pay effectively lowered.", "所以从今天开始思考一下为什么你的工资被降低了。");
	text = text.replace("You want the right to a higher salary? Earn it.", "你想要获得加薪的权力？证明自己。");
	text = text.replace("The noble\'s stance falters.", "贵族因为你的决定开始动摇了。");
	text = text.replace("He opens his mouth, but you quickly raise your hand.", "他张了嘴张嘴想说些什么，但你很快举起手来制止了他。");
	text = text.replace("No more words. Get out of my sight.", "别再说了。离开我的视线。");

//noble_vs_lowborn_event.nut
	text = text.replace(/You find the nobleman (.*?) and the rather ragged-looking (.*?) quarreling over the last piece of food on a spit\./, "你发现贵族 $1 和另外一个衣衫褴褛的 $1 为最后一块食物在争吵。");
	text = text.replace("Apparently the lowborn got his fork to it first, but the nobleman claimed that his high stature granted him the right to the meat.", "很明显，这个出身卑微的人先用叉子拿到了这最后一块美味，但是这个贵族声称他良好的出身赋予了他获得这块烤肉的权力。");
	text = text.replace("As the two men look to you for guidance, you fold your arms and shrug.", "当这两个人同时向你寻求帮助时，你双臂交叉耸耸肩。");
	text = text.replace("They slowly turn back to one another.", "他们慢慢地转过身来面向对方。");
	text = text.replace("The other men in the camp stand up and step back, giving room to what is coming.", "营里的人都站起来，同时退后给即将上演的大战腾出空间。");
	text = text.replace("The lowborn draws his dagger first.", "出身卑微的人先拔出匕首。");
	text = text.replace("It is a simple thing with a wooden handle and jagged, unnaturally serrated edges.", "这是一个相当简陋的武器，只有一个简单木制的把手和刀刃上很不自然的豁口。");
	text = text.replace("The nobleman pulls his blade in return, brandishing a metal that curves with the care of a blacksmith\'s mastery.", "贵族也拔出利刃来回敬他的对手，和他的对手不同的是在铁匠的良好保养与火光的照射下放出冷光。");
	text = text.replace("Two golden snakes curl up the handle to bite the pommel.", "防滑的雕纹如同两条金蛇缠绕在剑柄上最终交合成一个配饰。");
	text = text.replace("Its wielder grins, saying the riff-raff should learn their place.", "它的持用者咧嘴一笑说乌合之众应该知道自己所处的位置。");
	text = text.replace("The lowborn grins like a man who has had no practice doing it.", "和贵族相比那个出生卑微的人就像是一个从来没有练习过战斗的人一样。");
	text = text.replace("Surprisingly, both men then chuck the daggers into the stumps upon which they sat and close rank with fists raised, the most equal of fighting grounds.", "令人惊讶的是，两个人都把匕首扔进他们刚才坐着的树桩里握紧拳头，用最公平的方式角逐出胜利者。");
	text = text.replace("In the ensuing battle the spit is immediately knocked aside and flames fan upward, raining wild embers and the felled food is now flavored with ash and soot.", "在随后的战斗中那个烤肉的架子很快就被撞翻火焰开始不断的翻腾，灰烬被弄得到处都是并且倒下的食物现在有了灰烬和煤烟的味道。");
	text = text.replace("Seeing their meal ruined, the rest of the company finally puts an end to the combat, pulling the two men apart.", "眼看着那两人的烤肉被毁了，其余的伙伴终于开始制止这场争斗，把两个人拉开。");
	text = text.replace("They threaten and spit at one another, but after a few minutes everything settles down.", "他们互相威胁互相吐口水但几分钟后一切又都像没有发生过一样。");
	text = text.replace(/(.*?) looks aghast\. He slowly lifts his fork from the spit and (.*?) immediately shovels the last bit of meat into his mouth\./, "$1 看起来目瞪口呆。他慢慢地把叉子从烤肉架上里拿起来然后 $2 立刻把最后一块肉铲进嘴里。");
	text = text.replace("The nobleman gets up and heads your way.", "这个贵族起身并且向你走来。");
	text = text.replace("He straightens before you, bumping his chest into yours as you lock eyes.", "他在你面前挺直身子，紧贴着你的你能感觉到他现在满腔的愤怒。");
	text = text.replace("A few of the men put their hands on their pommels.", "有几个人把他们的手放在了剑柄上面。");
	text = text.replace("Siding with the lowborn, huh?", "站在平民那一边，哏？");
	text = text.replace("I fancied you would, being lowborn yourself.", "我就应该猜到，毕竟你自己也是个贱民。");
	text = text.replace("Don\'t ever expect to become one of us.", "永远不要期望成为我们中的一员。");
	text = text.replace("You\'re a sellsword for life. Remember that.", "你这辈子只配做一个佣兵。记住这一点。");
	text = text.replace("You expect to get a piece of land when all this is said and done, yeah?", "你至今为止所作的一切不就是希望得到一块土地，难道不是吗？");
	text = text.replace("I hope you do, because then I\'ll come and knock and show you how nobles really treat one another.", "我希望你能成功做到，因为在那之后我就会亲自拜访你并且告诉你一名真正的贵族应该如何对待他的同伴。");
	text = text.replace(/(.*?) grins as he knocks (.*?)\'s fork out of the way\./, "$1 咧着嘴笑着把 $2的叉子敲开了。");
	text = text.replace("The nobleman takes the food for himself as the lowborn gets up and storms toward you.", "这个贵族开始自己享受起了这个美味而那名出身卑微的人起身向你冲了过来。");
	text = text.replace("As he nears, some men look ready to draw swords, but you hold a hand out, calming them.", "当他走近时，有些人看起来准备拔出剑来，但是你挥了挥，制止了他们的行为。");
	text = text.replace("I thought you were one of us, but I guess not.", "我以为你跟我们是一伙的，但是我发现我错了。");
	text = text.replace("I suppose you think someday you\'ll be one of them, huh?", "我猜你自己认为你有一天会成为那家伙的一员，哏？");
	text = text.replace("Keep dreaming. As that man would say to me, \'Know your place\'.", "继续沉浸在你的美梦了。就像那个人跟我说的“有点自知之明”。");

//oldguard_becomes_drunkard_event.nut
	text = text.replace(/You find (.*?) nursing a rather large tankard next to a fire\./, "你发现 $1 在火堆旁边抱着一个巨大啤酒杯。");
	text = text.replace("In fact, it\'s not a tankard at all, but a wooden bucket filled with ale.", "事实上，它根本不是一个啤酒杯，而是一个装满啤酒的木桶。");
	text = text.replace("A few more modest mugs are littered about his feet.", "他的脚上散落着几只比较普通的杯子。");
	text = text.replace("He tips back, gulping from the bucket\'s lip.", "他将桶抱起来，将啤酒灌进自己的肚子里。");
	text = text.replace("When he sees you, he tries to dress up, sloughing the foam off his face and attempting a smile that quickly sloops into a drunken frown.", "当他看见你，他尝试去整理自己的仪表，抹去脸上的酒沫后尝试着露出一个微笑但很快就变成了醉醺醺的皱眉。");
	text = text.replace("Hey there, captain. Didn\'t mean for you to see me like this.", "嗨，队长。没想到你会在这时候来看我。");
	text = text.replace("You set yourself down by the man and ask how he is doing.", "你坐在那个人旁边然后问他近况如何。");
	text = text.replace("Being drunk.", "喝醉了。");
	text = text.replace("Nodding, you reach for the bucket and the man gives it up, though his hands are shaped as if to still be holding it.", "你把酒桶从他的手中拿走并且他也没有阻止，尽管他的手好像依然拿着那个酒桶。");
	text = text.replace("You set the bucket down and ask again how he is doing.", "你把酒桶放在一边并且严肃的问他现在怎么样。");
	text = text.replace("He finally drops his hands into his lap.", "他顿了顿最后将手放在自己的膝盖上面。");
	text = text.replace("Like shit. That\'s how I\'m feeling.", "就像狗屎一样。这就是我的感觉。");
	text = text.replace(/First, (.*?) went down\./, "首先，是 $1 死去。");
	text = text.replace(/Then (.*?)\. I know there\'s been at least five or six others\./, "之后是 $1。我知道的至少还有五六个人。");
	text = text.replace("Just dead men. Come and gone.", "都死了。从相识到死去。");
	text = text.replace("I got memories of them talking, and memories of them screaming, and I can\'t have one without the other.", "我忘不了，曾经和他们一起冒险的记忆，也忘不了他们临死前的惨叫，我的记忆都是由我的兄弟一起组成的。");
	text = text.replace("But I\'m alright now cause right now I can\'t even think straight.", "但是我现在已经想清楚了尽管不能想的那么简单。");
	text = text.replace("If I can\'t unlearn a memory, I\'ll just go ahead and drown it.", "如果我不能选择遗忘一段记忆，那我将无视它并且将它埋在脑海的最深处。");
	text = text.replace("The ale does me well, heh.", "这个啤酒帮我很好的完成这个过程现在它是我的兄弟了，嘿嘿。");
	text = text.replace("With a sigh, you hand the bucket back to the man.", "随着一声叹气，你心情复杂的将酒杯还给这个男人。");
	text = text.replace("Eyes lost in the fire, his mind lost in the past, he says nothing else.", "眼神盯着面前的火堆，但是他的思绪已经沉寂在过去，他默默的喝酒再也没有说话。");

//optimist_lost_battle_event.nut
	text = text.replace(/Despite a recent defeat, (.*?) still sees a bright future for the (.*?)\./, "尽管最近遭遇挫折，但是 $1 看好你的未来前景 $2。");
	text = text.replace("Not all of life can be spent standin\', fellas.", "生命的所有时间不可能总是成功度过，伙计们。");
	text = text.replace("Sometimes it\'s gotta be spent getting\' back up.", "有时候我们必须花点时间重振旗鼓。");
	text = text.replace("But we\'ll never spend it layin\' down forever, I know that much!", "但是我们不会永远的失败下去，我坚信着这一点！");
	text = text.replace("This company\'s too good for that lollygaggin\' shite.", "这个团队太棒了根本不适合那些虚度光阴的狗屎。");
	text = text.replace("The ever optimistic sellsword\'s relentless positivity rubs off on some of the men, raising their spirits and leaving them ready for the tomorrows to come.", "这个总是保持乐观的佣兵不被失败打倒的积极性感染了一些人，振奋了他们的精神让他们为明天的到来做好准备。");

//orc_land_event.nut
	text = text.replace("A cairn with an unusual skull atop it.", "一个石冢上面有一个不同寻常的头骨。");
	text = text.replace("Perhaps a memorial to a great orc warrior.", "或许是为了纪念一个伟大的兽人战士。");
	text = text.replace("No matter what it means to the greenskins, what it means to you is simple: you\'re in their territory now.", "无论它对那些绿皮有什么意义，它对你的意义很简单：你们现在在它们的地盘上。");
	text = text.replace(/You come across a wooden totem with curvatures cut into it\. (.*?) believes that they are traces of the night sky, perhaps of this constellation or that\./, "在前进的过程中你遇到了一个刻着曲线花纹的木头图腾。$1 相信这些曲线表示夜空的痕迹，也许是这个或者那个星座的痕迹。");
	text = text.replace(/(.*?) spits and says all it means is that you\'re in orc territory and you\'d best pay better mind to that than what the lights in the night are doing\./, "$1 吐了一口唾沫然后提醒到这些都表明我们在兽人的地盘上你最好注意这一点而不是在夜晚的火光下面做些什么无意义的事情。");
	text = text.replace("You find bones in the grass.", "你在草丛里面找到一具骨头。");
	text = text.replace("The curvature of the ribs is obscene - far too large for a man.", "肋骨弯曲的可怕－远远超过一个正常男人。");
	text = text.replace("You wonder if it is that of a donkey, but the discovery of an enormous and oddly human-shaped skull confirms your suspicions: you\'ve come onto orc territory.", "你想知道这个是否属于一个驴子，但是一个巨大并且奇怪的人形头骨的发现确认了你的想法：你们已经进入了兽人的地盘。");
	text = text.replace("Human heads on spikes.", "人头桩。");
	text = text.replace("Their bodies - limbless - clumped into piles.", "他们的肢体被挤成一堆。");
	text = text.replace("They\'ve been cut and mutilated.", "他们已经被破坏的残缺不堪。");
	text = text.replace("The only sense of humanity they have left are the shreds of clothes barely clinging to their destroyed flesh.", "唯一能证明他们曾经是人类的是这些被遗留在这堆破碎血肉上的衣服碎片。");
	text = text.replace(/(.*?) comes up, nodding\./, "$1 过来，点了点头。");
	text = text.replace("We\'ve stepped into some shit now.", "我们现在已经陷入这个该死的困境里面。");
	text = text.replace("This is orc territory.", "这里是兽人的地盘。");
	text = text.replace("You come across a man\'s body, but not his head.", "你遇到是一个人的身体，但不是他的头。");
	text = text.replace("That\'s gone. His genitals are also gone.", "那个不见了。他的生殖器也不见了。");
	text = text.replace("And his feet and hands.", "一起不见的还有他的手和脚。");
	text = text.replace("Javelins stick out of what\'s left, someone or something have turned what remains into gruesome target practice.", "标枪从尸体残余部位穿出，有人或者说是东西把剩下的地方当作令人恶心的练习靶。");
	text = text.replace(/Taking a close look at the weapons, (.*?) nods and turns to you\./, "仔细看了看武器，$1 点头并且转向你。");
	text = text.replace("Orcs, sir. We\'re in their lands now and, uh, clearly they don\'t take kindly to trespassers.", "是兽人，先生。我们现在已经在它们的地盘上并且，呃，很明显他们对闯入者不太友善。");
	text = text.replace("You find a shattered skeleton nailed to a tree by an enormous axe.", "你发现了一具被一个巨大斧头钉在树上的破碎骨架。");
	text = text.replace("It\'s mostly just the chest cavity for the rest of it has long since fallen apart.", "它大多只有胸腔其余的部分早就分崩离析。");
	text = text.replace("Long, curving artwork has been carved into the tree trunk.", "长长的，弯曲的艺术作品被雕刻在树干上。");
	text = text.replace("This is greenskin territory.", "这里是绿皮的地盘。");
	text = text.replace(/(.*?) talks as he walks up to you\./, "$1 边说边向你走来。");
	text = text.replace("He touches the handle of the axe, its weight almost as sturdy as the tree it\'s embedded in.", "他摸了摸斧柄，斧柄的重量几乎和嵌入其中的那棵树一样扎实。");
	text = text.replace("I\'d say orc territory by the looks of things...", "从外表上看，这里是兽人的地盘…");
	text = text.replace("You come to a stack of stones carefully placed on a small hillside.", "你来到一个被仔细地放着一堆石头的小山坡上。");
	text = text.replace("Inspecting them, you find white carvings on the rocks.", "仔细观察，你发现岩石上有白色的雕刻。");
	text = text.replace(/Each one displays a different story - ones where large brutes wander and cause disturbing amounts of violence toward smaller, thinner stick figures\. (.*?) laughs at the drawings\./, "每一幅画都展示了一个不同的故事－一个大型的野兽四处游荡并且不断残害画面上比它更小，更细的简笔角色。$1 嘲笑这些画。");
	text = text.replace("That\'s orc fancery - what passes for such a thing, anyway.", "这是兽人的幻想－通过这样的事情，无论怎样。");
	text = text.replace("We\'re the little men in those pictures in case you were wonderin\'.", "我们是这些图画上的小人你们竟然不知道。");
	text = text.replace("A leather tarp is found flapping from some sticks on a hill.", "在一座山上的树枝上发现有块皮革防水布正在摆动。");
	text = text.replace(/There\'s evidence of an abandoned camp around it - a smoldering fire, fleeting footprints, a few bits of odd debris. (.*?) points at it all\./, "这里有证据表明，在它周围有一个废弃的营地－一堆阴燃的火，模糊不清的脚印，一些奇怪的碎片。$1 指着这些东西。");
	text = text.replace("Their smell still lingers on all this. The smell of... Orcs.", "他们的气味仍然萦绕在这些东西上面。这是…兽人的味道。");
	text = text.replace(/(.*?) hocks and spits\./, "$1 咳嗽一声并且吐了口唾沫。");
	text = text.replace("Ya gotta strong nose for shit, sir.", "你对狗屎有很强的嗅觉，老弟。");
	//text = text.replace(/(.*?) nods\./, "$1 点头。");
	text = text.replace("It ain\'t bullshit, though.", "不过，这不是胡扯。");
	text = text.replace("We\'re in orc territory, men.", "我们在兽人的地盘上，伙计们。");
	text = text.replace(/(.*?) walks up to a stack of human skulls you\'ve come across\./, "$1 走到一堆你们之前遇到的人类头骨面前。");
	text = text.replace("He analyzes their mortal wounds - mostly the fact that their bodies are nowhere in sight, decapitation is a hell of a thing to survive.", "他分析了他们致命的伤口－主要的事实是他们的身体已经不在这里了，斩首是一件可怕的事情。");
	text = text.replace("Standing back up, he nods.", "他站起来，点头示意。");
	text = text.replace("Orcish artwork, fellas.", "兽人杰作，伙计们。");
	text = text.replace("Study it close lest you join the gallery.", "注意了，以免你也被挂在这。");
	text = text.replace("You also nod and tell the men to be aware of the dangers ahead.", "你也点头告诉他们注意前方的危险。");
	text = text.replace("There\'s a feeling to the wilderness and there\'s a feeling to civilization - and what you got here doesn\'t fit either.", "有一种对荒野的感觉，也有一种对文明的感觉－你在这里得不到任何舒适感。");
	text = text.replace("You got an odd sensation as though you\'d just trespassed unto someone else\'s territory.", "你有一种奇怪的感觉就像你刚刚闯入其他人的地盘。");
	text = text.replace("A gruesome pile of dead bodies shorn of any humanity they once had also helps make the distinction, and settle the simple matter of fact that you have now entered orcish lands.", "一堆被剥夺了一切一度能够帮助确定他们是人类这个证据的可憎的尸体，并确定了一个简单的事实，那就是你现在已经进入了兽人的地盘。");

//peacenik_event.nut
	text = text.replace("While on the path, you come across a man staring at a hole in the ground.", "正在路上走着，你遇到了一个男人，他正盯着地上的一个洞看。");
	text = text.replace("Naturally, you go over and ask what he\'s doing.", "很自然地，你走过去问他在做什么。");
	text = text.replace("He states that there\'s an orc in the pit.", "他说洞里有一只兽人。");
	text = text.replace("You look down. There is.", "你往下一看。还真有。");
	text = text.replace("Taking out your sword, you ask if you should take care of it for him. He reels back.", "你拔出配剑，问自己是否应该照顾照顾它。");
	text = text.replace("What? No! I want that alive.", "什么？不！我想让它活着。");
	text = text.replace("I think we can try and understand it.", "我想我们可以试着去理解它。");
	text = text.replace("Understand it? What is this man on about? He pleads.", "试着去理解它？这个男人在说什么？他恳求着。");
	text = text.replace("Let us merely try!", "让我们试试吧！");
	text = text.replace("Everyone kills an orc on sight, but they\'re not mere animals.", "每个人看到兽人都会杀，但它们不仅仅是动物。");
	text = text.replace("They show intelligence, and if they have intelligence it means that they can learn, and if they can learn then perhaps they can learn to coexist with us.", "它们表现出智慧，如果它们有智慧，那就意味着它们能学习，如果它们能学习，那么也许它们能学会与我们共存。");
	text = text.replace(/(.*?) the houndmaster nods and explains that an animal, no matter how intelligent or well trained, is still an animal\./, "$1 点头，解释说，不管一只动物多么聪明或训练有素，它仍然是一只动物。");
	text = text.replace("The peacenik thinks for a time.", "和平主义者想了一会儿。");
	text = text.replace("I-it\'s not a mere dog, though!", "呃－不过，它不仅仅是一只狗！");
	text = text.replace("Your houndmaster takes the man by the shoulder.", "你的驯兽师抓住那人的肩膀。");
	text = text.replace("But you\'ve cornered it like one, haven\'t you?", "但是你已经把它逼得走投无路了，不是吗？");
	text = text.replace("What do you think a man would do in this situation, all his intellect and wisdom with him, his back to a wall and enemies afoot?", "你认为一个拥有智慧的人在这种情况下会做什么，他的背后是墙而敌人就在眼前？");
	text = text.replace("This is not the place nor time for making \'peace,\' friend, whether it be with man or beast.", "现在不是交“和平”朋友的时候，无论是与人类还是野兽。");
	text = text.replace("The stranger slowly begins to nod.", "陌生人慢慢地开始点头。");
	text = text.replace("He sees the sense of the argument and, thankfully, lets you destroy the orc without any incident.", "他看到了争论的意义，谢天谢地，没有再阻碍你解决掉兽人。");
	text = text.replace("With the greenskin put away, the man gives you a satchel of crowns.", "解决掉兽人以后，那人给了你一袋克朗。");
	text = text.replace("I wanted to try and parlay with it using these.", "我想试着用这些克朗来保值增值。");
	text = text.replace("That ain\'t happening now, clearly, and I\'d probably be dead if you hadn\'t shown up.", "如果你没有出现，我现在可能已经死了，很明显，现在不会发生这种事了。");
	text = text.replace("Consider this my thanks, sellsword.", "把这当作我的谢意，佣兵。");

//peddler_deal_event.nut
	text = text.replace(/(.*?) comes to you, rubbing the back of his neck and nervously pulling on the front of his shirt\./, "$1 向你走来，用手摩擦着后颈，紧张地扯着衬衫的前襟。");
	text = text.replace("He proposes a plan wherein he goes into town with a handful of goods to peddle around, as he\'s done so often in the past.", "他提出了一个建议：让他带一些货物去城镇里卖，就像他过去经常做的那样。");
	text = text.replace("Only problem is that he doesn\'t yet have the goods - he has to buy them from some local in the nearby hinterlands.", "唯一一个问题就是他还没有货物－他得去附近港口城镇里的当地人那里购买。");
	text = text.replace("All he needs now is a bit of money to get him started and help purchase the goods.", "现在他只需要一些起始资金来购买货物。");
	text = text.replace("A sum of 500 crowns all in all.", "总计大概500克朗。");
	text = text.replace("Naturally, as a partner, you will get a cut of the profits once it\'s all said and done.", "自然，作为合作伙伴，如果一切正常进行，你能得到其中的一部分利益。");
	
	text = text.replace(/You hand (.*?) the crowns and off he goes\./, "你把克朗递给 $1，他收下并离开了。");
	text = text.replace("A few hours later, the peddler comes running up with a small lockbox in hand.", "几个小时之后，小贩手里拿着一个小密码箱跑了过来。");
	text = text.replace("The wily grin on his face is undeniable and he\'s unwittingly fistpumping as he glides to you.", "他脸上的笑容是那么地明显，甚至在跑来的时候还情不自禁地挥舞了一下拳头。");
	text = text.replace("When he tries to speak, gasps of breath seize him.", "当他停下来准备说话的时候，不由得大口喘息起来。");
	text = text.replace("You hold your hand out, telling him to take his time.", "你拍了拍他的肩膀，告诉他慢慢来。");
	text = text.replace("Settling down, the man hands over a heavy purse of coins, stating that it is your cut of the profits.", "恢复过来后，他递给你一大把硬币，说这是你的分红。");
	text = text.replace("Before you can even say anything, the man wheels on his heels and jumps away, giddy with his success.", "在你还没来得及说话的时候，他已经小跑着离开了，因他的成功而心驰目眩。");
	
	text = text.replace(/(.*?) makes off and you tend to other business for the day\./, "$1 离开了，而你转向别的工作。");
	text = text.replace("As you step out of your tent hours later, you see a slumped shape in the distance, steadily heading your way.", "几个小时后，你走出帐篷，看见了一个佝偻着身子的身影慢慢向你走来。");
	text = text.replace("It appears to be the peddler.", "他看起来像是小贩。");
	text = text.replace("He carries nothing with him but a frown.", "他两手空空，紧皱着的眉头回到了你的身边。");
	text = text.replace("As he gets closer, you begin to see the bruises that dot his body.", "当他走进时，你注意到了他身上一块块的淤青。");
	text = text.replace("He explains that while he managed to purchase the goods from his source, the actual townspeople weren\'t particularly warm to his selling tactics.", "他解释道：虽然他成功从他的渠道买到了货物，但是镇子里的居民似乎对他的销售策略不太认可。");
	text = text.replace(/What money was invested has been lost and (.*?) heads to a tent to nurse his wounds\./, "所有投资的钱都没了，而 $1 则走向帐篷去治疗他的伤势。");

//peddler_sells_rat_event.nut
	text = text.replace("For the last time, no, I won\'t buy a rat.", "最后说一次，不要，我绝对不会买一只老鼠。");
	text = text.replace(/You see (.*?) the ratcatcher turn a corner with the skeevy peddler (.*?) on his heels\./, "你看见捕鼠者 $1 转了个弯，令人讨厌的小贩 $2 则紧紧地跟在他的身后。");
	text = text.replace("The salesman throws another pitch.", "小贩再次抬高了声调。");
	text = text.replace("\'Course you won\'t buy one!", "当然你不会买！");
	text = text.replace("You\'re a ratcatcher, why would you buy one? But what if...", "你是个捕鼠者，为什么要买呢？但是如果…");
	text = text.replace("The ratcatcher stops and turns on his heels, planting a firm finger into the peddler\'s chest.", "捕鼠者停了下来并转身看着小贩，用力地用一根手指戳着小贩的胸口。");
	text = text.replace(/Pet rats don\'t go grow on trees, (.*?)! They\'re born of a different stock!/, "老鼠不是从树上长出来的，$1！他们有不同的血统！");
	text = text.replace("If I need a rat by my side I\'ll find him myself!", "如果我需要一只老鼠来陪伴我，我会自己去找！");
	text = text.replace("Now, if you got a rat you need killin\', that\'s a different matter.", "现在，如果你需要杀老鼠，那我们还能谈。");
	text = text.replace(/(.*?)\'s eyes fall to the ground, thinking for a moment\./, "$1的眼镜看向地面，想了一会。");
	text = text.replace("Suddenly, his gaze lifts along with his spirits and a pointing finger.", "突然，他抬起头来，激动地举起了一只手指。");
	text = text.replace("Ah, a goldfish then?", "额，那一只金鱼？");
	text = text.replace("Would you buy a goldfish?", "你要不要买一只金鱼？");

//pessimist_won_battle_event.nut
	text = text.replace(/Ever the downer, (.*?) mopes around, wallowing in victory as good as any pissy pessimist could\./, "令人沮丧的是，$1 没精打采地闲逛着，就像所有令人讨厌的悲观者一样破坏我们胜利的喜悦。");
	text = text.replace("He throws a dismissive hand out.", "他轻蔑地举起一只手。");
	text = text.replace("We have tasted victory and what of it?", "我们在享受着胜利，但那又怎样呢？");
	text = text.replace("Our victory was their defeat, so it very well may be that one day someone else\'s victory is going to come at our expense, don\'t you see?", "我们的胜利就意味着他们的失败，所以没准有一天会有人将他们的胜利建立在我们的失败的基础上，你们不这样认为吗？");
	text = text.replace("Let us not put the cart in front of the horse lest the shadows of morrow sneak upon us whilst we bask in this supposedly glorious light.", "所以我们不要本末倒置，以免将来的阴影在我们享受着现在着荣耀的阳光时偷偷笼罩我们。");
	text = text.replace("A few sellswords tell him to stop being such a prick, but his brunt realism tempers the zeal of others.", "一些佣兵呵斥他不要这么沮丧，但是他那冲击性的事实还是影响到了其他人的热情。");

//pimp_and_harlots_event.nut
	text = text.replace("While on the march, you come across a woman standing off the side of the road.", "在行进的时候，你遇见了一个站在路边的女人。");
	text = text.replace("She\'s standing at the head of a donkey-pulled wagon.", "她站在一辆驴拉的载重货车之前。");
	text = text.replace("Seeing you, she claps her hands and yells out some order.", "看见你们，她高兴地拍了拍手，然后大声地喊叫着。");
	text = text.replace("Within moments, wenches pour out the back of the wagon and line up before you.", "一会儿之后，一群少妇从载重货车上挤下来，然后排列在你们面前。");
	text = text.replace("They\'re poorly dressed and, if this is some act, poorly rehearsed.", "她们打扮得很糟糕，如果按艺术里的说法，排练地也很糟糕。");
	text = text.replace("Most look like they\'d rather be somewhere else which is ordinary of any womanfolk stuck out in the sticks.", "她们大部分看起来都更应该作为一名平凡的妇女出现在别的地方。");
	text = text.replace("You ask the \'leader\' of this group what she\'s doing.", "你走上前询问这群妇女们的领头人她在干什么。");
	text = text.replace("She grins ear to ear.", "她咧着嘴笑着。");
	text = text.replace("I am a merchant of flesh, a profiteer of good poundings.", "我是一个肉体商人，一个贩卖好东西的商人。");
	text = text.replace("These, here, are my wares.", "这些，就是我的货物。");
	text = text.replace("She swings her arms to the prostitutes.", "她向妓女们挥了挥手。");
	text = text.replace("They straighten up, or loosen up, and feign interest in you and your men. The pimp nods.", "她们排列地更整齐了一些，或者说放松了一些，假装对你和你的人们很有兴趣。皮条客点了点头。");
	text = text.replace("So, what say we help take the edge off, hm?", "让我们帮你们放松一下，哼？");
	text = text.replace("Been a long day, no?", "很久没有了不是吗？");
	text = text.replace(/For that many men, I\'d wager it\'d cost you a low (.*?) crowns\./, "就这几个人，我打赌你只需要花 $1 克朗。");
	
	text = text.replace("Despite the protests of some of your men, you decline the pimp\'s offer. She shrugs.", "尽管你的一些人在抗议，你还是拒绝了皮条客的提议。她耸耸肩。");
	text = text.replace("Damn, I knew I should have invested in little boys. Well, suit yerself.", "该死的，我就知道我应该再招募一些小男孩来。好吧，随你的便了。");
	
	text = text.replace("The womenfolk press forward, some winking lazily, some with lazy eyes winking wonkily.", "妓女们缓步向前走来，其中几人懒散地眨了眨眼，另外几人神色困倦。");
	text = text.replace("It\'s a sorry lot of wenches, but the men could use a bit of reprieve.", "这是一群糟糕的农妇，但是你的人们已经等不及了。");
	text = text.replace("You accept the pimp\'s price and the men sort out the rest, ducking into bushes and a variety of other cover.", "你接受了皮条客的报价，而你的人们则去做之后该做的，躲进了灌木丛和其他各种各样的隐蔽的角落里。");
	text = text.replace("While they get some action, the pimp sidles up next to you.", "在他们行动的时候，皮条客悄悄地贴近了你。");
	text = text.replace("Thanks for not robbing us.", "谢谢你没有抢劫我们。");
	text = text.replace("You shrug and say that\'s still on the table. She shrugs, too.", "你耸耸肩，说那可没准。她也耸耸肩。");
	text = text.replace("I know, but I don\'t think you will.", "我知道，但是我认为你不会的。");
	text = text.replace("Me and you, we are a lot alike.", "我和你，有很多相似的地方。");
	text = text.replace("You fight for food, we fuck for it.", "你为食物而战斗，而我们用皮肉。");
	text = text.replace("Curious, you ask if she still \'fucks\' for her food. She laughs.", "感到有点好奇，你问她是否还在用皮肉获取食物。她笑了笑。");
	text = text.replace("Only when I need to.", "只有到需要的时候才会。");
	text = text.replace("This \'leadership\' role is a pretty nice gig.", "这个“领头人”身份是一个很棒的工作。");
	text = text.replace("Do you still \'fight\' for yours?", "你现在还在为你自己而亲自“战斗”吗？");
	text = text.replace("You just give her the truth.", "你告诉了她真相。");
	text = text.replace("I\'ve killed many, many people.", "我曾经杀了很多，很多的人。");
	text = text.replace("She sidles up real close now and goes low with a hand.", "她紧紧地贴向了你，手向下伸去。");
	//text = text.replace("Well then.", "好吧那么。");
	text = text.replace("Well then indeed.", "确实那么。");
	
	text = text.replace("You agree to the offer.", "你同意了这个建议。");
	text = text.replace("The pimp and her harlots come forward, swarming into your ranks like a bunch of salacious snakes.", "皮条客和她的妓女们向前走来，就像一群好色的蛇挤进了你的队伍里。");
	text = text.replace("Mere moments after most of your men have their pants down, a group of bandits step out of the bushes.", "在你们大部分的人都已经脱下裤子之后不久，一队土匪出现在了树丛之外。");
	text = text.replace("You grab your sword, the actual bladed one, and naked-leggedly remove a thief\'s head from his shoulder and stab another through the chest.", "你赶忙抓起了你的利刃，真正开了锋的那一把，光着双腿将一个盗贼的头砍下，又刺穿了另一个的胸膛。");
	text = text.replace("More robbers come forward, weapons out ready for combat, but the pimp jumps between everyone.", "更多的强盗冲了上来，都拔出了武器准备战斗，但是皮条客突然跳了出来，站在你们两者之间。");
	text = text.replace("Whoa! No one else needs to die here!", "喔！这儿不会再死人了！");
	text = text.replace("Some of your men still don\'t even realize what the hell is going on which is as good a sign as any that this wench has gotten the drop on you.", "你的人还没有意识到这个少妇究竟是怎么在你面前先发制人的。");
	text = text.replace(/That said, the (.*?) is still a force of nature, pants or no pants, and the pimp recognizes this\./, "也就是说 $1 依旧有一种自然的力量，无论是否穿着裤子，而且皮条客也意识到了这一点。");
	text = text.replace("She scolds the hired hands.", "她大声呵斥着雇工。");
	text = text.replace("I thought I told you morons to not attack if the Johns appear dangerous.", "我记得我告诉过你们这群傻瓜如果顾客们看起来很危险，不要攻击。");
	text = text.replace("Don\'t they look farkin\' dangerous? Goddam. Look, sellsword.", "他们看起来是不是很危险？该死的。看到了没，佣兵。");
	text = text.replace("I\'ll take double the offer and leave you be.", "我要收双倍的报酬然后离开。");
	text = text.replace("Just double the offer and we\'ll go.", "给我们双倍报酬，我们要走了。");
	
	text = text.replace("You\'re not going to risk your men and agree to her terms.", "你不准备让你的人冒险，然后答应了她的条件。");
	text = text.replace("Taking the money, she nods.", "拿走了钱，她点了点头。");
	text = text.replace("Most men would have let their pride take over there, but you know how to keep your men safe.", "大多数人在这种情况下会让他们的荣耀感支配他们，但是你知道怎么样让你的手下保持安全。");
	text = text.replace("A smart sellsword is rare these days and your men should be happy to have you as their leader.", "一个聪明的雇佣兵在如今的日子里很稀有，你的手下们也会对有你这么个领袖而高兴。");
	text = text.replace(/As the robbers and harlots leave, (.*?) walks up groaning\./, "土匪和妓女们离开了，$1 走了过来哼哼道。");
	text = text.replace("Well shit. I\'m so warmed up I could split a wench in half.", "好吧，狗屎。我感觉我现在硬得可以日穿一个少妇。");
	
	text = text.replace("You don\'t say no deal so much as show it.", "你没有说不行，而是用你的行动来表示。");
	text = text.replace("Sword still in hand, you swing it back up and slash the pimp\'s face.", "持剑在手，你把它倒转过来狠狠地抽向皮条客的脸。");
	text = text.replace("As she stares at you in disbelief, you reverse the sword swing and cleave her head clean off.", "在她目瞪口呆得望着你时，你把剑回转过来，一剑砍下了她的头。");
	text = text.replace("The men, trousers down, grab their gear and start to fight.", "而你的人们，裤子都还没穿上，赶紧拿起了他们的武器并开始战斗起来。");
	text = text.replace("A few harlots brandish daggers and get some stabs in, but they are quickly killed off.", "一些妓女掏出了匕首，刺向了你的伙计们，一些伙计被刺伤了，但是迅速地解决了妓女们。");
	text = text.replace("Most of the prostitutes are harmless, but get butchered in the confusion and chaos.", "大部分的妓女们都是无害的，但是却在困惑和混乱中被屠杀了。");
	text = text.replace("The robbers, who probably weren\'t expecting actual combat, say farewell to their short, shitty lives.", "强盗们，估计没有料到会有真正的战斗，则向他们短暂而又可悲的生命说了声再见。");
	text = text.replace("When it\'s all said and done, there\'s a good twenty bodies spread over the field and most mercenaries did not come out the other side unharmed.", "当一切结束的时候，地上留下了超过20具尸体，大部分的雇佣兵身上都带着伤痕。");
	text = text.replace("You try and salvage what you can from the field.", "你则开始回收着战场上还能用的东西。");
	
	text = text.replace("You think the offer over, then realize these are just a bunch of women out in the middle of nowhere.", "你仔细考虑了这个提议，然后意识到这些只是一群不知从何而来的女人。");
	text = text.replace("With a solid back hand, you send the pimp to the ground.", "你反手扇了皮条客一个嘴巴，把她打倒在地。");
	text = text.replace("She rubs her cheek and says roughhousing will cost extra. You nod.", "她摸着被打的脸颊，说，想要粗暴的来的话要加钱。你点了点头。");
	text = text.replace("Yeah, it\'ll cost you everything you got.", "是的，要拿你们有的一切来换。");
	text = text.replace("Men, take it all.", "伙计们，把她们拿下。");
	text = text.replace("The pimp asks if this is a robbery and you nod.", "皮条客问你，这是不是一次抢劫，你点了点头。");
	text = text.replace("The second you make your intentions clear, a group of armed men step out of some nearby bushes.", "在你表明你的意图的那一刻，一群全副武装的男人从附近的灌木丛中钻了出来。");
	text = text.replace("The pimp gets up and rubs her cheek.", "皮条客站了起来，摸了摸她的脸。");
	text = text.replace("I\'m still willing to part on neutral terms here, sellsword.", "我还愿意把这次交易继续下去，佣兵。");
	text = text.replace("A good slap ain\'t no problem in this business.", "一个响亮的耳光在这次交易里没有任何影响。");
	text = text.replace("It\'s expected, even, but so are robbers and murderers and rapists.", "这个是意料之中的，但是抢劫犯，杀人犯和强奸犯也在意料之中。");
	text = text.replace("Now, if you wish to keep on doing what you want, I\'m gonna sic those men on you to do what I need, which is keep me and mine safe.", "现在，如果你想继续做你想做的事，我会让那些人做我需要的事，那就是保护我和我的财务安全。");
	
	text = text.replace("Looking at the guards, and at your men who you don\'t wish to lose over this bullshit, you nod.", "你看着那些守卫和那些你不想在这次抢劫中失去的人们，你点了点头。");
	text = text.replace("Smart lady. Alright. There\'s no need for bloodshed.", "聪明的女士。好吧。这里不会有流血事件了。");
	text = text.replace("The pimp sighs in relief.", "皮条客松了一口气。");
	text = text.replace("Glad we could come to an agreement.", "很高兴我们能达成共识。");
	text = text.replace("I\'m afraid my previous offer is off the table.", "恐怕我之前的提议已经失效了把。");
	text = text.replace("I\'m sure you understand.", "我相信你能理解。");
	text = text.replace("Sheathing your sword, you say that you do.", "收剑入鞘，是的，你说道。");
	text = text.replace("A couple of the brothers spit and shake their heads.", "两个兄弟啐了一口唾沫，摇了摇头。");
	text = text.replace("They think they missed out on a good lay because of your aggression here.", "他们认为因为你的侵略性而错失了一次美好的休息。");
	
	text = text.replace("These \'guards\' ain\'t shit.", "这些“守卫”不是骗人的。");
	text = text.replace("You order your men to attack.", "你下令你的伙计们开始攻击。");
	text = text.replace("The fight is a brief flurry of action.", "这次打斗仅仅是一次简短的骚动。");
	text = text.replace("The harlot\'s hired hands act as though they didn\'t expect to see actual combat.", "这些妓女们雇佣的打手们表现得就像没有准备好进行真正的战斗的样子。");
	text = text.replace("With the combat over, you see that the wagon\'s still here, but the pimp and her prostitutes are gone.", "在战斗结束之后，你看见那辆载重货车仍然停在那里，但是皮条客和她的妓女们都跑了。");
	text = text.replace("They must have made their leave during the fight.", "她们一定在你们打斗的时候逃跑了。");
	text = text.replace("They even took the donkey, that lucky ass.", "她们甚至还把驴子带走了，真是个幸运的家伙。");
	text = text.replace("Your men raid the wagon.", "你的人抢劫了载重货车。");
	text = text.replace(/While taking anything that\'s not nailed down, (.*?) hears a knocking noise\./, "在你们搬走了所有没有固定住的东西的时候，$1 听见了一阵敲击声。");
	text = text.replace("He searches the bottom of the cart and pulls on a cord, dropping a slat of wood down which rolls a man completely covered in black leather.", "他找了找货车的底部，拉了拉一条绳索，一块木板掉了下来，接着一个浑身裹着黑色皮革的男人滚了出来。");
	text = text.replace("You pull back the mask covering his face.", "你推下了他脸上蒙着的面罩。");
	text = text.replace("He sucks in a breath.", "他深深地吸了一口气。");
	text = text.replace("Th-thank you! By the old gods, I thought they\'d have me in there forever!", "谢－谢谢！旧神啊，我还以为她们会把我在这里关一辈子！");
	text = text.replace("You ask who he is.", "你问道他是谁。");
	text = text.replace("He spits the leather scraps out of his mouth.", "他把嘴里的碎布吐了吐。");
	text = text.replace("Gimp.", "瘸子。");
	text = text.replace("Just \'Gimp\'? He nods.", "只是“瘸子”？他点了点头。");
	text = text.replace("Yessir. Hey, those are some nice weapons you got there.", "是的，先生。哇，你在这搞到了不少好武器。");
	text = text.replace("Sleek armor, too. Hm. My master is gone, so...", "还有这些贼棒的盔甲。哼，我的主人已经跑了。所以…");
	text = text.replace("You shake your head.", "你摇了摇头。");
	text = text.replace("Go to the closest town and get yourself cleaned up, stranger.", "去最近的城镇里把你自己洗干净，陌生人。");
	//text = text.replace("He nods.", "他点头。");
	text = text.replace("As you wish, master.", "如你所愿，主人。");

//pimp_vs_harlot_event.nut
	text = text.replace("You come across a man and woman arguing outside one of the town\'s buildings.", "你在小镇的一栋建筑外面遇见了一个男人和一个女人正在争吵。");
	text = text.replace("Why do I give you all of it?", "为什么我要给你所有的东西？");
	text = text.replace("I\'m the one doing all the work!", "所有事都是我做的！");
	text = text.replace("She yells. The man rubs his chin and responds.", "女人喊道。男人摸了摸下巴，回答道。");
	text = text.replace("I manage the minge!", "我负责拉拢业务！");
	text = text.replace("How would you find work without me?", "如果没有我，你找到的工作吗？");
	text = text.replace("The woman, seeing you, turns and asks if you\'d sleep with her.", "那个女人看见了你，回过头来问你愿不愿意跟她上床。");
	text = text.replace("She could be shaped like two circles and a triangle and you\'d probably still have a go.", "她看起来就像是两个圆圈和一个三角，你有点想要来一发。");
	text = text.replace("The woman throws her hands out.", "女人伸出手来，说道。");
	text = text.replace("See? Half this world\'s ready for business if I so much as open my legs!", "看？只要我张开双腿，半个世界都准备着和我做生意。");
	text = text.replace("The wannabe-pimp asks you to talk some sense into his \'prospect.\'", "想当皮条客的人请你对他的“前景”讲点道理。");
	
	text = text.replace("You give your answer.", "你给出了你的答案。");
	text = text.replace("A pimp provides security.", "皮条客给你提供了保护。");
	text = text.replace("Just cause every swinging dick wants what\'s between your legs don\'t make you safe.", "只是因为每个摇摆的家伙都想要你两腿之间的东西并不能保证你的安全。");
	text = text.replace("The smallest slight can bring out a customer\'s darker, more violent nature.", "一次最轻微的怠慢也有可能激发一个顾客更加黑暗更加暴力的本性。");
	text = text.replace("The pimp nods.", "皮条客点了点头。");
	text = text.replace("That\'s right! Listen to \'im!", "对嘛！听他的！");
	text = text.replace("Thinking, the prostitute nods before suddenly slapping the pimp across the face.", "思考了一会，妓女点了点头，然后突然扇了皮条客一个耳光。");
	text = text.replace("He cries out and rubs the welt.", "他哀嚎着捂着脸颊。");
	text = text.replace("The woman nods again.", "女人又点了点头。");
	text = text.replace("This lark is supposed to protect me, really? Good day, sirs.", "就这个弱鸡还说要来保护我？日安，先生。");
	
	text = text.replace("With a fatherly appeal you take the pimp by the shoulder.", "带着慈父般的微笑，你搭上了皮条客的肩膀。");
	text = text.replace("You can take the woman out of a whore, but you can\'t take the whore out of a woman.", "你能让一个女人从良，但是却无法让娼妓行业没有女人。");
	text = text.replace("The pimp thinks it over.", "皮条客仔细思考了一下。");
	text = text.replace("You do, too, as you were never one for logic.", "你也是，因为你从来就不是一个逻辑感很强的人。");
	text = text.replace("The pimp looks at you.", "皮条客看了向你。");
	//text = text.replace("What?", "什么？");
	text = text.replace("The lady steps forward, taking the pimp by the other shoulder.", "那个女士走上前来，搭上了皮条客的另一边肩膀。");
	text = text.replace("I think he\'s saying to cut me loose.", "我认为他的意思是让你摆脱我。");
	text = text.replace("When the pimp raises an eyebrow, the woman clarifies.", "皮条客挑了挑眉毛，女人解释道。");
	text = text.replace("Figuratively speaking.", "打个比方来说。");
	text = text.replace("The pimp sighs.", "皮条客叹了一口气。");
	text = text.replace("I don\'t understand what the hell you two are saying, but alright.", "我就没听懂你们两个在说什么，但是好吧。");
	text = text.replace("I thought maybe I could get a business going here.", "我认为我在这可以做成一单生意。");
	text = text.replace("A woman here, a woman there, peddle their gooches and mooches, make some crowns, retire early.", "这一个女人，那一个女人，出售各种各样的东西，挣一些克朗，早早地退休。");
	text = text.replace("Oh well, back to grinding wheat into flour until I keel over and die.", "好吧，回去磨小麦吧，直到我再也干不下去，死了为止。");
	text = text.replace("The man walks off, his nose sniffling.", "男人一边走一边对你们嗤之以鼻。");
	
	text = text.replace(/(.*?) the minstrel glides forward\./, "$1 这个吟游诗人向前走了两步。");
	text = text.replace("Ahoy, what is this but a tale of a dullard and tail of a whore?", "噢，这不就是一个傻瓜和一个妓女的故事吗？");
	text = text.replace("With one look I know what you need to do my friend: profess your undying love to this minge!", "我一眼就看出来你应该怎么做：向他们解释一下什么是永恒的爱！");
	text = text.replace("The woman crosses her arms and creases her eyebrows.", "女人叉着手，抬了抬眉毛。");
	text = text.replace("Just what are you on abou--", "你到底再说什－");
	text = text.replace("The minstrel bats her out of the way as he raises an arm and a singly voice with it.", "吟游诗人抬起了手，用歌咏般的语调打断她的话。");
	text = text.replace("Ahoyyy! Love, yes, love is in the air!", "啊哈！爱，是的，爱无处不在。");
	text = text.replace("Best let it flare! - and I\'m not just talking about his cock and balls.", "最好让它爆发！我说的不仅仅是他的鸡鸡和蛋蛋。");
	text = text.replace("He loves you, my dear, can\'t you see?", "他爱你，亲爱的，你还没有发现吗？");
	text = text.replace("Why else would he make a harlot out of only thee?", "他为什么只和你一起从事娼妓行业？");
	text = text.replace("A pimp needs a diverse portfolio, not a business of one holy-oh, ohhh!", "一个皮条客需要多种多样的职员，而不是唯一神圣的那一个哦，哦哦。");
	text = text.replace("The pimp drops his head, face red and embarrassed.", "皮条客低下了头，羞红了脸。");
	text = text.replace("He admits it\'s true, all of it.", "他承认这是真的，所有都是真的。");
	text = text.replace("The woman looks over, her face flushed.", "女人的目光飘向了远方，脸色发红。");
	text = text.replace("They lock eyes. You roll yours.", "他们的目光相遇了。你滚你的。");
	text = text.replace(/They embrace and make off all lovey-dovey\. (.*?) scratches his chin\./, "最终两人拥抱在了一起，尽情地卿卿我我起来。$1 挠了挠脸颊。");
	text = text.replace("I\'m a poet and I didn\'t even... realize it.", "虽然我是个诗人，但是甚至没有…意识到这个。");
	
	text = text.replace(/\'Tsk, tsk, tks.\' (.*?) the tailor struts on up shaking his head\./, "啧啧啧，$1 抬头挺胸地站起来，摇着头。");
	text = text.replace("He runs a finger along the prostitute\'s dress.", "他用手指划过妓女的裙子。");
	text = text.replace("He remarks that he thought whores were supposed to be pretty.", "他说道：他认为妓女们应该都是美丽的。");
	text = text.replace("The pimp raises his hand.", "皮条客举起了他的手。");
	text = text.replace("That\'s my property you\'re spittin\' on.", "你这是在侮辱我的财产。");
	//text = text.replace(/(.*?) bows\./, "$1 鞠了一躬。");
	text = text.replace("Apologies, sir, but I do believe you have already spit on her yourself dressing her in such a manner.", "不好意思，先生，但是我确定你让她穿成这样已经是对她的侮辱了。");
	text = text.replace("I\'d not know she\'s looking for a whore\'s coin had you not yelled at her with a pimp\'s, hm, lackadaisical sense of economics.", "我不知道她是否是为了不要让你用一个皮条客的，额，懒洋洋的经济眼光来对着她吼叫。");
	text = text.replace("The pimp draws a dagger out and attacks.", "皮条客掏出了匕首，猛地刺向裁缝。");
	text = text.replace("The tailor pirouettes, spinning beneath the blade\'s strike.", "裁缝侧身一让，堪堪避过了利刃。");
	text = text.replace("He springs back upright and jams a thick pair of scissors to the pimp\'s throat.", "他立刻回过身来，把一把剪刀架在了皮条客的脖子上。");
	text = text.replace("Mmm, what a quaint position to be in.", "嗯，这是一个多么奇怪姿势。");
	text = text.replace("I daresay you have but two ways out, and one is much shinier than the other.", "我敢说你现在只有两条路可走，而且一条比另一条要窄得多。");
	text = text.replace("Yes, that\'s right, you get it don\'t you?", "是的，没错，你明白了，不是吗？");
	text = text.replace("Pay up or I\'ll cut yer throat and clip your nuts and the order which I do it just might surprise you.", "赔款，否则我就割开你的喉咙，解决你这个麻烦，而且我的要求会让你大吃一惊。");
	text = text.replace("The pimp hastily forks over some crowns to spare his life.", "皮条客匆忙地掏出了一些克朗来拯救他的生命。");
	text = text.replace("The tailor \'snips\' his scissors closed and pockets them.", "裁缝合拢了他的剪刀，收回了他的口袋。");
	text = text.replace("Good. Now for some advice.", "好的。现在是一些建议。");
	text = text.replace("You can find linens for cheap down the street yonder.", "你可以在街那头买到一些便宜的亚麻布。");
	text = text.replace("The man who works the shop there is, hm, particularly good at outfitting women... and men. Tata now.", "在店里工作的那个男人，嗯，特别擅长给女人装衣服…还有男人。再会。");
	text = text.replace(/(.*?) turns to you with a grin and asks if he can go and visit some shops to spend his newly found gold\./, "$1 裁缝看向你，笑了笑，问道他是不是可以走了，去店里花他刚刚挣的钱。");
	
	text = text.replace(/(.*?) the monk steps forward\./, "$1 这个僧侣走上前。");
	text = text.replace("He takes the pimp by the hands.", "他抓住皮条客的手。");
	text = text.replace("Were you to do that, the pimp would not doubt shrink back or strike you.", "如果你那样做，皮条客肯定会退缩或打你。");
	text = text.replace("But the holy man does it with such grace and humility that the pimp simply stares at him.", "但这位圣人是如此优雅和谦逊，皮条客只是盯着他看。");
	text = text.replace("The monk smiles warmly.", "僧侣热情地笑了。");
	text = text.replace("This is not the path for you, that much is clear.", "这不是你要走的路，这一点很清楚。");
	text = text.replace("You have not the means to handle this woman, and this is but one woman, when a pimp really needs many.", "你没有办法对付这个女人，而这只是一个女人，而皮条客需要很多。");
	text = text.replace("The old gods tell me you are meant for a different path, one which is for hardier men.", "古神告诉我，你注定要走另一条路，一条适合更坚强的人的路。");
	text = text.replace("I daresay you are fit for a mercenary company.", "我想说你适合加入一个雇佣兵战队。");
	text = text.replace("Leave the women-wrangling to the snake handlers.", "把女人们的争吵留给蛇头吧。");
	text = text.replace("The pimp thinks for a time, but you can tell the words have gotten to him.", "皮条客想了一会儿，但你可以看出他已经被这些话打动了。");
	text = text.replace("He asks if you\'d accept him into your company.", "他问你是否愿意接受他加入你的战队。");

//player_is_rich_event.nut
	text = text.replace("Over time, you\'ve come to acquire a great deal of money.", "一段时间之后，你挣了很大一笔钱。");
	text = text.replace("While you keep the war chest under lock and key, you can\'t help but notice a few brothers have gotten a bit greedier over the time they\'ve spent in your company.", "虽然你仍然保持战利品箱妥善保管，但是你却注意到一些兄弟的贪婪心随着待在战队里的时间的延长而日益膨胀。");
	text = text.replace("Now you hear rumors of the men demanding higher pay.", "最近你开始听见一些关于伙计们要求涨薪的传言。");
	
	text = text.replace("Preempting any sort of mutiny or raise requests, you announce that the group shall have a company-wide raise.", "为了防止任何形式的兵变或者要求提高待遇，你宣布整个战队都将有一次涨薪。");
	text = text.replace("Three crowns a day for everyone.", "每个人每天将能多获得三克朗。");
	text = text.replace("As it turns out, the men are quite fond of this move and cheer your name with a huzzah!", "作为结果，伙计们对这次事件非常满意，开始热切地欢呼着你的名字！");
	
	text = text.replace("Before anyone gets any ideas, you step up before the whole company and announce that there will be no raises.", "在任何人发表意见的之前，你站到了战队面前，大声宣布不会有涨薪。");
	text = text.replace("As far as you are concerned, every man present signed the contract.", "就你而言，在场的每个人都签了合同。");
	text = text.replace("Any prospect of earning more pay shall be done by experience only, and that is only done by doing what sellswords do best: kill.", "任何人对涨薪的要求只能基于他的资历，而这只能通过最适合佣兵来做的一件事来达成：杀戮。");

//player_is_sent_for_event.nut
	text = text.replace("Your company seems to have caught the attention of a messenger on the road.", "你的战队似乎在路上引起了一位信使的注意。");
	text = text.replace(/Sirs, (.*?) to the (.*?) is in dire need of help and has requested any and all able men, particularly those of the sword selling sort, to come and help\./, "先生们，在 $1，去往 $2，那急需帮助，现在正在寻找所有能胜任的人，尤其是那些佣兵队伍，来帮助他们。");
	text = text.replace(/Ah, the (.*?), just the sort I was hunting for\. (.*?) to the (.*?) is requesting help with a problem\./, "喔，$1，你们就是我在找的人。在 $2，去往 $3，那需要解决一个麻烦。");
	text = text.replace("If you\'re looking for work, I wager you head that way.", "如果你正在找活干，我敢打赌你应该走这条路。");
	text = text.replace("And make sure to tell them I sent ya, I get two extra crowns for it.", "请务必告诉他们是我给你们指的路，这样我还能再多获得几枚克朗。");
	text = text.replace(/Hey there sword selling sirs, (.*?) to the (.*?) is in need of your services\./, "嘿，佣兵先生们，在 $1，去往 $2，那需要你们的服务。");
	text = text.replace("I suggest you head that way if you\'re looking for work.", "如果你们在找活干的话，我建议你们往那条路走。");
	text = text.replace(/Looking for work\? You don\'t march like you got purpose, so let me tell ya that (.*?) to the (.*?) has got some jobs for your lot\./, "在找活干吗？看你们你们行军的速度并不像是已经找到活干了，那我告诉你们在 $1 这里的 $2，那绝对有适合你们的工作。");
	text = text.replace("Ah, a sellsword without a role in this world? Woe is ye.", "额，一个没有事干的雇佣兵？你真是太倒霉了。");
	text = text.replace(/Well, (.*?) not far from here has got something for ya\./, "好吧，离这里不太远的 $1 有些可以给你们干的活。");
	text = text.replace("I suggest you get on to it.", "我建议你们去看看。");
	text = text.replace(/I\'m here to tell yas that (.*?) is looking for workers\./, "我是来告诉你们 $1 正在找工人。");
	text = text.replace("Not laborers, mind. I\'m speaking to you for a reason.", "不是干粗活的，注意。我跟你说话是有原因的。");
	text = text.replace("Take your swords and killers there if ya want some proper coin.", "带上你的剑和杀手跟我走，如果你想挣些硬币的话。");
	text = text.replace(/Hey there, ya should know that (.*?) is looking for men of your kind\./, "嘿，这边，你应该知道知道，$1 正在找你们这样的人。");
	text = text.replace("Find your way there and you may have a new job yet.", "赶快去那儿，没准你们就能找到一份新工作。");
	text = text.replace("Looking for work are ye?", "你们在找活干？");
	text = text.replace(/Then get on to (.*?) to the (.*?), it\'s no mystery to no one that they\'re looking for men like you\./, "那快点去 $1，去往 $2，所有人都知道他们正在找你们这样的人。");
	text = text.replace("Thanking the courier, you check your maps to see if it\'s worth the trip.", "向信使道了声谢，你拿出了地图，思考着这一趟旅行是否值得。");

//player_plays_dice_event.nut
	text = text.replace(/While relaxing after the day\'s walk, (.*?) comes up to you with a pair of dice and a cup in hand\./, "走了一天的路之后，在休息的时候，$1 手里拿着一副骰子和一个杯子走到了你的身边。");
	text = text.replace("He asks if you wish to have a little game.", "他问你想不想来玩一个小游戏。");
	text = text.replace("The rules are quite simple: you roll the dice from the cup, whoever has the highest numbers wins.", "规则非常简单：每个人摇一次骰子，点数高的人获胜。");
	text = text.replace("It\'s pure chance! The wager will be twenty-five crowns per dice roll.", "这是一个好机会！每次的赌注是二十五克朗。");
	
	text = text.replace(/You roll the dice, landing a total of (.*?)\./, "你掷骰子，一共得到 $1。");
	text = text.replace(/(.*?) goes next, rolling a total of (.*?)\./, "$1 接着，掷得了 $2。");
	text = text.replace("Well, you lost. The gambler snatches the dice back up - as well as your twenty-five crowns - and aks if you wish to have another go.", "好吧，你输了。赌徒一把抓走了骰子－和你的二十五克朗一起－并问你还想不想再来一盘。");
	text = text.replace("The dice were not in your favor and the gambler takes his earnings.", "你的骰运似乎不是很好，让赌徒挣到了钱。");
	text = text.replace("He looks up to you, grinning.", "他抬头看着你，笑了笑。");
	text = text.replace("Wish to have another go?", "再来一盘吗？");
	text = text.replace("The numbers are counted up and, alas, you have lost.", "你算了算骰出来的点数，哎呀，你输了。");
	text = text.replace("The gambler asks if you wish to go again.", "赌徒问你还想不想再来一盘。");
	text = text.replace("Lost! But maybe if you roll again...", "你输了！但是如果再掷骰一次的话…");
	text = text.replace("You lose! A simple roll of the dice, and simple loss.", "你输了！简单地一骰，普通的失败。");
	text = text.replace("But this one hurts a lot less than which you\'ve seen on the fields of battle.", "但是这一次却比你在战场上所遭受的失败轻微太多。");
	text = text.replace("The gambler asks if you wish to have another go.", "赌徒问你还要不要再来一盘。");
	text = text.replace("The gods have shunned you and your silly dice.", "众神躲避着你和你那愚蠢的骰子。");
	text = text.replace("Losing the game is a minor setback, but your pride costs a little more than twenty-five crowns.", "输了游戏是最小的一种失败，但是你的自尊要比这二十五克朗值钱多了。");
	text = text.replace("Should you roll again?", "你要不要再来一盘？");
	text = text.replace("The odds have betrayed you for a measly twenty crowns.", "神明们背叛了你，仅仅为了这少少的二十克朗。");
	text = text.replace("Maybe if you roll again you can win them back?", "没准你再掷骰一次就能把它们赢回来？");
	text = text.replace("You watch your dice tumble, seeing for but a moment the winning numbers before it tilts and falls to another side, revealing a losing total.", "你看着你的骰子不停颤动，有那么一瞬间，你看见了胜利的点数－在它倾斜着倒向另一边之前，这也揭示了你最终的失败。");
	text = text.replace("The gambler laughs and asks if you wish to throw again.", "赌徒笑着问你要不要再来一盘。");
	text = text.replace("Your throw was perfect!", "你的投掷非常完美！");
	text = text.replace("How could you lose?", "但是你怎么却输了呢？");
	text = text.replace("He needed just those numbers to win!", "他只要那几个数字就能赢了！");
	text = text.replace("Shaking your head, you wonder if you should roll again.", "摇着头，你在想着是否还要再来一盘。");
	
	text = text.replace(/You roll the dice, landing a total of (.*?)\./, "你掷骰子，一共得到 $1。");
	text = text.replace(/(.*?) goes next, rolling a total of (.*?)\./, "$1 接着，掷得了 $2。");
	text = text.replace("You won! The gambler claps his hands.", "你赢了！赌徒鼓了鼓掌。");
	text = text.replace("Beginner\'s luck!", "新人的好运！");
	text = text.replace("You cross your arms.", "你把双手抱在胸前。");
	text = text.replace("I thought it was all luck?", "我觉得，这仅仅是运气好？");
	text = text.replace("The gambler laughs and asks if you wish to test that theory.", "赌徒笑了笑，问你要不要来测试一下你的理论。");
	text = text.replace("The gambler leans back.", "赌徒向后一靠。");
	text = text.replace("Well I\'ll be damned. Let\'s throw again!", "好吧，我会被诅咒的。再来一盘！");
	text = text.replace("The gambler leans back.", "赌徒向后一靠。");
	text = text.replace("Well I\'ll be a horse\'s fartin\' arse", "好吧，我踏马就是一个马屁");
	text = text.replace("I\'ll be damned if the gods haven\'t turned their backs on me", "如果神明们没有抛弃我的话，那我一定是被诅咒了");
	text = text.replace("Now that right there is a poor showin\' of lady luck", "现在，这是幸运女神一场糟糕的演出");
	text = text.replace("I\'d bedded a lady by the name of Luck, what good it\'s done me though", "我祈求着幸运女神的名字，但是她究竟给我带来了什么");
	text = text.replace("That right there is a misfortune, for me that is", "好吧，真不幸，至少对于我而言是这样的");
	text = text.replace("Oy, that\'s a winning roll", "唔，这是一个胜利的一掷");
	text = text.replace("I\'ll be a ragamuffin", "我这是要破产了啊");
	text = text.replace("Son of a gelded horse", "踏马的阉马之子");
	text = text.replace("Shits on a wet a pig", "一泡猪屎");
	text = text.replace("As damned as a nun on her back", "真晦气，像生病的修女一样");
	text = text.replace("The throw of a master I say", "我得说这是一次大师级的投掷");
	text = text.replace("Yer a robber with such a throw and yeah", "你这样掷骰就跟抢劫一样");
	text = text.replace(/May (.*?) join the orcs/, "也许 $1 可以加入兽人");
	text = text.replace("And they say a blind squirrel can\'t find a nut", "人们都说瞎松鼠找不到坚果");
	text = text.replace("Tickle m\'anus with a rosebush and call me Sally Siegfried", "用玫瑰搔我的肛门，然后叫我胜利与和平的公主");
	text = text.replace(", ya won! Let\'s roll again!", "，你赢了！让我们再来一盘！");
	text = text.replace("You\'ve won! Laughing, you take your earnings and the gambler asks if you wish to have another throw.", "你赢了！微笑着，你拿走了你挣的钱，赌徒问道你还想不想再来一盘。");
	
	text = text.replace(/You roll the dice, landing a total of (.*?)\./, "你掷骰子，一共得到 $1。");
	text = text.replace(/(.*?) goes next, rolling a total of (.*?)\./, "$1 接着，掷得了 $2。");
	text = text.replace("The numbers are the same.", "点数一样。");
	text = text.replace("A tie! Roll again?", "平局！再来？");

//poacher_vs_thief_event.nut
	text = text.replace(/You walk out of your tent to see (.*?) and (.*?) regaling one another with stories\./, "你走出了帐篷，看见 $1 和 $2 互相讲着故事。");
	text = text.replace("You\'re not sure what a poacher and a thief would have in common, but they seem to be having a good time.", "你不知道一个偷猎者和一个小偷怎么会有共同话题，但是他们似乎相处的很好。");
	text = text.replace(/Laughing, (.*?) gives another story\./, "大笑着，$1 又讲了另外一个故事。");
	text = text.replace("One time, I was out in this pithy nobleman\'s lands hunting this buck.", "从前，我就在这块贵族领地里靠猎鹿为生。");
	text = text.replace("Shooting the damned deer was the easy part.", "狩猎这些鹿是其中最简单的部分。");
	text = text.replace("In the middle of field dressing it, I hear hooves beating over the earth.", "有一次我正在一片草地中间处理猎物的时候，我听见了有一阵蹄声。");
	text = text.replace("So run a rope up a tree, tie the carcass to it, and haul that sucker up there.", "于是我赶快把一个绳索搭到树上，把打到的鹿绑上去，接着用力把它吊了起来。");
	text = text.replace("No more than a minute later, badda-badda-badda, there\'s the nobleman with the constable and a retinue of lawmen.", "没过几分钟，磕嗒磕哒，就看见一个贵族带着一个警察和一群执法者的随从出现在了我的面前。");
	//text = text.replace(/(.*?) raises an eyebrow\./, "$1 挑了挑眉毛。");
	text = text.replace("That\'s a tight spot, sir.", "那可真是个危险的境地，先生。");
	text = text.replace("The poacher nods.", "偷猎者点了点头。");
	text = text.replace("Tighter than a cross-legged virgin it was.", "可供我回转的余地就像一个处女夹紧的双腿之间一样。");
	text = text.replace("So this nobleman comes wandering just underneath me and sees all the blood.", "那个贵族就在我躲着的树底下走着，查看着地上的血迹。");
	text = text.replace("He starts barking that I come out and turn myself in.", "他大喊着叫我自己出来认罪。");
	text = text.replace("I had no intention of doing that, but unfortunately, the goddam buck starts slipping.", "我是不会去做这种傻事，但是倒霉的是，那头该死的鹿开始往下滑了。");
	text = text.replace("I reach out for it and I suppose the branch couldn\'t take no more and snapped.", "我伸出手去拉它，但是可能是树枝已经支撑不住了，它折断了。");
	text = text.replace("The nobleman looks up just in time to get splattered by the belly of this deer, meanwhile I\'m falling to certain death until the damned rope snags my foot and hangs me upside down before my makers.", "贵族听见了他的鹿的腹部折断树枝的噼啪声，抬头向上看来，与此同时我正坠向死亡，直到那条该死的绳子缠绕住了我的脚，把我倒吊在了我的领主面前。");
	text = text.replace("I give a bit of a wave, \'hey fellas, don\'t mean to barge in like this.\'", "我向他们挥了挥手，说“你好啊，伙计们，我也不想以这种方式出现的。”");
	text = text.replace(/The thief laughs, but his face is a bit concerned\. (.*?) waves him off\./, "小偷开怀大笑，但是脸上露出了几分担忧。$1 向他摆了摆手。");
	text = text.replace("Oh, they had a sense of humor about it, thank the old gods.", " 唉，感谢 神明，他们也觉得我蛮好笑的。");
	text = text.replace("I spent a short six months in a dark pit.", "我只是在地牢里呆了短短六个月就是了。");
	text = text.replace("Nothing too bad, really.", "也没什么大不了的，真的。");

//raid_farmstead_event.nut
	text = text.replace(/(.*?) comes to you with a report of your food stocks\./, "$1 拿着一份关于战队食物库存的报告走到你身边。");
	text = text.replace("He explains that there\'s not much to go around and what bread is on hand could be better used to build a house or slay a man.", "手上有粮，干活不累，但战队已经快要没有足够的食物分给大家了。");
	text = text.replace("Most of the fruit is soft to the touch, covered in what appears to be grey fur.", "库存里的大部分水果都已变质发软，上面长满了灰色的毛霉。");
	text = text.replace("All that\'s left otherwise has been thrown into a great stew which the men have aptly named \'crotch broth\'.", "剩下所有的东西都被一股脑扔进锅里做成了乱炖，佣兵们形象地称之为“吊毛炖汤”。");
	text = text.replace("To be frank, it isn\'t looking good.", "老实说，那看起来根本不像是给人类吃的东西。");
	text = text.replace("However, by some fortuitous coincidence, a small farm stands in the distance.", "不过，机缘巧合之下，一个小农场出现在了远方。");
	text = text.replace("The brother doesn\'t come right out and say it, but it is gently suggested that maybe the company could go raid it.", "尽管兄弟们没人直接站出来明说，但还是有人委婉地建议战队或许可以去抢了它。");
	text = text.replace("You head off toward the farm.", "你朝农场走去。");
	text = text.replace("A few farmhands straighten up in the fields, staring at you as you approach and exchanging glances with one another.", "几名农夫在田里直起腰来，在你们走过来的同时互相瞥了瞥眼神。");
	text = text.replace("A worker baling hay plants his pitchfork in the ground and tents his hands over it.", "一个正在打干草的农民把他的草叉插在地上，双手搭在上面。");
	text = text.replace("They all watch you with nervous curiosity as you cross the plains, your men not at all trying to hide their want of the passing crops.", "当你穿过田野时，他们看着你们的眼神既紧张又好奇，而你的手下毫不掩饰对身边庄稼的渴望之情。");
	text = text.replace("When you near the homestead, a woman comes out to meet you.", "当你靠近农庄宅邸时，一个女人走了出来迎接你。");
	text = text.replace("She wipes her brow and asks what it is that you want.", "她擦擦额头，问你们想要什么。");
	text = text.replace("A few children come out of a nearby home and stand on the porch.", "几个孩子从附近的屋子里跑出来，站在门廊上。");
	text = text.replace("They eye you tentatively behind the legs of an older man, possibly the woman\'s father.", "他们躲在一个或许是那女人父亲的年长男人腿后，试探地看着你们。");
	text = text.replace("You explain to the woman that your men need food.", "你向那位女人解释说你的人需要食物。");
	text = text.replace("She gasps, but you hold a hand up.", "她倒吸了一口冷气，但你举起一只手来。");
	text = text.replace("We\'ll only be taking what we need, no more, no less.", "我们只拿我们需要的东西，一点不多，一点不少。");
	text = text.replace("We don\'t want any trouble, and I know you for sure don\'t want any. Right?", "我们不想惹出更多的麻烦，而且我很确定你们也是一样。行吗？");
	text = text.replace("The woman quickly nods.", "那女人迅速点了点头。");
	text = text.replace("You turn \'round and order your men to take a few crops, while at the same time the woman raises her voice and tells the farmhands to not try anything stupid.", "你转过身去命令你的人去收集一些作物，与此同时，女人拔高了嗓音，告诉农夫别干傻事。");
	text = text.replace("The whole affair lasts about ten minutes before your group is back on the road.", "这整个过程持续了大约十分钟，然后你的人继续上路了。");
	text = text.replace("The food here is plentiful.", "这里的食物十分充足。");
	text = text.replace("You turn around to your men and tell them to take everything they can.", "你转过身去告诉你的人把能拿走的全拿走。");
	text = text.replace("Gasping, the woman steps back and looks about ready to scream.", "那女人倒抽一口冷气，向后退了几步，并且看起来马上就要开始尖叫。");
	text = text.replace("You grab her, bringing a string of cries from the children.", "你抓住她，小孩们爆发出一阵尖厉的哭声。");
	text = text.replace("A few farmhands grab sickles and pitchforks in turn.", "几个农夫举起镰刀和草叉作为回应。");
	text = text.replace("You tell her to order the rest of the farmhands to put their weapons on the ground.", "你让她命令那些农夫放下武器。");
	text = text.replace("She obeys, and the farmhands do as told, albeit somewhat reluctantly.", "她服从了，而农夫们也照做了，尽管看上去很不情愿。");
	text = text.replace("You hold the woman while your men take what they can.", "你在你的人抢劫的时候始终挟持着女人。");
	text = text.replace("When they\'ve pillaged as much as they can carry, you let her go and order your men to move out.", "知道他们抢到拿不动更多东西为止，你才放走女人，并让你的人继续上路。");
	text = text.replace("There\'s plenty of food here.", "这里有许多食物。");
	text = text.replace("And too many witnesses.", "还有许多多余的目击者。");
	text = text.replace(/You turn around and give a knowing glance at (.*?)\. He nods back and nocks an arrow\./, "你转过身去给了 $1 一个眼神。他点头作为回应，然后射出一根箭。");
	text = text.replace("Before the woman can scream, the brother releases the shot and the old man on the porch stumbles backward into the house, followed by a retinue of screaming children.", "在女人反应过来开始尖叫之前，雇佣兵射出的箭击中了门廊上的那名老人，他踉跄跌回了房子中，随之而来的是他边上孩子们的哭喊。");
	text = text.replace("The rest of your company fans out, unsheathing their swords as they run into the fields.", "战队里其他的人一哄而散，冲进田野，利剑出鞘。");
	text = text.replace(/A few farmhands try to fight back, but your well-armed band makes short work of them\. (.*?) sprints into the homestead and inside you hear a number of cries that, one by one, disappear until there is silence\./, "几个农夫试图反抗，但全副武装的佣兵很快就解决了他们。$1 冲进了农场屋子里，你在里面听到了许多的哭喊声一个接一个地消失，直到最终归于沉寂。");
	text = text.replace("You hand the woman off to a few brothers, telling them to just make sure she is dead before you leave.", "你把那个女人交给几个佣兵，告诉他们在你们离开前确保她已经死了就行。");
	text = text.replace("A few other sellswords immediately begin cutting down crops and stealing away items from the home.", "另一批佣兵则立即开始收割作物以及从屋子里搬走东西。");
	text = text.replace("Before long, you\'re back out on the roads, your stocks now almost full.", "没过多久，你们重新上路，带着几乎被填满的仓库。");
	text = text.replace("A few brothers are taking red rags to their wet blades.", "几个佣兵用被染成红色的抹布擦拭着他们湿漉漉的利刃。");

//ratcatcher_catches_food_event.nut
	text = text.replace(/With rations down to nothing, (.*?) feebly enters your tent, the moans of some hungry men passing by before the flaps close behind him\./, "随着口粮消耗殆尽，$1 小心地走进了你的帐篷，几声饥饿的人们发出的呻吟在帐篷的屏风关上前传进屋里。");
	text = text.replace("He explains that he has a resolution to your food problem.", "他说他有个解决当前食物不足问题的办法。");
	text = text.replace("You fear to ask what it is, but you\'ve little choice now.", "你都不想去问那办法是什么，但现在你别无选择。");
	text = text.replace("The ratchatcher swings a burlap sack onto the table.", "捕鼠者把一个麻袋甩到桌子上。");
	text = text.replace("Some shape of it moves, skittering and bobbing and squealing.", "袋子的有些地方还在来回颤动，里头传出尖锐的叫声。");
	text = text.replace("The man smashes it with his fist before smiling at you.", "他狠狠地往袋子上砸了几拳，然后陪着笑看向你。");
	text = text.replace("Sorry, had a live one there!", "不好意思，里头还有个活的！");
	text = text.replace("He explains that rat isn\'t the most nutritious of animals, nor the healthiest, but it\'d help the company enough until they can get back to a town or farm.", "老鼠肉在动物肉里算不上有营养，而且也不健康，但至少它们能让战队的人在抵达下一个城镇或农庄前不至于饿死。");
	text = text.replace("You reluctantly agree to keep your men from starving.", "你不情不愿的接受了这个让你的手下免于挨饿的提案。");

//ratcatcher_crafts_net_event.nut
	text = text.replace(/You come across (.*?) sitting with his hands full of rope\./, "你在闲逛时看见 $1 坐在一边，手上满是绳子。");
	text = text.replace("He\'s got the cords looping so ferociously - as ropes can be looped - that you worry to not put your foot close to it.", "他异常迅猛地把麻绳打成绳环－以绳子可以被绕成环的最大限度－看得你都不敢把脚凑到那堆绳子旁边去了。");
	text = text.replace("Curious, you ask the man what he\'s up to.", "你好奇地询问他在干嘛。");
	text = text.replace("As though he were expecting just that question, he quickly raises his project into the air and announces he\'s fashioned himself a net.", "就好像他早就等着你发问似的，他唰一下举起他的作品，宣布他给自己织了一张网。");
	text = text.replace("Ah! You put your hands to your hips.", "啊！ 你一拍大腿。");
	text = text.replace("That shall be great on the battlefield!", "它在战场上肯定会很有用的！");
	text = text.replace("The ratcatcher purses his lips.", "捕鼠者撅起了嘴唇。");
	text = text.replace("He slowly lowers the net.", "慢慢放下了他的网。");
	text = text.replace("Oh, I meant... to use it... to snag me some rat...", "噢，我本来是想…用它…给我抓几只老鼠来着…");
	text = text.replace("He pauses, then throws his head up, a cheeky if not cheesy smile adorned across it.", "他停了一会，然后抬起头来，脸上挂着诡异的笑容。");
	text = text.replace("But I shall use it on the field of battle!", "但我会把它用在战场上的！");
	text = text.replace("No rat, man or furry or that which scurries, shall escape me!", "不论是老鼠，人还是别的什么毛茸茸又到处乱窜的东西都别想从我手底下溜走！");

//ratcatcher_spreads_disease_event.nut
	text = text.replace(/(.*?) the ratcatcher has earned his old vocation\'s namesake: apparently he\'s been rounding up rats as your party has been traveling about\./, "$1 证明了他和他以前的职业名副其实：很显然他在跟着你的战队东奔西走的时候也在一直围捕老鼠。");
	text = text.replace("Tonight, they all escaped.", "而今晚，它们全都逃走了。");
	text = text.replace("Some of the food stocks needed to be thrown away and a few men have fallen ill.", "有些食物在事后不得不被扔掉，还有一些人生病了。");

//refugee_vs_raider_event.nut
	text = text.replace(/(.*?), a man who once forced onto the roads as a refugee, stares blankly at (.*?)\. The raider, sensing he\'s being stared at, lowers his plate of food\./, "$1，一个曾经被迫背井离乡成为难民的人，眼神茫然地盯着 $2。那名掠夺者察觉了自己正被人盯着看，放下了手里盛着食物的盘子。");
	text = text.replace("Whatcha farkin\' looking at, huh?", "你小子在那看什么，哏？");
	text = text.replace("The refugee points a dripping spoon.", "难民看向一只正在滴水的勺子。");
	text = text.replace("Yer a raider, right?", "你是个掠夺者，对吧？");
	//text = text.replace(/(.*?) nods\./, "$1 点头。");
	text = text.replace("Was. Might be again someday.", "曾经是。没准将来还会重操旧业。");
	text = text.replace("What\'s it to you?", "关你什么事？");
	text = text.replace(/Standing up, (.*?) points\./, "$1 站了起来，指向他。");
	text = text.replace("It were men like you who forced good people out of their homes.", "就是你这样的人把好人逼出了家门。");
	text = text.replace("Good people to drag their whole lives onto the damned road.", "你们让那么多好人不得不拖家带口流离失所。");
	text = text.replace(/Laughing, (.*?) gets to his feet\./, "$1 大笑着，也站了起来。");
	text = text.replace("Oh, is that right?", "噢，是吗？");
	text = text.replace("And what made them so good?", "那他们又是为什么落得那样的？");
	text = text.replace("That they couldn\'t swing a sword or protect themselves?", "因为他们连拿起剑保护他们自己都做不到？");
	text = text.replace("Do you believe for one moment that were the boot on the other foot they wouldn\'t do the same to me?", "你觉得如果角色互换的话他们不会对我做出相同的事吗？");
	text = text.replace("Or to you, too?", "换成是你自己呢？");
	text = text.replace("Folk are only as good as their options.", "人们会当好人只是因为他们没得选。");
	text = text.replace("The spate\'s getting wild and some of the other mercenaries get to their feet.", "两个人的口角变得越来越激烈，其他的一些雇佣兵也站起来了。");
	text = text.replace("Nobody can stop the initial scuffle, the two men exchanging blows and curses as good as any tavern brawl you\'ve seen.", "没人能阻止这场冲突的爆发，两个人互相咒骂着扭打在一起，就像你以前看过的任何一起酒馆斗殴一样。");
	text = text.replace("Thankfully, nothing too serious comes of the fight.", "谢天谢地，至少这场斗殴没有造成太严重的后果。");

//religious_peasants_event.nut
	text = text.replace("The forests have always been a refuge for man - the wilds from whence he came, to the wilds where he always wishes to return.", "森林一直以来都是人类的天然避难所－生于荒野之人，亦渴望还于荒野。");
	text = text.replace("And here you find a great number of men, a tribe of the lost, unconcerned with their departed civilizations, draped in religious habits, and carrying great sigils of faith, and tomes of truth.", "就像这会儿你们发现的一大堆人，一个失魂者组成的部落，对与他们渐行渐远的文明毫不关心，打起宗教的旗号，胸怀崇高的信仰，手执真理的圣典。");
	text = text.replace("They\'re impoverished almost to the point of being decadently fashionable, like great kings looking to fit in with commoners.", "他们看上去穷得几乎到了行为艺术的境界，活像一群打算融入底层平民的伟大国王。");
	text = text.replace("You sit and watch this shuffle by, clinking, clanging, hollow wooden beads rattling, whispers under their breath, raspy and dry.", "你就坐在那看着他们失魂落魄，摇摇晃晃，沙沙作响地走过，中空的木珠发出咔嚓咔嚓的声音，他们低声呢喃，声音沙哑而刺耳。");
	text = text.replace("And so they go on, hardly even bothering to look at you.", "他们就这么继续走下去，都懒得抬眼看你们一眼。");
	
	text = text.replace("Curious, you call out to the men to ask where they are going.", "出于好奇，你叫上你的人去询问他们要去哪。");
	text = text.replace("The man in front slowly turns to you, his eyes peering out from the dark of a wrapped shawl.", "领头的人慢悠悠地转向你，他的目光从包裹严实的披肩下的阴影中射出。");
	text = text.replace("He slowly draws the cloak back, revealing a head scarred in a pattern of religious rites.", "他慢慢拉下斗篷，你看见他的头上刻满了宗教仪式留下的疤痕。");
	text = text.replace("All the men behind him slowly follow suit, like a row of cards falling by the brush of a chaotic and mad wind.", "他身后的人们也如法效仿，就像一排被混乱而狂嚣的风吹倒的扑克牌。");
	text = text.replace("Davkul shall see you in the next world!", "去来世觐见达库尔吧！");
	text = text.replace("One of them shouts and they charge.", "其中一个人突然咆哮出声，那整群人毫无征兆地向你们冲了过来。");
	
	text = text.replace("Obviously, this isn\'t an ordinary sight for you so, curious, you call out to the weary travelers.", "显然，这景象对你们来说可不常见，出于好奇，你向那群疲惫不堪的旅者喊了一声。");
	text = text.replace("Words barely leave your lips before the entire line of men stops in an instant and bolts upright.", "你的话刚一出口，那一整群人便瞬间停下，直挺挺地立正。");
	text = text.replace("Their cloaks unravel and droop from their heads, and their tomes and sticks and religious imports fall aside in a uniform clatter.", "他们的斗篷从他们头上解开并落下，他们的教典、拐杖和宗教用具整齐划一地脱手落地。");
	text = text.replace("The men look around, wide eyes more alive than ever.", "那些人环顾四周，圆睁的双眼比先前多了些生气。");
	text = text.replace("One screams. Then another. And soon they are all screaming, and some crumple to the ground, clutching their ears as though to silence the horrid howls their mouths had to give, while others wheel in circles, arms out, begging for answers.", "其中一人突然尖叫起来。之后是又一个。很快他们所有人都开始惨叫，其中有些人蜷缩在地上，捂着耳朵，好像要让他们自己嘴里发出的刺耳嚎叫安静下来，而另一些人则跪在地上围成一圈，伸出双臂，乞求着答案。");
	text = text.replace("Your mere utterance has seemingly broken a spell that was so long over their heads it had brought them here, impoverished, hungry, and insane.", "你的短短一句话似乎打破了一个长期占据着他们思想，让他们穷苦，饥饿，疯狂，并控制着他们到达这里的咒语。");
	text = text.replace("Step by step, they were governed by a malicious higher power, and step by step they felt the control in their lives slip away, and with it the sanity all men require to be themselves.", "他们一点一点地被一个邪恶的高位存在所摆布，而现在，他们又感受到那操纵着他们命运的力量，以及让人保持自我的理智一点点地消逝。");
	text = text.replace("Unfortunately, you can hardly ask them what or who did this to them, for some fall over dead while others make naked sprints into the forest.", "不幸的是，你没法去问他们是什么人，或者什么东西对他们做出这一切了，因为有些人倒下死了，而另一些人则赤裸着奔进了森林。");
	text = text.replace("A curious sight such as this begs questioning, but the second a word leaves your lips the entire troop of religious men bolt upright, the sudden shuffle of clothes and gear clattering in such uniformity it as if a door was slammed shut.", "这么奇怪的景象当然引起了你们的好奇，但就在你刚张嘴吐字的瞬间，那一整群僧侣便瞬间直挺挺地立正，他们的衣服突然脱落，配饰则发出咔哒咔哒的声音，声音整齐得好像一扇被摔上的门。");
	text = text.replace("The men drop their things and begin screaming.", "他们扔下手中的东西开始尖叫。");
	text = text.replace("It is a raspy chorus.", "这场合唱无比刺耳。");
	text = text.replace("They all begin to collapse, either buckling on bony knees or clutching their stomachs in pained hunger.", "他们一个接一个地倒下，要么用枯瘦的膝盖跪在地上，要么在饥饿的痛苦中抓着肚子。");
	text = text.replace(/(.*?) comes up, shaking his head\./, "$1 走上前来，摇着头。");
	text = text.replace("Were they cursed? What could have done this?", "他们是被诅咒了吗？怎么会这样？");
	text = text.replace("You won\'t ever get an answer for a minute later every single man is dead, looking no better than corpses having recently been thawed out of the mountains.", "你永远也得不到这个问题的答案，因为那些人就在短短一分钟内死得一干二净，死状看上去不比高山上刚刚解冻的干尸强上多少。");
	text = text.replace("The spell must have forcibly piloted their pilgrimage here, straining the human body while keeping it alive by the mere strand of ethereal malevolence.", "那个诅咒一定是强迫他们进行着这场朝圣之旅，榨取他们生命的同时又以一丝超凡的邪恶维持着他们躯体的存活。");
	text = text.replace("Although they are all dead, you do not regret freeing them of such a horrid curse.", "尽管这些人全都死了，但你并不后悔将他们从如此恶毒的诅咒中解脱出来。");
	
	text = text.replace(/Curious as to where these men are going, you open your mouth, but (.*?) the monk steps forward, cutting you off\./, "出于对这些人将要前往何处的好奇，你张开了嘴，但僧侣 $1 上前一步打断了你。");
	text = text.replace("He goes to the man in front of the troop and has quiet counsel with him.", "他走到队伍前面的人面前，和他低声交谈起来。");
	text = text.replace("There is plenty of nodding, hrrumphing, and other gesticulations of men who dwell long on things well beyond the human realm.", "过程中交杂着许多次点头，低语和其他长期沉湎于超脱人间漫宿之外事物的人会做出的动作。");
	text = text.replace("Eventually, the monk comes back.", "最后，他走了回来。");
	text = text.replace("They\'re on a pilgrimage and now our name travels with them.", "他们正在进行一场朝圣之旅，而现在我们的名字将会随着他们一同旅行。");
	text = text.replace("Many shall hear of it.", "会有好多人听说它的。");
	text = text.replace("You thank the monk for a job well done.", "你称赞僧侣干的很出色。");

//renown_tutorial_event.nut
	text = text.replace("While the company takes a short rest, you sit down to examine the wound where an arrow punctured your side not long ago.", "当战队稍作休息时，你坐下来检查一下不久前一支箭刺穿你侧面的伤口。");
	text = text.replace(/It\'s been healing slowly and still aches if you move too quickly, but things are getting better\. (.*?) joins you, seizing this opportunity to talk to his captain\./, "它一直在慢慢愈合，如果你动作太快，仍然会疼痛，但情况正在好转。$1 走进你，抓住这个机会和他的队长谈话。");
	text = text.replace(/So the way I see it, nobody knows about the (.*?) yet\./, "在我看来，还没有人知道 $1。");
	text = text.replace("We don\'t want to hunt rag-tag bands of brigands through the woods forever, but we\'ll have to make a name for ourselves first as reliable swords-for-hire that can get things done before the noble houses take notice.", "我们不想永远在树林里猎杀一群衣衫褴褛的土匪，但我们必须先以可靠的雇佣之剑出名，在贵族家族注意到之前，先把事情办好。");
	text = text.replace("They\'ll want to use the company for far better paying tasks, I\'m sure.", "我敢肯定，他们会想利用战队来完成更高的工作。");
	text = text.replace("He adjusts his weapon belt and continues.", "他调整好武器带，继续道。");
	text = text.replace("Just we keep in mind that the high lords are playing a dangerous game and we don\'t want to get on their bad side.", "只是我们要记住，大人们在玩一场危险的游戏，我们不想站在他们那一边。");
	text = text.replace("There\'s enough stories of people who crossed them only to end up quartered and fed to the pigs, and they have the means to squish even a company of sellswords.", "有足够多的故事讲的是，有人越过它们，最后却只得到四分之一的猪食，他们甚至有办法压扁一整队佣兵。");
	text = text.replace("He pauses a short moment and then adds another thought.", "他停了一会儿，又加了一个念头。");
	text = text.replace("The guildmasters and councilmen running the villages and towns, too, have a good memory.", "管理乡镇的行会员和议员也记性很好。");
	text = text.replace("We depend on them to hire the company for now, but having some influential friends may also help us get better deals with the merchants.", "我们现在依靠他们来雇用战队，但有一些有影响力的朋友也可以帮助我们与商人达成更好的交易。");

//retired_soldier_tale_event.nut
	text = text.replace(/(.*?) sits about the campfire telling war stories\./, "$1 坐在篝火旁讲述着他的战争故事。");
	text = text.replace("If he\'s lying, it\'s merely an embellishment, as the scars all about his body speak unsightly truths.", "就算他说了谎话，那也一定只是一种修辞，因为遍布他全身的每处伤疤都无声地诉说着真相。");
	text = text.replace("With each tale, the men become more engrossed, emboldened, and ready to get back out there and forge their own stories.", "每当听完一个故事后，人们都变得更加专注、信心百倍，准备着回到战场上去书写他们自己的故事。");

//rookie_gets_hurt_event.nut
	text = text.replace(/After the battle is over, you find (.*?) on his knees, his body swaying back and forth as he nurses a wound\./, "战斗结束后，你发现 $1 跪在地上，身体随着他护理自己的伤口而来回颤抖。");
	text = text.replace("You hear muffled cries in between all-too-loud moans.", "你听见一阵介于低沉抽泣与放声大哭之间的哭声。");
	text = text.replace("Approaching, you ask the man if he is alright.", "你走近他，问他他还好吗。");
	text = text.replace("He shakes his head and explains that this was his first taste of real, vicious combat.", "他摇摇头，解释说这是他第一次经历真正的血腥搏杀。");
	text = text.replace("It was not what he expected and isn\'t sure if he can continue.", "这种事不是他所期望的，而他也不确定他能否继续坚持下去。");
	
	text = text.replace("You tell the mercenary to man up.", "你告诉那名雇佣兵像个爷们一样振作起来。");
	text = text.replace("When he pauses, stifling a cry, you tell him again.", "当他停下来，忍住哭泣时，你第二次向他说了同样的话。");
	text = text.replace("This time, he brings a leg out and plants a foot, steadying himself.", "这一次，他伸出一条腿，迈出一只脚，稳住了自己。");
	text = text.replace("With true grit, he manages to get himself standing again.", "凭着发自内心的勇气，他设法重新站了起来。");
	text = text.replace("His shirt is bloodslaked, his face covered in mud and crimson and other viscera battle makes of the living.", "他的衣服上沾满了血，脸上全是泥巴和血污，还有一场血战会在人身上留下的其他东西。");
	text = text.replace("But his eyes show a sign of resolve they did not before.", "但他的眼中显露出了他以前没有的决心。");
	text = text.replace("He nods at you before walking back to join the rest of the men.", "他向你点头，然后走回去和其他人会合。");
	
	text = text.replace("Unfortunately, telling the man to \'suck it up\' gets him nowhere.", "不幸的是，告诉这个人“忍着点”并没有什么用。");
	text = text.replace("He turns to you, face covered in the blood and gore of battle, but before any words can come out his lip quivers and keels over again.", "他转过身来，脸上全是血和其他战斗留下的痕迹，他的嘴唇在他还没说出一个字之前就颤抖起来，他又跪在了地上。");
	text = text.replace("You ask the man if he wishes to be cut from the company, but he shakes his head no.", "你问他是不是想被战队开除，他摇头否认。");
	text = text.replace("He\'ll get better, he explains.", "他解释说他会好起来的。");
	text = text.replace("You nod and walk off, but there\'s little doubt that this poor show of resolve has hurt the man\'s pride.", "你点头走开了，但毫无疑问，自己这种缺乏决心的表现已经深深伤害了这个人的自尊心。");
	
	text = text.replace("The man looks around him, at the bodies, at the land, at the sky.", "他环顾四周，看着尸体，看着土地，看着天空。");
	text = text.replace("He nods and gets to his feet.", "他点头站了起来。");
	text = text.replace("Before heading back to camp, he thanks you for your words.", "在回营地之前，他为你说的话向你表示感谢。");
	text = text.replace("Thankee, captain. I\'ll do a better job of hiding my fears.", "谢谢你，队长。我会干得更好去隐藏我的恐惧的。");
	text = text.replace("You nod back with a terse smile before putting your fist to your chest.", "你点头回敬他一个简洁的微笑，然后把拳头放在胸前。");
	text = text.replace("Bottle it all up right here and don\'t let anybody else see it.", "把恐惧埋在心底，别让其他人发现。");
	text = text.replace("Half of any battle is convincing your opponent that you\'re crazier than they are.", "战胜秘诀的一半就是让你的敌人以为你要比他们更加凶残。");
	text = text.replace("Being fearless is impossible, but faking it for a time is not.", "没人能做到无所畏惧，但暂时假装英勇无畏并没有那么难。");
	text = text.replace("The man nods again and heads back to camp with his head held a little bit higher.", "他再次点头，然后转身回到营地，这次，他的头抬得比以前更高了。");
	
	text = text.replace("The man turns to you, tears cutting through the crusts of blood on his cheeks.", "那人转向你，泪水划开了他脸颊上的血迹。");
	text = text.replace("He shakes his head and asks how is it that he\'s the only one out here crying.", "他摇摇头，问为什么只有他在外面哭。");
	text = text.replace("You shrug and ask the man if he wishes to leave the company.", "你耸耸肩，问他是否想要离开战队。");
	text = text.replace("He shakes his head again.", "他又摇了摇头。");
	text = text.replace("I\'ll get better. I just.. I just need some time to do it, that\'s all.", "我会做得更好的。我只是…我只是需要些时间，就这样。");

//runaway_laborers_event.nut
	text = text.replace("As you walk along the roads, a throng of ragged-looking men speed past you.", "当你走在路上时，一群衣衫褴褛的人从你身边狂奔而过。");
	text = text.replace("They clear off the path and jump down into an embankment and hide behind a wall of bushes.", "他们或离开小径，或跳下路堤，或是躲在灌木丛的屏障后。");
	text = text.replace("With the shrubbery still swaying, another group of men soon appears.", "灌木丛还在摇晃，很快又有一群人出现了。");
	text = text.replace("Before the first man even speaks you already know what\'s coming.", "在对方的领头开口之前，你就已经知道发生什么了。");
	text = text.replace("Apparently some laborers had agreed in union to abandon a project over what the pursuing overseers simplify as \'issues\'.", "显然，一些工人联合起来，因为一些追踪他们的监工只是轻描淡写地称作“问题”的原因放弃了工程。");
	text = text.replace("They ask if you have seen these ne\'er do wells.", "他们问你有没有见过那群消极怠工的家伙。");
	
	text = text.replace("The overseers nod and draw clubs and pitchforks and even some nets.", "监工们点头，然后抽出棍棒，草叉，甚至还有几张网。");
	text = text.replace("They scramble off the road and converge onto the bushes like a bunch of raiders would a wagon.", "他们一哄而散，离开公路汇入灌木，像是一群袭击载重货车的强盗。");
	text = text.replace("It is a wild, though one-sided, fight.", "这是一场激烈而又一边倒的战斗。");
	text = text.replace("Men are beaten and battered like fish in a bush.", "工人们就像掉进灌木的鱼一样被暴揍殴打。");
	text = text.replace("Even far up the hillside you can hear the unmistakable clonking of wood on skull.", "就算远远地站在山坡上，你都能听见木棍敲在人头骨上发出的响声。");
	text = text.replace("You see one man fatally stabbed with a spear, perhaps the resolution of a conflict of a somewhat more personal matter.", "你还看见有个人被一把长矛残忍地刺穿，好像有人借着冲突趁机解决了一下私人恩怨。");
	text = text.replace("When the battle ends, the head overseer returns to you, a line of prisoners behind him looking rather worse for the wear.", "战斗结束后，领头的监工回到你这边，一堆造型更加难堪的囚犯跟在他身后。");
	text = text.replace("He hands you a purse of coins, clapping you on the shoulder and thanking you for keeping \'order\'.", "他递给你一包硬币，拍拍你的肩膀，感谢你帮助他们维持“秩序”。");
	
	text = text.replace("With your finger still pointing the wrong way, the overseers take off..", "你的手指坚定地指向错误的方向，监工们离开了。");
	text = text.replace("Their angry barking fades into the distance.", "他们愤怒的喊声消失在远处。");
	text = text.replace("When they are gone, the laborers slowly emerge.", "他们走后，工人们慢慢地现身了。");
	text = text.replace("They appear rather surprised that a sellsword didn\'t sell word of them in the bushes.", "他们似乎很惊讶，一群佣兵竟然没有出卖他们。");
	text = text.replace("One by one they take off their hats and bless you for your mercy.", "他们一个接一个对你们脱帽致敬，为你的仁慈祈福。");
	text = text.replace("One even calls it \'justice\', a strange word in a mercenary\'s ear.", "甚至有人称你们的行为是“正义”，一个在雇佣兵耳朵里是个很奇怪的词。");
	text = text.replace("While most of them make off, one man stands idly behind.", "当他们中的大多数人都离开时，有一个人茫然地留在后面。");
	text = text.replace("He asks if maybe he can join your company if, you know, you got room for him.", "他问他是否能加入你们的战队，如果，你懂的，你还有能留给他的位置的话。");
	
	text = text.replace("All of the overseers take off in the wrong direction - except one.", "所有的监工都朝着错误的方向出发了－除了其中一个。");
	text = text.replace("He stands still the by roadside, looking down the embankment.", "他静静地站在路边，向路堤下看去。");
	text = text.replace("For a brief moment you consider taking a cool blade across his neck, drawing the words out of his throat instead of his mouth.", "有那么一瞬间，你寻思着要不要一刀抹了他的脖子，把他的话憋死在嗓子里。");
	text = text.replace("The man quickly turns to his comrades and yells and points down the hillside.", "那人很快转向他的战友们，喊叫着指向山坡下。");
	text = text.replace("Sensing their being seen, the laborers dash out of the bushes going this way and that.", "工人们察觉到自己被发现了，就从灌木丛里冲出来一哄而散。");
	text = text.replace("They must be malnourished for most move with the speed of a skeleton climbing a flight of stairs.", "他们的大部分人肯定都营养不良，因为他们的速度慢得就像一具试图爬楼梯的骷髅。");
	text = text.replace("The ensuing battle is rather gruesome and uncalled for, the overseers being quite punitive in their capturing measures.", "接下来的战斗相当残暴而不公，监工们的抓捕措施相当具有惩罚性。");
	text = text.replace("When it\'s all said and done they begin to depart just as quickly as they came, the laborers now tied up in rope and their heads covered with sacks.", "当一切尘埃落定后，他们开始离开，就像他们来的一样快，那些工人们现在被绳子五花大绑，头上还套着袋子。");
	text = text.replace("Before he leaves, the head overseer shares a word of contempt for you.", "领头的监工在离开前对你骂了句脏话。");
	text = text.replace("With your blade slowly coming out of its sheathe, you ask the man if he has anything else he wishes to add.", "你慢慢地从鞘里拔出利刃，问他还有什么要补充的。");
	text = text.replace("He spits and shakes his head no.", "他吐了口唾沫，摇头否认。");
	
	text = text.replace("With your finger still pointing the wrong way, the overseers take off.", "你的手指坚定地指向错误的方向，监工们离开了。");
	text = text.replace("Their angry barking fades into the distance.", "他们愤怒的喊声消失在远处。");
	text = text.replace("When they are gone, the laborers slowly emerge.", "他们走后，工人们慢慢地现身了。");
	text = text.replace("They appear rather surprised that a sellsword didn\'t sell word of them in the bushes.", "他们似乎很惊讶，一群佣兵竟然没有出卖他们。");
	text = text.replace("One by one they take off their hats and bless you for your mercy.", "他们一个接一个对你们脱帽致敬，为你的仁慈祈福。");
	text = text.replace("One even calls it \'justice\', a strange word in a mercenary\'s ear.", "甚至有人称你们的行为是“正义”，一个在雇佣兵耳朵里是个很奇怪的词。");

//running_around_event.nut
	text = text.replace("Walking, running, fighting, fucking, all good for a man\'s heart.", "走走路，跑跑步，打打仗，操操逼，都是些有益身心健康的事情。");
	text = text.replace("The time spent traveling the land has improved the vitality and vigor of the men.", "在大陆上四处旅行的时间锻炼了你战团成员的精气与活力。");
	text = text.replace("You even caught one of the cheekier mercenaries flexing into pondwater, admiring his own reflection like some smirkin\' wench.", "你甚至看见过一个脸皮厚的雇佣兵弯腰走进池塘里，像个傻缺一样欣赏自己的倒影。");
	text = text.replace("All this running about the land has increased the stamina of the men.", "在大陆上来回奔走锻炼了战队成员的体力。");
	text = text.replace("One runs in place, holding a finger to his neck.", "一个在原地跑步，把一根手指抵在脖子上。");
	text = text.replace("He remarks that his heart rate isn\'t going up at all.", "他声称他的心率根本没有升高。");
	text = text.replace("Another brother remarks that the guy doesn\'t even know how to count.", "另一个兄弟说那家伙连数数都不知道。");
	text = text.replace("The running man pauses.", "跑步的那个佣兵停了下来。");
	text = text.replace("That\'s right.", "你说得对。");

//sacrificed_man_event.nut
	text = text.replace("A strange sight: one dead man pinned to the earth with spears.", "一个奇怪的景象：一个死人被矛钉在地上。");
	text = text.replace(/His own blood has been used to circle his corpse and other strange ritualistic rites have been painted by way of his lifeblood\. (.*?) starts retrieving the spears\./, "他自己的血被用来在他的尸体上画圈。其他奇怪的仪式也用他的血来描绘。$1 开始收回那些矛。");
	text = text.replace("You try and tell him to stop, but it\'s already too late.", "你试着让他停下来，但已经太晚了。");
	text = text.replace("He holds one of the weapons up.", "他举起其中一件武器。");
	text = text.replace("What? These are of good quality.", "什么？这些武器质量很好。");
	text = text.replace("Why would we leave them here?", "我门为什么要把它们留在这？");
	text = text.replace("Well, if there was a deific protection here it\'s already been broken.", "好吧，如果这是一个神圣的守护仪式，它已经被破坏了。");
	text = text.replace("You collect the spears.", "你收起那些矛。");
	
	text = text.replace(/Before you can leave, (.*?) bends low to the sacrificed man and whispers into his ear\./, "在你离开之前，$1 向那个被献祭的人低下头，在他耳边低语。");
	text = text.replace("A moment later, the dead man\'s head lurches.", "过了一会儿，那个死人的头歪了。");
	text = text.replace("His eyes widen and nostrils flare.", "他睁大眼睛，鼻孔张得大大的。");
	text = text.replace("The cultist looks over to you.", "异教徒看着你。");
	text = text.replace("He wasn\'t dead. His blood was used to satiate Davkul.", "他没死。他的血被用来使达库尔满足。");
	text = text.replace("Had we needed his death, we would have burned him.", "如果我们需要他死，我们应该烧死他。");
	text = text.replace(/He pauses, turning to the man whose wounds are mysteriously healing before your eyes like mud filling in a footprint. (.*?) pets him on the cheek\./, "在你目瞪口呆之前，他停顿了一下，转向那个伤口在你眼前神秘地愈合的人。$1 轻拍他的脸颊。");
	text = text.replace("Come, friend, and serve Davkul.", "来吧，朋友，为达库尔服务。");
	text = text.replace("The un-sacrificed man jumps to his feet and instinctively turns toward you.", "这个未被牺牲的男人跳起来，本能地转向你。");
	text = text.replace("Somehow, he already knows you\'re the captain here and bends a knee.", "不知怎么的，他已经知道你是这里的队长了，于是弯下了膝盖。");
	text = text.replace("If you allow it, I will fight for you and, in doing so, spread the faith of Davkul.", "如果你允许，我将为你而战，并以此来传播达库尔的信仰。");
	text = text.replace("His voice is robotic, as if he\'d spent the last year practicing the oath.", "他的声音很机械，好像他去年一年都在练习宣誓似的。");
	
	text = text.replace(/You decide to take the man in\. (.*?) stands by the wayside, a couple of spears in hand\./, "你决定收留这个人。$1 站在路边，手里拿着一对长矛。");
	text = text.replace("We\'re still taking these, right?", "我们还可以拿走这些，对吗？");
	
	text = text.replace("You deny the born-again cultist. He nods.", "你拒绝了重生的异教徒。他点头。");
	text = text.replace("Of course. I will find other ways to serve Davkul. Farewell, brother.", "当然。我会找到其他方法侍奉达库尔。再会，兄弟。");
	text = text.replace(/He bows to (.*?) before turning and leaving\. (.*?) stands there with a couple of spears in hand\./, "在转身离开前，他向 $1 鞠躬。$2 手里拿着一对长矛站在那里。");
	text = text.replace("We\'re still taking these, right?", "我们还可以拿走这些，对吗？");

//scientist_in_the_mountains_event.nut
	text = text.replace("You come across an unexpected sight at the top of the mountain: a man sitting in a strange and wooden contraption, tilting it toward the edge of a deadly precipice.", "在你路过山顶的时候看到了一番奇特的景象：一个人坐在一个奇怪的木制装置里，把它倾斜到一个足以致命的悬崖边。");
	text = text.replace("He\'s got a scarf over his eyes, pulling it down to talk.", "他的眼睛上方有一条围巾，他拉下了围巾。");
	text = text.replace("Ahoy, strangers. It appears you shall record history!", "喂,陌生人。看来你要记录历史了！");
	text = text.replace("For men governed the common horse to run faster than it knew how, I shall govern birds to... well, we can\'t ride birds, but I can, as you can see by this machine, simulate them.", "因为人类支配着这匹普通的马，让它跑得比自己所知道的还要快，所以我要支配鸟类…好吧，我们不能骑鸟，但我可以，正如你从这台机器上看到的，模拟它们。");
	text = text.replace("The shackles of space and time shall be lifted, much like these here wooden wings will lift me into the very skies!", "时间和空间的枷锁将被解除，就像这些木翼将我升入空中！");
	text = text.replace("This \'contraption\' comes with pedals, wooden spokes, and tarps of very thin and hastily stitched leather.", "这个“奇妙装置”配有踏板、木辐条和薄薄的匆忙缝制的防水油布。");
	
	text = text.replace("You step forward and explain the reality of the situation.", "你向前一步，说明这件事的本质。");
	text = text.replace("Good... sir. What bird takes flight from such great heights?", "好吧…先生。什么鸟能从这么高的地方飞起来？");
	text = text.replace("Does not a bird simply propel itself upward with the thrust of its wings?", "鸟不是简单地用翅膀推动自己向上飞吗？");
	text = text.replace("You\'re going to throw yourself off this cliff in the hopes that your machine will work, knowing deep in your heart that it will not.", "你会把自己丢下悬崖，如果把希望寄托在你的机器能工作上，但你内心深处知道它不会工作。");
	text = text.replace("The haggard looking mountain scientist looks at his feet. He nods solemnly.", "面容憔悴的山区科学家看着他的脚。他郑重地点头。");
	text = text.replace("It could use some tinkering, I suppose.", "可以做些修改，我想。");
	text = text.replace("You have an avian eye, good sir.", "你有一双鸟的眼睛，好心的先生。");
	text = text.replace("And you also have my thanks.", "我还要谢谢你。");
	text = text.replace("I shall tell people of your great wisdom!", "我将告诉人们你的伟大智慧！");
	
	text = text.replace("You step back and let the man take flight.", "你退后一步让他飞行。");
	text = text.replace("He wraps his face in the scarf and sits into the seat of his machine.", "他把脸裹在围巾里，然后坐在机器的座位上。");
	text = text.replace("With a few long breaths, he pedals it forward.", "他做了几次深呼吸，然后踩下踏板向前。");
	text = text.replace("It promptly falls over the edge.", "它很快到了崩溃的边缘。");
	text = text.replace("The man is hurled through the leather wings like some sort of screaming bat.", "那个男人像一种尖叫的蝙蝠一样从皮翅膀中被甩了出去。");
	text = text.replace("He spins through the device as it explodes down the rockwall in a torrent of wood and poor design.", "他旋转着设备，好像要爆破一大堆木头中的石墙，真是糟糕的设计。");
	text = text.replace("A moment later, you hear the faint din of his final landing spots. Spectacular!", "过了一会儿，你听到他最后降落地点传来微弱的嘈杂声。引人入胜的！");
	text = text.replace("The man pushes his machine off the edge, hopping into its seat at the last moment.", "这名男子把他的机器推下了边缘，在最后一刻跳上了座位。");
	text = text.replace("They both tip over the precipice and there\'s a brief scream.", "他们俩都跌下了悬崖，只听见一声短暂的尖叫。");
	text = text.replace("But, against all odds, the man quickly reappears!", "但是，尽管困难重重，这个人很快又出现了！");
	text = text.replace("His contraption flutters from side to side like some drunken butterfly, but he\'s in the air nonetheless.", "他的新发明像喝醉了的蝴蝶一样左右摇摆，但他仍然在空中。");
	text = text.replace("I did it, by the gods I did it! Look at me...", "我做到了，神啊，我做到了！看着我…");
	text = text.replace("Suddenly, a shrieking falcon spears through one of his wings.", "突然，一只尖叫的猎鹰刺穿了他的一只翅膀。");
	text = text.replace("The bird loops around for another strike, tearing apart the other wing.", "这只鸟盘旋着再次攻击，扯断了另一只翅膀。");
	text = text.replace("You wave your hands and try to scare the killer bird away.", "你挥挥手想把那只杀人鸟吓跑。");
	text = text.replace("Hey, hey!", "嘿，嘿！");
	text = text.replace("The machine totters and slowly starts to lose altitude.", "机器摇摇晃晃，慢慢地开始下降高度。");
	text = text.replace("With the man pedaling harder to compensate, the spokes begin to break and a moment later the whole thing busts apart and you can only watch as the haggard scientist plummets to his doom.", "当那个人踩着踏板使劲去弥补时，辐条开始断裂，片刻之后，整个东西都裂开了，你只能看着这个憔悴的科学家坠入地狱。");
	text = text.replace("The falcon simply squats on the cliff face and watches its enemy die.", "猎鹰只是蹲在悬崖上，看着它的敌人死去。");
	
	text = text.replace("Against better judgment, you let the man fly.", "你不顾更好判断，让那个人飞。");
	text = text.replace("He bundles his face in the scarf as though that\'ll save him of the soon to come hard landing.", "他用围巾把脸裹得严严实实的，好像这样可以使他免于即将到来的硬着陆似的。");
	text = text.replace("With a deep breath, he pushes his contraption off the edge and leaps in at the last moment as though he were joining his lover in a romantic suicide.", "他深吸了一口气，推开他的装置，在最后一刻跳了进去，仿佛他是在和他的情人一起浪漫地自杀。");
	text = text.replace("The man and machine quickly disappear.", "人和机器很快就消失了。");
	text = text.replace("You start to laugh when suddenly the man reappears.", "当那个人突然再次出现时，你开始大笑。");
	text = text.replace("He\'s furiously pedaling his machine, the wings flapping hard.", "他疯狂地踩着踏板，翅膀使劲地拍打着。");
	text = text.replace("He sails around, looping this way and that, slowly getting higher and higher.", "他四处航行，绕着这个方向，那个方向，慢慢地越来越高。");
	text = text.replace("I did it! By the gods, I did it!", "我做到了！神啊，我做到了！");
	text = text.replace("Look at how high I can go!", "看看我能飞多高！");
	text = text.replace("He shoots upward into the clouds, the rickety din of its wooden spokes whining away.", "他向上射进云层，木头辐条发出的吱吱嘎嘎的声音消失了。");
	text = text.replace("Ohh, ohhhhh!", "噢，噢啊！");
	text = text.replace("That\'s the last you see or hear of him.", "那是你最后一次见到或听到他。");
	text = text.replace("The man pushes the machine off the edge and hops into the seat just as it totters over the edge.", "男人把机器推下边缘，跳上座位，就在它摇摇晃晃地滑过边缘的时候。");
	text = text.replace("Screaming, the man climbs back up the contraption as it falls away.", "在尖叫中，这名男子爬回了这个装置。");
	text = text.replace("He leaps off the last tip of its poorly constructed wooden frame, propelling himself back to the precipice where he hangs on for dear life.", "他从那简陋的木架的最后一根尖上跳了下来，把自己推回到悬崖边，在那里他死命地挣扎着。");
	text = text.replace("You sprint over and drag him back up.", "你冲过去把他拉上来。");
	text = text.replace("His machine smashes into the ground far below, a soft din of predetermined destruction.", "他的机器轰然一声撞向地下深处，那是一种预示着毁灭的柔和的喧嚣。");
	text = text.replace("Brushing himself off, the man nods at you.", "这个自负的家伙，朝你点了点头。");
	text = text.replace("Thank you sir. I had a moment of clarity.", "谢谢你，先生。我突然清醒了一下。");
	text = text.replace("What does a bird do?", "鸟是干什么的？");
	text = text.replace("It doesn\'t take off from great heights, it takes off wherever it pleases!", "它不会从很高的地方起飞，它会随心所欲地起飞！");
	text = text.replace("I shall rework the project!", "我要重做这个项目！");
	text = text.replace("Thank you for saving my life, sir.", "谢谢你救了我的命，先生。");
	text = text.replace("The way you see it, that went as well as it could have.", "在你看来，这已经是最好的结果了。");
	text = text.replace("The men are mightily entertained anyway.", "总之，队员们非常愉快。");

//sellsword_gets_better_deal_event.nut
	text = text.replace(/While counting inventory, (.*?) joins your side, mindlessly picking at this sword or that shield\./, "在清点库存时，$1 加入进来，盲目地选择这把剑或那把盾。");
	text = text.replace("You set your quill pen down and ask him what\'s up for he sure as shit isn\'t here to count anything.", "你放下你的羽毛笔，问他发生了什么事，因为他肯定不会在这里算计任何东西。");
	text = text.replace("He explains that another company wishes to use his swordhand - and they\'re willing to pay more.", "他解释说，另一个战队想用他做剑士－而且他们愿意付更多的钱。");
	text = text.replace("You ask how much and he holds up his hands to count.", "你问他多少钱，他举起手来表示。");
	text = text.replace(/They\'re talking (.*?) crowns a day\./, "他们说 $1 克朗一天。");
	text = text.replace(/He\'s earning (.*?) crowns a day with you\./, "他跟你一天才赚 $1 克朗。");
	
	text = text.replace("You turn around, crossing your arms and jacking a boot against a crate.", "你转过身，交叉双臂，用靴子顶着板条箱。");
	text = text.replace(/Staring out across the land, you tell (.*?) that the company has been through a lot together and everyone, yourself especially, would hate to see him go\./, "望着远方，你告诉 $1 战队已经经历了很多，每个人，尤其是你自己，都不愿意看到他离开。");
	text = text.replace(/He has a second family here with the the (.*?) and that\'s a rare treat in the mercenary world\./, "他在这里有第二个家，就是 $1，这在雇佣兵的世界里是很少见的。");
	text = text.replace("Where he\'s going there is no guarantee of what he may find.", "他要去的地方并不能保证他能得到什么。");
	text = text.replace("You know, because you\'ve been there.", "你知道的，因为你经历过。");
	text = text.replace("You\'ve been in his very shoes, and you took those shoes and walked. And regretted it.", "你也曾站在他的立场上，你坚持这样的立场离开了。而且为此悔恨。");
	text = text.replace("The sellsword looks at the ground, thinking your words over.", "佣兵看着地面，仔细琢磨着你的话。");
	text = text.replace("Finally he nods and agrees to stay.", "最后他点了点头，同意留下来。");
	text = text.replace("You tell him he\'s made the right choice.", "你告诉他，他做了正确的选择。");
	text = text.replace("The man turns and taps a quiver of arrows as he walks away.", "那人转过身去，轻拍了一下箭袋，然后走开了。");
	text = text.replace("Might want to refill that.", "可能需要重新填满它。");
	
	text = text.replace("You turn around, crossing your arms and jacking a boot against a crate.", "你转过身，交叉双臂，用靴子顶着板条箱。");
	text = text.replace(/Staring out across the land, you tell (.*?) that the company has been through a lot together and everyone, yourself especially, would hate to see him go\./, "望着远方，你告诉 $1 战队已经经历了很多，每个人，尤其是你自己，都不愿意看到他离开。");
	text = text.replace(/He has a second family here with the the (.*?) and that\'s a rare treat in the mercenary world\./, "他在这里有第二个家，就是 $1，这在雇佣兵的世界里是很少见的。");
	text = text.replace("Where he\'s going there is no guarantee of what he may find.", "他要去的地方并不能保证他能得到什么。");
	text = text.replace("You know, because you\'ve been there.", "你知道的，因为你经历过。");
	text = text.replace("You\'ve been in his very shoes, and you took those shoes and walked. And regretted it.", "你也曾站在他的立场上，你坚持这样的立场离开了。而且为此悔恨。");
	text = text.replace("The sellsword looks at the ground, thinking your words over.", "佣兵看着地面，仔细琢磨着你的话。");
	text = text.replace("Finally he shakes his head and purses his lips with a look of \'sorry\'.", "最后，他摇了摇头，噘起嘴唇，带着“对不起”的表情。");
	text = text.replace("You tell him he\'s making the wrong choice, but he\'s having none of it.", "你告诉他，他做了一个错误的选择，但是他不这么认为。");
	text = text.replace("The man turns and taps a quiver of arrows as he walks away.", "那人转过身去，轻拍了一下箭袋，然后走开了。");
	text = text.replace("Might want to refill that.", "可能需要重新填满它。");
	text = text.replace("The arrows are a little low, but all you can think about is figuring out how to replace a good swordhand such as he.", "箭确实有点少，但你满脑子想的都是如何替换像他这样的好剑手。");
	
	text = text.replace("You sigh. The man nods and starts to leave, but you stop him.", "你摇头叹息。这个男人点了点头，准备离开，但你阻止了他。");
	text = text.replace("You\'ll pay the amount so he can stay.", "你得付这笔钱，这样他才能留下。");
	text = text.replace(/The (.*?) simply cannot afford to lose a man like him\./, "$1 不能承受失去他这样的人。");

//sellsword_vs_raider_event.nut
	text = text.replace(/The raider, (.*?), is sharpening his weapon beside the campfire\./, "这个掠夺者，$1，正在篝火旁打磨他的武器。");
	text = text.replace(/He tells stories of his days raiding coasts and making off with piles of loot, his crooked smile grinning in the blade\'s sharpened sheen\. (.*?) the sellsword listens for a time then gets up laughing\./, "他讲述了他的故事，他掠夺海岸地区，获得成堆的战利品的日子，他扭曲而狂放的笑声映衬在利刃被打磨锋利所产生的光亮之中。$1 这个佣兵听了一会儿并大笑起来。");
	text = text.replace("Oh, fella, them quite the stories you tell.", "噢，小伙子，你讲的故事真不错。");
	text = text.replace("Here\'s mine: I earned my keep killing men, whether in their homes or in battle, but men nonetheless.", "这是我的：我一直在杀人，不管是在家里还是在战场上，但是男人不该这样。");
	text = text.replace("You run about in yer boats, waitin\' for the menfolk to be gone, then ya scamper across the beaches to kick the little lads, rape the lasses, and steal from old friars.", "你在你的船上乱跑，等着男人们离开，然后你跑过海滩，踢小男孩，强奸小女孩，从老修士那里偷东西。");
	text = text.replace("You got nothing to boast of, raider.", "你没什么好吹嘘的，掠夺者。");
	text = text.replace(/(.*?) lowers his blade\./, "$1 放下他的利刃。");
	text = text.replace(/We islanders at least have honor amongst us, whereas you\'d stab the (.*?) in the back for an extra crown in your purse\./, "我们岛上的人至少在我们中间是有荣誉的，而你会为了钱包里多几个的克朗在 $1 后背捅上一刀。");
	text = text.replace("Speak ill of my past again, sellsword, and I\'ll have that mouth of yours gnawing dirt.", "再讲我过去的坏话，佣兵，我就让你的嘴巴啃泥土。");
	text = text.replace("An exchange of fightin\' words leads to just that: a fight.", "言语交锋只会导致：一场战斗。");
	text = text.replace("Blades flash and blood is spilled.", "刀锋一闪，鲜血四溅。");
	text = text.replace("The rest of the company jumps in before too much damage can be done.", "战队的其他成员在造成太大损失之前就加入进来了。");

//shady_character_offers_map_event.nut
	text = text.replace("While marching along, a lone merchant with his packhorse emerges onto your path.", "行进中，一个孤独的商人带着他的驮马出现在你的路上。");
	text = text.replace("He has his arms out and his hands visible.", "他伸出双臂，双手清晰可见。");
	text = text.replace("Evening, travelers. Might I interest you in some wares?", "晚上好，旅行者们。我可以让你对一些商品感兴趣吗？");
	text = text.replace(/He lists off a number of things the (.*?) could possibly have no use for, but then he mentions a map\./, "他摆出很多东西但是 $1 几乎都用不上，然后他提到了一张地图。");
	text = text.replace("You must\'ve raised an eyebrow, because he raises his and a smile with it.", "你当然已经扬起眉毛，因为他扬起眉毛笑了。");
	text = text.replace("Ah, interested in a map are ya?", "唉，你对地图有兴趣吗？");
	text = text.replace("This here cartographical, topographical, geographical oddity carried by a man who, I assure you, is quite sensical!", "这是这里的绘制地图，地形，地理上奇怪的东西，我向你保证，带在一个人身上是非常有意义的！");
	text = text.replace(/This here paper tells you the exact location of the famous \'(.*?)\'\./, "这篇文章告诉你著名的“$1”的确切位置。");
	text = text.replace("I\'m sure you\'ve heard about it, yes?", "我肯定你过去听说过，是吗？");
	text = text.replace("Host to untold treasures!", "拥有数不清的宝藏！");
	text = text.replace("Resting place of some this world\'s finest arms!", "世界上一些最好武器的安息之所！");
	text = text.replace(/And all it\'ll cost you is a meager (.*?) crowns!/, "而这一切你将话费微不足道的 $1 克朗！");
	text = text.replace("He turns his head with a long grin.", "他咧嘴笑着转过头去。");
	text = text.replace("It appears he\'s sold some of his teeth in his days on the road.", "看来他在旅途中卖掉了一些牙齿。");
	text = text.replace("So, travelers, what you got to say to that?", "所以，旅行者们，你们有什么想说的么？");
	
	text = text.replace("Having acquired the map, you take a good long look at it.", "得到这张地图后，你花了好长时间好好地查看。");
	text = text.replace("You take out your own map and start looking between the two.", "你拿出自己的地图，开始在两者之间寻找。");
	text = text.replace("There\'s nothing on the purchased map that can be cross-referenced.", "购买的地图上没有任何可以相互参照的地方。");
	text = text.replace("In fact, the map you bought has strange runes scribbled at the edges.", "事实上，你买的地图边缘还乱画着奇怪的符文。");
	text = text.replace("It\'s either a recent fake, or it originated in a time when the common tongue was not your own.", "要么是最近的一个赝品，要么它起源于一个不是你的母语的时代。");
	text = text.replace("Either way, it seems very unusable.", "不管怎样，它似乎非常没用。");
	text = text.replace(/Just as you get ready to ball it up and throw it away, (.*?) the historian walks up and gently takes it\./, "就在你准备把它揉成一团扔掉的时候，$1 这个历史学家走了过来轻轻地把它捡了起来。");
	text = text.replace("He looks at the runes and begins nodding, running his finger along the edges before drawing them further inward, amongst the map\'s poorly drawn mountains and rivers and forests.", "他看着符文，开始点头，用手指在边缘上划了划，然后再往里画，在地图上画得很差的山脉、河流和森林之间。");
	text = text.replace("Hmmm... Oh... Ah yes, I\'ve read of this place before.", "哼…噢…啊，是的，我之前听说过这个地方。");
	text = text.replace("And I know these runes, though I dare not speak them aloud.", "我知道这些符文，虽然我不敢大声说出来。");
	text = text.replace("He takes the company map and uses three quill pens pinched between his fingers to slowly triangulate and translate the directions.", "他拿起战队的地图，用三支捏在手指间的羽毛笔慢慢地三角定位并翻译方向。");
	text = text.replace("Finished, he nods and whacks the back of his hand against the company map.", "说完，他点了点头，用手背在战队的地图上敲了几下。");
	text = text.replace("There, sir. That\'s where we\'ll find it.", "在那里，先生。那就是我们要找的地方。");
	
	text = text.replace("You take the map and give it a good read.", "你拿起地图仔细一看。");
	text = text.replace("You can identify some of the locations and, in time, translate its contents onto your own map.", "你可以识别一些位置，并及时将其内容翻译到你自己的地图上。");
	text = text.replace(/The (.*?) is murmuring with excitement over what might be there\./, "$1 正兴奋地低语着那里可能会有什么。");
	
	text = text.replace("You look at the map, you stare at it, you practically interrogate it with a long, long gaze.", "你看着地图，你盯着它看，你实际上是在用一种很长很长的目光审视它。");
	text = text.replace(/But you\'re just not seeing it\. (.*?) takes a look then shakes his head\./, "但你只是没有看到而已。$1 看了一眼，然后摇了摇头。");
	text = text.replace("I don\'t recognize a bit of it, sir.", "我一点也不认识它，先生。");
	text = text.replace("It\'s a fake or a map to a land you do not recognize as your own - either way, it\'s completely useless.", "这是一张假地图，或者是一张去你不认识的地方的地图－不管怎样，它都是完全没用的。");
	
	text = text.replace(/(.*?) the peddler steps forward, his hands out just like the traveling merchant\'s had been\./, "$1 这个小贩向前走了几步，伸出双手，就像曾经做旅行商人的时候一样。");
	text = text.replace("Apparently this is a common tactic amongst honest thieves.", "显然，这是诚实的盗贼常用的伎俩。");
	text = text.replace("Sir, sir, please. Come on.", "先生，先生，请。来。");
	text = text.replace("That price is outrageous.", "那个价格太离谱了。");
	text = text.replace("The merchant\'s face sours.", "商人的脸色变得难看。");
	text = text.replace("There is nothing outrageous about it, I promise you.", "这没什么过分的，我向你保证。");
	text = text.replace("But your peddler persists.", "但是你的小贩是固执的。");
	text = text.replace("Clearly there is something outrageous, because I just said so, did I not?", "很明显有些事情很离谱，因为我刚才就是这么说的，不是吗？");
	text = text.replace("The merchant nods. The peddler continues.", "商人点头。小贩继续道。");
	text = text.replace("So we\'ve decided to not purchase it at your original asking price.", "所以我们决定不按你原来的要价购买。");
	text = text.replace("That much is clear.", "这一点很清楚。");
	text = text.replace(/So, friend, I think we will purchase it for (.*?)\. That is fair to all parties involved, and surely a fine businessman such as yourself can see a deal!/, "所以，朋友，我想我们会以 $1 的价格购买它。这对各方都是公道的，像你这样优秀的商人肯定能做成一笔交易！");
	text = text.replace("We\'re hardly businessmen ourselves, but we know that\'s a good deal!", "我们自己算不上商人，但我们知道那是笔好买卖！");
	text = text.replace("The merchant scratches his chin, then nods.", "商人挠了挠下巴，然后点了点头。");
	text = text.replace("Alright, that price is fair.", "好吧，这个价格是公道的。");
	
	text = text.replace(/While you\'re talking to the merchant, (.*?) the thief sidles up next to you, appearing rather interested in the conversation\./, "当你和商人谈话时，$1 这个小偷悄悄走到你旁边，对谈话很感兴趣。");
	text = text.replace("He glances at you.", "他瞥了你一眼。");
	text = text.replace("You do a double take.", "你看了两眼。");
	text = text.replace("He grins and nods.", "他笑着点头。");
	text = text.replace("You quickly eye the salesman then glance back at the thief and nod.", "你很快地看了看商人，然后回头看了看小偷，点了点头。");
	text = text.replace("The merchant is in the middle of his sales pitch and sees none of this.", "这名商人正在进行推销，却什么也没看到。");
	text = text.replace("He keeps talking, but you hear little of it.", "他不停地讲，你几乎听不到。");
	text = text.replace("You just know to keep nodding for a merchant such as he only tells you things you want to hear anyway.", "你只需要知道一直对一个商人点头就像他只会告诉你你想听的东西。");
	text = text.replace("The thief slips around the back and drops a weapon into the mud.", "小偷从后面溜过去，把武器掉在泥里。");
	text = text.replace("Clumsy me.", "我真笨。");
	text = text.replace("He bends down, pauses, there\'s a motion you can hardly detect, and then he\'s upright again.", "他弯下腰，停顿了一下，有一个你几乎察觉不到的动作，然后他又站了起来。");
	text = text.replace("He gives you a wink.", "他对你使眼色。");
	text = text.replace("You tell the merchant you appreciate the offer, but you\'ll have to pass.", "你告诉商人你很感激这个提议，但是你不得不放弃。");
	text = text.replace(/When he\'s gone, (.*?) presents you with the map and grins\./, "当他走后，$1 把地图交给你，然后咧着嘴笑。");
	text = text.replace("They say the best things in life are free.", "他们说生命中最好的东西都是免费的。");

//shepherd_vs_ratcatcher_event.nut
	text = text.replace(/(.*?) and (.*?) are sitting beside the campfire\./, "$1 和 $2 正一起坐在篝火旁。");
	text = text.replace("As their conversation carries on, the ratcatcher becomes a bit confused.", "随着他们谈话的继续，捕鼠者变得有点困惑。");
	text = text.replace("Lemme, lemme, lemme get this straight.", "让我，让我，让我把话说清楚。");
	text = text.replace("Y-you use a stick, and so they follow because you have the stick?", "你－你用一根棍子，它们跟你走，因为你有棍子？");
	text = text.replace("It\'s all about the stick?", "就是因为那根棍子么？");
	text = text.replace("Nodding, the shepherd explains.", "点着头，牧羊人解释道。");
	text = text.replace("I prefer to call it a staff, but yes.", "我更喜欢叫它权杖，不过是的。");
	text = text.replace("Sheep are simple creatures and all that they demand is a leader.", "羊是简单的动物，它们所需要的只是一个领导者。");
	text = text.replace("The staff is an itemization of my role.", "这个权杖是我工作职责象征。");
	text = text.replace("I wield the staff, therefore I am the leader.", "我挥舞着权杖，所以我是领导者。");
	text = text.replace("At least in a little sheep\'s eyes.", "至少在小绵羊眼里是这样的。");
	text = text.replace("An obedient dog helps a lot, too.", "一只听话的狗也很有帮助。");
	text = text.replace("Truthfully, a dog would be the true leader did they not have the loyalty and honor we wished we had ourselves.", "说实话，一只狗可能成为真正的领袖，如果它们没有我们所期望和想要的忠诚和荣誉。");
	//text = text.replace(/(.*?) nods\./, "$1 点头。");
	text = text.replace("I\'ll have to try the stick, I mean staff, with my rats.", "我得试试那根棍子，我说的是那根权杖，用来对付我的老鼠。");
	text = text.replace("And get a dog, too.", "再养条狗。");
	text = text.replace("The shepherd smiles.", "牧羊人笑了。");
	text = text.replace("Or a cat. What?", "或者一只猫。什么？");
	text = text.replace("I\'m joking, friend, just joking.", "我在开玩笑，朋友，只是开玩笑。");

//shooting_contest_event.nut
	text = text.replace("A hint of murmuring grows louder and louder until you can no longer focus.", "一阵低语声越来越嘈杂，直到你无法集中注意力。");
	text = text.replace(/You put your quill pen down with the sort of energy the ink bottle can take without breaking and step out of your tent\. (.*?) and (.*?) are standing there bickering over who is the better shot\./, "你放下你的羽毛笔，带着墨水瓶所能承受的不会被打破的能量走出你的帐篷。$1 和 $2 站在那里争吵谁射的更准。");
	text = text.replace("Seeing you, they waste little time asking if they can hold a shooting contest to decide who is right.", "他们就迫不及待地询问是否可以举办一场射击比赛来决定谁是正确的。");
	
	text = text.replace("You throw your hands up and tell the men to do what they must before retiring back to your tent.", "你举起双手，告诉他们在回帐篷之前必须做什么。");
	text = text.replace("Outside comes the twang of released arrows quickly followed by the thwap of them finding their targets.", "外面传来了射出的箭的嗖嗖声，随后击穿了他们发现的目标。");
	text = text.replace("Again and again. The din of men grows louder as what you can only assume what is a throng of observers grows.", "一次又一次。队员们的喧嚣声更大了，因此你只能设想这些旁观者能长点心。");
	text = text.replace("Finally, the contest is at some sort of end - indicated by a refreshing silence - and you get back to work.", "最后，比赛在某种程度上结束了－用一场令人振奋的沉默来表示－然后你回到了工作中。");
	
	text = text.replace("Feeling as though their arguments will never end, you give them the go-ahead to have their little competition before retiring back to your tent.", "感觉好像他们的争论永远不会结束，你给他们许可，让他们在回到你的帐篷之前来一场小竞赛。");
	text = text.replace("Soon thereafter you hear the arrows nocking, releasing, and finding targets.", "此后不久，你会听到箭的夜间拉弦，释放和寻找目标的声音。");
	text = text.replace("Things which go \'thwang\' soon go \'thwap\' and the air is slowly filled with the din of a watching crowd.", "那些“嗖”的东西很快“嗖”的一声消失了，空气中慢慢充满了围观人群的喧闹声。");
	text = text.replace("As you try to focus, you notice that the men have been shooting fervently for quite some time now.", "当你试着集中注意力时，你会注意到这些人已经狂热地射击了很长一段时间了。");
	text = text.replace("You step back out of your tent to find the two archers bickering some more, each one pointing a finger at the other before picking up an arrow and angrily launching it downrange.", "你从帐篷里退了出来，发现两名弓箭手又吵了起来，每个人都用手指着对方，然后拿起一支箭，愤怒地向下发射。");
	text = text.replace("Their targets aren\'t even targets anymore, but small bushes of arrow shafts upon which break every other shot that lands upon them.", "他们的目标甚至不再是目标了，而是一丛丛的箭头，从上面每射一箭都会被折断。");
	text = text.replace("Shaking your head, you order the two men to stop at once before they use up every last arrow the company has.", "你摇了摇头，命令这两个人立刻停下来，免得他们把战队的箭都用完了。");
	
	text = text.replace("You shake your head no for supplies are far too low to enage in such behavior.", "你摇头说不，因为补给太少了以至于不能支持这样的行为。");
	text = text.replace("The men sigh and walk away, continuing to argue with one another long and loud into the distance.", "这两个人叹着气走开了，继续在远处大声争吵。");

//shortsighted_shoots_bro_event.nut
	text = text.replace(/You take a good, long look at the men, a gaze that flickers from one to the other and then back again, all the while shaking your head\. (.*?) is holding his head, a rather large lump cresting at the hairline\./, "你仔细地长时间地看了这些人一眼，目光从一个人移到另一个人，然后又移回来，同时不停地摇头。$1 起头，发际处有一个很大的肿块。");
	text = text.replace(/He looks at (.*?) then to you\. Both men shrug\./, "他看着 $1，然后看向你。两人耸肩。");
	text = text.replace(/You ask (.*?) what happened\. He explains\./, "你问 $1 发生什么事。他解释说。");
	text = text.replace("Thought I saw somethin\' that wasn\'t there.", "我以为我看到了什么东西，它不在那里。");
	text = text.replace(/Incredulously, (.*?) throws his hand out\./, "令人难以置信的是，$1 竟然伸出手来。");
	text = text.replace("I said, \'Hey, it\'s me\' and you clocked me anyway.", "我说了，“嘿，是我”，你还是打了我。");
	text = text.replace(/Throwing out his own hands, (.*?) defends himself\./, "伸出自己的手，$1 保护自己。");
	text = text.replace("\'Hey it\'s me\' aren\'t words beholden to ya!", "嘿，这是我的声音，不是你的言语！");
	text = text.replace("Any man can say them words!", "任何人都能说出这些话！");
	text = text.replace("I reckon any man of ill-will would say them very words before he followed them with a sword, I bet he would!", "我想，凡是存心不良的人，在拿着剑跟在他们后面走之前，一定会把这些话都说出来的，我敢打赌，他一定会的！");
	text = text.replace(/It appears that (.*?)\'s poor eyesight has led to something of an accident\./, "看来是 $1的视力不良导致了某种事故。");

//sickness_event.nut
	text = text.replace("The swamp clutches at your every step, so wanting you to stay it is.", "沼泽紧紧拖住你的每一步，如此希望你停留在这。");
	text = text.replace(/While your boots sink into the mire, (.*?) turns and suddenly heaves, adding his breakfast to the bog\./, "当你的靴子陷入泥潭时，$1 转过身来，突然呕吐起来，把他的早餐吐进了泥潭。");
	text = text.replace("You turn to see another brother in the distance double over, loosing from his mouth a great spew that has you choking back some vomit yourself.", "你转过身去，看见远处的另一个兄弟弯着腰，从他嘴里吐出一大团东西，把你自己将要吐出来的东西给呛住了。");
	text = text.replace(/The (.*?) express their collective discomfort as more men wretch and gag\./, "$1 表达了他们的集体不适，因为更多的可怜虫在呕吐。");
	text = text.replace("This truly is no place for man to be.", "这确实不是人待的地方。");
	text = text.replace("While teeming with disgusting forms of life, the swamp actually smells of noxious death.", "虽然沼泽里充满了令人恶心的生命形式，但实际上却散发着有毒死亡的气味。");
	text = text.replace("Seemingly toxic steam undulates off the bog\'s still currents.", "似乎有毒的蒸汽从静止的水流中翻腾而出。");
	text = text.replace("It burns your eyes and throat and poisons all your foods with ill-tastes.", "它会灼伤你的眼睛和喉咙，使你的食物染毒变得很难吃。");
	text = text.replace("What foul things would dare live here?", "有什么肮脏的东西敢住在这里？");
	text = text.replace("You see toads and snakes and critters that certainly had the devil\'s touch in their birthing.", "你看到蟾蜍，蛇和小动物，它们在出生的时候显然被魔鬼碰过。");
	text = text.replace(/The (.*?) are uniformly falling sick in this damned place\./, "$1 的队员无一例外的病了。");
	text = text.replace("Only the strong may have the gut to bear it, everyone else is already heaving and seeing things which are not there.", "只有强者才有勇气去忍受这些，其他人都已经恶心过了，并看见了那里不存在的东西。");
	
	text = text.replace("Your breath appears before you as though it were carried in purses of grey.", "你的呼吸出现在你的面前，仿佛它是装在灰色的皮包里。");
	text = text.replace("It started slowly, this pain. Spits of snow.", "它开始变慢，这种痛苦。雪片飞舞。");
	text = text.replace("Winds that had come from ancient glaciers.", "来自古代冰川的风。");
	text = text.replace("One step sank your foot deep into the white powder and it was then you knew the rest of the journey would be a test of endurance.", "你的脚陷进了白色的粉末里，然后你就知道接下来的旅程将是对耐力的考验。");
	text = text.replace("You wonder how the men of old did it, living in these parts.", "你想知道生活在这些地方的古代人是怎么做到的。");
	text = text.replace("They sat around campfires with all the world out to get them.", "他们围坐在营火旁，全世界的人都出来找他们。");
	text = text.replace("Sat in the darkness surrounded by flurries of ice. Sat in isolation", "坐在黑暗中被冰霜包围着。孤单的坐着。");
	text = text.replace("They were born here, that must have been their trick.", "他们出生在这里，这一定是他们的诡计。");
	text = text.replace("Ignorance was their warmth.", "无知是他们的温暖。");
	text = text.replace("Only a man who knows no better could live in a place such as this.", "只有无家可归的人才能住在这样的地方。");
	text = text.replace(/The men of the (.*?) stagger and fall and don\'t get back up with quite the speed they used to\./, "$1 的人踉踉跄跄地跌倒了，再也不能像以前那样迅速爬起来。");
	text = text.replace("A few have taken to coughing fits and others look about ready to succumb to exhaustion.", "一些人开始咳嗽，还有一些人看起来已经要筋疲力尽了。");
	text = text.replace("Only the strongest of the bunch carry on with no problem.", "只有最强壮的人才能毫无困难地坚持下去。");
	text = text.replace("It is those men who surely share a link with the ancestors of this horrid land.", "这些人肯定与这片可怕土地的祖先有关系。");

//spartan_should_eat_more_event.nut
	text = text.replace(/(.*?) has always been a bit tight with how much he eats\./, "$1 对自己的食量总是有点苛刻。");
	text = text.replace("You\'re not sure if it\'s part of some religious rite, a sense of duty, or he\'s just not a big eater.", "你不确定这是某种宗教仪式的一部分，是一种责任感，还是他只是吃得不多。");
	text = text.replace("Regardless, the lack of food has weakened the man and you find him barely able to sit upright on a log.", "无论如何，食物的缺乏已经削弱了这个人，你发现他几乎不能在一根圆木上坐直。");
	text = text.replace("You\'ve got a bowl of meat and corn in hand, wondering if maybe you should offer it to him.", "你手里拿着一碗肉和玉米，不知道该不该把它给他。");
	
	text = text.replace("You decide that the man has probably been through this before and decide to leave him be.", "你认为这个人以前可能经历过这种情况，决定离开他。");
	text = text.replace("A few moments later, you catch him walking and talking just fine.", "几分钟后，你发现他走路和说话都很正常。");
	text = text.replace("In fact, he gets around pretty well for a man who eats so lightly!", "事实上，对于一个吃得那么少的人来说，他是可以应付自如的！");
	
	text = text.replace("The man\'s done this before, he can do it again.", "这个人以前做过这件事，他可以再做一次。");
	text = text.replace("You turn around to go eat your meal elsewhere, only to hear the man crumple to the ground.", "你转身去别处吃饭，却听到那人倒在地上。");
	text = text.replace("He\'s completely passed out and appears to have hit his head on the way down.", "他完全昏过去了，似乎在下山的路上撞到了头。");
	
	text = text.replace("You order the man to eat.", "你命令他吃饭。");
	text = text.replace("He resists, but you remind him that it is an \'order\', not a request.", "他拒绝，但你提醒他这是“命令”，而不是请求。");
	text = text.replace("The sellsword does as told, eating rather gingerly from your bowl.", "这个佣兵照着吩咐去做，从你的碗里小心翼翼地吃着。");
	text = text.replace("He complains that he does not wish to eat anymore, but you order him to finish the meal.", "他抱怨说他不想再吃了，但你命令他把饭吃完。");
	text = text.replace("In time, whatever ailed him seems lifted.", "随着时间的推移，他身上的一切似乎都解除了。");
	text = text.replace("Energy returns to his eyes and he gets up with a good spring in his step.", "他的眼睛恢复了活力，他站起身来，脚步轻盈。");
	text = text.replace("Unfortunately, he does not care for being told to break his personal codes.", "不幸的是，他不在意别人叫他打破自己的个人准则了。");
	
	text = text.replace("Ordering the man to eat, the man does as told.", "命令他吃饭，他照做了。");
	text = text.replace("At first, he seems rather reluctant, but after a few bites he dives into the bowl, engorging himself in juices and flecks of corn dot his cheeks.", "一开始，他似乎很不情愿，但咬了几口后，他跳进碗里，把自己灌满了果汁，脸颊上布满了玉米粒。");
	text = text.replace("He is almost mad with delight.", "他高兴得几乎要发疯了。");
	text = text.replace("You\'ve reminded him of just how good food can be.", "你提醒他食物是多么好吃。");
	text = text.replace("Personally, you thought the meat was a little overcooked.", "就你个人而言，你认为这肉煮得有点过头了。");

//squire_vs_hedge_knight_event.nut
	text = text.replace(/(.*?) the young squire is eyeing (.*?) from a safe distance\./, "$1 这个年轻的扈从正从一个安全的距离注视着 $2。");
	text = text.replace("The hedge knight is sharpening his blades, running a whetstone over the edges and stropping the metals to give \'em a good sheen.", "雇佣骑士正在磨他的利刃，用磨刀石在利刃上磨来磨去，把金属磨得闪闪发光。");
	text = text.replace(/Catching the squire staring, (.*?) lowers his equipment\./, "发现扈从正盯着他，$1 放下他的装备。");
	text = text.replace("So you want to be a knight, is that it?", "你想成为一名骑士，是吗？");
	text = text.replace(/(.*?) nods and answers proudly\./, "$1 点头骄傲地回答。");
	text = text.replace("It is my dream, yes, and one day it will happen.", "这是我的梦想，是的，总有一天会实现的。");
	text = text.replace("The hedge knight stands and walks over, coming to tower over the youth.", "雇佣骑士站起来走了过去，来到这个年轻人身旁。");
	text = text.replace("What is it you think a knight does? Saves damsels?", "你认为骑士会做什么？拯救美女？");
	text = text.replace("Rules fiefs to be loved by the peasants?", "统治封地以获得农民的爱戴？");
	text = text.replace("Owes allegiance to his lord?", "效忠于他的领主？");
	text = text.replace("Well let me tell you, that\'s all bullshit.", "让我告诉你，那全是胡扯。");
	text = text.replace("Dainty farks like yourself are nothing but mealworm.", "像你这样高雅的扯淡狗屁不如，就是个米虫。");
	text = text.replace("You want to be a knight you gotta learn to kill.", "你想成为骑士，就得学会杀戮。");
	text = text.replace("The squire straightens up and pulls his shoulders back.", "扈从直起身子，把肩膀往后拉。");
	text = text.replace("I\'ve no issue killing.", "杀人我没有问题。");
	text = text.replace("The hedge knight pushes the man back with only a single finger.", "雇佣骑士只用一根手指把那个人往后推了推。");
	text = text.replace("Is that so? And have you gutted a man and murdered his family while he bled out on the ground?", "是这样吗？你有没有在一个人倒在地上流血的时候把他的家人都杀了？");
	text = text.replace("What of crushing a child\'s head in your hands because your liege gave the order?", "因为你的主子下了命令，你就用手砸碎一个孩子的脑袋，这有什么关系呢？");
	text = text.replace("Would you gouge out a woman\'s eyes because your lord believed that was due punishment for stealing a loaf of bread?", "你会因为你的主人认为偷了一条面包而把女人的眼睛挖出来吗？");
	text = text.replace("Who do you think I am, squire?", "你以为我是谁，扈从？");
	text = text.replace("Do you think I was born big, mean, and savage?", "你以为我生来就高大，吝啬，野蛮吗？");
	text = text.replace("No, little squire, you will have to kill, and who you kill first is none other than yourself.", "不，小扈从，你必须杀戮，而且你先杀的不是别人，正是你自己。");
	text = text.replace("That is how you become a knight in these lands, in these times.", "这就是你如何才能成为这些地方的骑士，在这个时代。");
	text = text.replace("The hedge knight returns to his work.", "雇佣骑士返回工作岗位。");
	text = text.replace("The squire is visibly shaken, but seems to be earnestly thinking over what he\'d just heard.", "扈从显然很震惊，但似乎在认真地思考他刚才听到的话。");

//strength_contest_event.nut
	text = text.replace(/(.*?) and (.*?) - the strongest men in the outfit by some measure - are apparently undertaking something of a competition to see who is the better\./, "$1 and $2－从某种程度上说是整个队伍中最强壮的人－他们显然是在进行一场竞赛，看谁更强壮。");
	text = text.replace("You watch as they carry enormous stones from one side of an ad hoc competitive ground to the other.", "你看着他们把巨大的石头从临时竞争场地的一边搬到另一边。");
	text = text.replace("Then they take turns seeing how far they can throw these very stones.", "然后他们轮流着看能把这些石头扔多远。");
	text = text.replace("And then they roll the stones up a nearby hill.", "然后他们把石头滚到附近的山上。");
	text = text.replace("And then they see who can completely bury a stone the fastest.", "然后他们看谁能更快的完全掩埋一块石头。");
	text = text.replace("All in all, there are a lot of heavy stones being jostled about and by the end of the festive affair both men are completely exhausted.", "总之，有很多沉重的石头被挤来挤去，直到这个节日般的活动结束时，两人都筋疲力尽了。");
	text = text.replace("Even without a winner, the time-honored tradition of moving rocks around to no real end has improved the men\'s morale.", "即使没有胜利者，搬石头这个历史悠久的传统也提升了队员们的士气。");

//supposed_witch_event.nut
	text = text.replace("You cross into a small hamlet beside the path.", "你穿过小路来到一个小村庄。");
	text = text.replace("It\'s a rather nondescript place save for the woman tied atop a soon-to-be bonfire.", "这是一个相当普通的地方，除了一个女人被绑在即将点燃的篝火处。");
	text = text.replace("She\'s surrounded by a band of peasants as is usual for a woman in this position.", "她被一群农民包围着，这是处于这种地位的女人通常的状况。");
	text = text.replace("A monk from the mob reads from a holy tome, apparently letting everyone know the deontological nature of her crimes.", "一个来自乌合之众的修道士诵读了一本圣经，显然是想更有道义性地让每个人都知道她的罪行。");
	text = text.replace("Another man dutifully stands by with a torch, his hands itchy to put it to use.", "另一名男子拿着火把筒尽职地站在旁边，他已经巴不得要动手了。");
	text = text.replace("Seeing you, the woman shouts for help.", "看到你，那个女人大喊救命。");
	text = text.replace("They\'re going to burn me!", "他们要把我烧了！");
	text = text.replace("You must do something!", "你必须做点什么！");
	text = text.replace("I\'ve done no wrong here!", "我在这里没有做错任何事！");
	
	text = text.replace("You will not stand idly by while an innocent woman is burned for some imaginary crime.", "当一个无辜的女人因为虚构的罪行而被烧死时，你不会袖手旁观的。");
	text = text.replace("Blade in hand, you climb the wooden pallets and cut her free.", "手里拿着利刃，你爬上柴火堆，割断绳子救了她。");
	text = text.replace("She quickly scurries away, seeking her own safety.", "她急忙跑开，寻找安全的地点。");
	text = text.replace("The crowd, enraged, sets upon the company in an instant.", "人群被激怒了，立刻向战队进攻。");
	text = text.replace("A scuffle between peasants and sellswords ends poorly for the former, but they do put in some damage.", "农民和佣兵之间的混战对前者来说结局并不好，但却造成了一定的伤害。");
	text = text.replace("For losing control of the crowd, you have the monk beaten up, and the man carrying the torch, too.", "因为失去了对人群的控制，你打了那个僧侣，还有那个拿火把的人。");
	text = text.replace("A few of the brothers believe this was the right thing to do and are pleased with your decision.", "有几个兄弟认为这么做是对的，他们很满意你的决定。");
	
	text = text.replace("You will not stand idly by while an innocent woman is burned for some imaginary crime.", "当一个无辜的女人因为虚构的罪行而被烧死时，你不会袖手旁观的。");
	text = text.replace("Blade in hand, you climb the wooden pallets and cut her free.", "手里拿着利刃，你爬上柴火堆，割断绳子救了她。");
	text = text.replace("When she\'s free, she leans down and takes you in her hands.", "当她获救的时候，她俯下身来用手拥抱你。");
	text = text.replace("Her skin is smooth and unmarked.", "她的皮肤光滑而无雀斑。");
	//text = text.replace("Thank you, sellsword.", "谢谢你，佣兵。");
	text = text.replace("She plants a kiss and it feels as though her lips are ice.", "她吻了你一下，感觉嘴唇像冰一样。");
	text = text.replace("You watch as she floats down the wooden pallets. Uh oh.", "你看着她从柴火堆上飘下去。呃哦。");
	text = text.replace("The town monk retreats, trying to hide himself in the crowd, but the witch screams and splits the mob, leaving only the friar by himself on the ground.", "村里的僧侣往后退，试图躲在人群中，但女巫尖叫起来，把人群分开，只留下僧侣一个人在地上。");
	text = text.replace("He slowly slides across the dirt before rising to his feet as though pushed by an invisible force.", "他慢慢地滑过泥土，然后站起来，就像被一种看不见的力量推着。");
	text = text.replace("He tries to retreat again, but there\'s no going anywhere.", "他试图再次后退，但是徒劳的。");
	text = text.replace("She kisses him as she did you, but the man\'s eyes roll back in his head and you see his veins engorge, purpling violently, his whole body issuing blood out of every pore as he shakes.", "她吻了他，就像吻你一样，但男人的眼睛在他的脑袋里翻滚，你看到他的血管充血，猛烈地泛着紫色，当他颤抖的时候，他全身的每一个毛孔都流出血来。");
	text = text.replace("He screams, but it\'s lost in the mouth of the witch who eats it with a moan.", "他尖叫着，但这声音马上消失了，女巫呻吟着把用嘴在吃他。");
	text = text.replace("When she lets go, he drops to the ground a sopping red corpse.", "当她松开手时，他倒在地上，变成一具湿透的红色尸体。");
	text = text.replace("The villagers scatter while your men try and fight this evil.", "村民们四散而去，而你的人则试图与邪恶作斗争。");
	text = text.replace("She laughs and shrinks into the center of her clothes, her cloak rolling itself in a bundle out of which shoots a cackling specter.", "她大笑着缩进衣服中央，斗篷裹成一团，从中射出一个咯咯叫的幽灵。");
	text = text.replace("It\'s soars to the nearest tree line hopefully to never be seen again.", "它飞到最近的树林边，很可能永远不会再被看到了。");
	
	text = text.replace(/(.*?) steps forward with a skeptical eye\./, "$1 带着怀疑的眼光向前走。");
	text = text.replace("He looks at the woman who strains to say \'please.\'", "他看着那个拼命说“请”的女人。");
	text = text.replace("The witch hunter stares her up and down, then he turns and drives a blade through the man holding the torch.", "女巫猎人上下打量着她，然后转过身，用一把利刃刺穿了那个拿着火把的人。");
	text = text.replace("He gargles with it in his throat and his hands work to try and pry it out.", "他把刀刺进那个人喉咙里，双手使劲想把刀拔出来。");
	text = text.replace("Stop with the farce, you will not fool me.", "不要再胡闹了，你骗不了我的。");
	text = text.replace("The witch hunter says.", "女巫猎人说道。");
	text = text.replace("He yanks out the blade and the torch-wielder stands there for a moment, but his wide eyes slowly settle down and the \'blood\' stops in an instant.", "他猛地拔出了刀，手持火把的人在那里站了一会儿，但他睁大的眼睛慢慢地平静下来，“血”在一瞬间停止了。");
	text = text.replace("His face widens, skin stretching taut like the melted visage of a puppeteer\'s most gruesome doll.", "他的脸变宽了，皮肤绷得紧紧的，就像一个木偶师把最可怕的玩偶融化了的脸。");
	text = text.replace("Its voice is shrieking, every syllable the pitch of a dying cat.", "它的声音在尖叫，每一个音节都是垂死的猫的音调。");
	text = text.replace("I am NOT the last!", "我不是最后一个！");
	text = text.replace("You\'ll NEVER be rid of us all!", "你们永远都摆脱不了我们！");
	text = text.replace(/And with that, (.*?) drives his weapon into the evil spirit\'s skull\./, "与此同时，$1 将他的武器插入恶魔的头骨。");
	text = text.replace("The skin hardens like a desert earth before chipping away.", "在剥落之前，皮肤会像沙漠里的泥土一样变硬。");
	text = text.replace("With the truth out there, the woman is cut down and freed.", "那个女人被减免罪行并被释放了。");
	text = text.replace("The monk is defrocked by an angry mob with nowhere else to turn their energy.", "这名僧侣被愤怒的暴民剥去法衣，因为他们无处可去。");
	text = text.replace("Naked and humiliated, he is driven from the hamlet for his wrongful accusations.", "他赤身裸体，受尽屈辱，因为他的错误指控而被赶出了村子。");
	
	text = text.replace(/The monk, (.*?), sits with the town\'s own friar and talks for a time\./, "这个僧侣，$1，和城镇的僧侣坐在一起谈了一会儿。");
	text = text.replace("When they are done, a nod is given to the torchman who sets the wooden pallets aflame.", "当他们完成时，向拿着火把负责点燃柴火堆的人点头。");
	text = text.replace("The woman screams for mercy, but the flames have none for her, slowly working up feet first.", "女人尖叫着求饶，但火焰没有给她机柜，慢慢地，她的脚先动了起来。");
	text = text.replace("It is a horrific sight and only when the smoke is a choking cloud does the dying woman go silent.", "这是一个可怕的场景，只有当烟雾变成令人窒息的云时，垂死的女人才会沉默。");
	text = text.replace(/The fire consumes her entirely as the rest of the town claps and cheers\. (.*?) states that she was clearly a witch and had to be done away with\./, "当镇上的其他人都在欢呼雀跃时，大火把她烧得精光。$1 说她显然是个女巫，必须除掉。");
	text = text.replace("You\'re not sure. All you saw was a woman burned alive, but you trust that he knows more than you about the war between the old gods and the evils of sorcery.", "你不确定。你所看到的只是一个被活活烧死的女人，但你相信他比你更了解古老的神明与巫术邪恶之间的战争。");
	
	text = text.replace(/(.*?) steps forward and looks the villagers up and down\./, "$1 走上前去，上下打量着村民。");
	//text = text.replace("He shakes his head.", "他摇了摇头。");
	text = text.replace("You all should kill yourselves.", "你们都该自杀。");
	text = text.replace("The town monk rustles up his cloak.", "村里的僧侣把斗篷晃的沙沙作响。");
	text = text.replace("E-excuse me?", "你说啥？");
	text = text.replace("The cultist starts to cut the woman down.", "异教徒开始释放女人。");
	text = text.replace("A few of your mercenaries step forward to stop anyone from protesting.", "你的一些雇佣兵站出来阻止任何人的抗议。");
	text = text.replace(/When she\'s free and sent running for her own safety, (.*?) speaks again\./, "当她自由后，被允许逃往安全的地方，$1 又说了一遍。");
	text = text.replace("Kill yourselves. Each of you. Tonight.", "自尽吧。你们每个人。今晚。");
	text = text.replace("You\'ve angered Davkul and his rage is a debt you\'d do best to pay yourself.", "你们激怒了达库尔，他的愤怒是你们最好的债务。");
	text = text.replace("The monk opens his mouth to say something, but his nose cracks as though indented by an invisible stone.", "僧侣张开嘴想说点什么，但他的鼻子裂开了，就像被一块看不见的石头压出的凹痕。");
	text = text.replace(/He lurches, blood spewing from his nostrils\. (.*?) nods\./, "他踉踉跄跄，鼻孔里血流不止。$1 点头。");
	text = text.replace("Hmm, he is angrier than I had thought.", "哼，他比我想象的更生气。");
	text = text.replace("Davkul awaits us all, but he is now on your doorstep.", "达库尔即将降临到我们，但他现在就在你们的门前。");
	text = text.replace("Screaming, the monk falls to the ground as his jaw sickeningly cracks open, his mouth left permanently ajar.", "僧侣尖叫着倒在了地上，下巴裂成两半，嘴巴永远半掩着。");
	text = text.replace("The villagers scream and disperse like rabbits beneath the shadow of a hawk.", "村民们尖叫着四散而逃就像兔子看到了鹰的影子。");

//surefooted_saves_damsel_event.nut
	text = text.replace("A few brothers come back to you with the most curious of stories.", "几个兄弟带着最奇怪的故事回到你身边。");
	text = text.replace(/Apparently (.*?), the ever surefooted sellsword, managed to make a bit of a name for himself in (.*?)\./, "显然，$1 这位步伐沉稳的佣兵出名了，在 $2。");
	text = text.replace("While carousing with ladies on a tavern staircase, the bannister broke and a damsel went careening downward.", "在一个小酒店的楼梯上与女士们谈笑时，栏杆断了，一位姑娘几乎要摔下去了。");
	text = text.replace("With a horn of ale in one hand and a wench wrapped in the tender grip of the other, the mercenary stuck his foot out and managed to catch the falling mistress on the toe of his boot, quite literally bringing her to heel much to the roaring applause of the inebriated crowd below.", "一手拿着一壶酒，一手裹着姑娘的腰，这个雇佣兵用脚卡住这个正在摔倒的姑娘的靴子尖，毫不夸张说他赢得了醉酒人群的热烈掌声。");
	text = text.replace("You ask where he is now. The mercenaries laugh.", "你问他现在在哪里。雇佣兵们大笑。");
	text = text.replace("Dropping trou with the easily impressed, what else?", "掉进了被称赞的烦恼中，别提了？");

//swordmaster_teaches_event.nut
	text = text.replace("An old man\'s voice is heard quietly issuing orders.", "一位老人的声音静静地发布命令。");
	text = text.replace("The foot leads, the body follows. Again.", "脚步为先，身体跟上。再说一遍。");
	text = text.replace(/You find (.*?) the swordmaster and (.*?) practicing in a field\./, "你发现 $1 这个剑术大师和 $2 正在旷野中练习。");
	text = text.replace("The elder shakes his head at the most recent display of swordsmanship.", "这个长者正在为最近看到的剑法摇头。");
	text = text.replace("The foot leads, the body follows. Again!", "脚步为先，身体跟上。再说一遍！");
	text = text.replace("The student practices what he is taught.", "这个学生正在练习他所学的东西。");
	text = text.replace("Nodding, the swordmaster barks another order.", "剑术大师点了点头，又吼着下命令。");
	text = text.replace("Now do it in reverse.", "现在，反过来做。");
	text = text.replace("The foot retreats, the body follows.", "脚步后退，身体跟上。");
	text = text.replace("Do not retreat with your mind.", "不要总想着后退。");
	text = text.replace("Let your feet do the thinking for you.", "让你的脚步跟上你的想法。");
	text = text.replace("Instinct is survival! Thinking is death!", "果敢才能生存！犹豫就会败北！");
	text = text.replace("Move as though the world demanded it.", "像适者生存要求的那样行动。");
	text = text.replace("If a wind blows are you faster than the leaves which hear its call?", "如果一阵风吹向你，是不是要快过你听到树叶的声音？");
	text = text.replace("I see. Good... you are learning. Now... again.", "我看到了。很好…你正在学。现在…再来一次。");

//tailor_werewolf_hide_armor_event.nut
	text = text.replace(/While stressing over where to go and when, (.*?) the tailor walks into your tent, something dark and heavy wrapped over both his outstretched arms\./, "当正在努力思考什么时候该去什么地方的时候，$1 裁缝走进了你的帐篷，某种又黑又重的东西包裹着他的两边张开的肩膀。");
	text = text.replace("You take a step back, seeing what look like claws or some such manifestation glinting in the candlelight.", "你后退了一步，看到了像爪子一样的东西，或是某种怪力乱神在烛光中显现了出来。");
	text = text.replace("The tailor explains that he\'s made a suit of armor stitched together by the hide of direwolves.", "裁缝解释说他做了一套用冰原狼皮缝合起来的盔甲。");
	text = text.replace("He sets the armor down on the table where a few left-over claws rap against the wood with deadly weight.", "他把盔甲放在了桌子上，那里，剩余的爪子以致命的重量叩击着木头。");
	text = text.replace("He unfolds the armor and shows it in whole, a ghastly thing of black and sharpened bones, a creature shorn of its insides, left to be occupied by man or some other creature seeking warmth in its emptied hide, the head of the beast tilted up to look at its soon to be wearer.", "他摊开了盔甲，并且完整地展示它，有一个令人毛骨悚然的黑色玩意儿，一些锋利的骨头，这是一个被脱去内脏的生物，剩下的足够让一个人披上它，或者可以让其他的一些生物暖和地躲在那张空的毛皮里，野兽的头倒置了过来，看着马上就要穿它的人。");
	text = text.replace("Altogether fearsome, no doubt, and has you pondering when and where the tailor got such an idea in the first place.", "这些全都相当可怖，毫无疑问，现在你开始考虑何时何地裁缝最初想到了这样一个主意。");

//the_horseman_event.nut
	text = text.replace("While on the path, you come to a man being dangled upside down from a tree branch.", "当在路上的时候，你看到了一个男人被吊在树干上，上上下下摇晃着。");
	text = text.replace("A bunch of men are sitting around him sharing a goatskin flask, looking like they\'re at the end of a day\'s hard work.", "一堆人坐在他周围分享着一个羊皮袋子里的饮品，看起来像是他们完成了一天的辛苦工作。");
	text = text.replace("When you ask what is going on, one of them looks up and smiles.", "当你问发生了什么时，他们中的一个抬起头来看了看然后笑了。");
	text = text.replace("Whipping this fella \'til he\'s raw.", "用鞭子抽这家伙直到他皮开肉绽。");
	text = text.replace("You ask what for. Another man answers.", "你问为什么。另外一个人回答了。");
	text = text.replace("Fornicating with this fella\'s wife.", "他和这位伙计的老婆通奸了。");
	text = text.replace("A man drinking spurts and chokes on his drink.", "一个男人瞬间喷出了他喝的东西，然后被呛住了。");
	text = text.replace("He wipes his mouth.", "他擦了擦嘴。");
	text = text.replace("Hardy-farkin\'-har, very funny.", "沃日，真好笑。");
	text = text.replace("No, this scumbag was caught farkin my dead horse.", "不，这个小人在操我的死马的时候被抓住了。");
	
	text = text.replace("You walk over to the dangling man.", "你走近了那个吊着的男人。");
	text = text.replace("There\'s blood running down his back, streaking from a dozen slashes.", "鲜血从他的背上流下来，上面有十几道伤口。");
	text = text.replace("He\'s got a cloth covering his eyes which you pull down.", "你把蒙着他眼睛的那块布拽了下来。");
	text = text.replace("Blinking, he asks what it is you want as though you\'re interrupting his own hiding.", "眨巴着眼睛，他问你想要什么，就好像你打断了他的自我体罚一样。");
	text = text.replace("You ask him if what they say is true.", "你问了他那些人说的是不是真的。");
	text = text.replace("He spits and clears his throat.", "他啐了口唾沫，清了清嗓子。");
	text = text.replace("I mean, yeah, but the horse was dead, so of what matter was it?", "我说，是的，但是马已经是死了，所以又有什么关系呢？");
	text = text.replace("Can\'t a man have his fun?", "一个男人就不能有点自己的乐子吗？");
	text = text.replace("The horse owner gets up, brandishing a dripping whip.", "马的主人站了起来，威胁似得挥舞着一条湿漉漉的鞭子。");
	text = text.replace("Oy, you want us to go back at it?", "唔，你想让我们再来一次吗？");
	text = text.replace("We got all day!", "我们都这样耗了一整天了！");
	text = text.replace("Sighing, the dangling man asks you a question.", "叹了口气，那个被吊着的男人问了你一个问题。");
	text = text.replace("Yer a sellsword, right?", "你是个佣兵，对吧？");
	text = text.replace("Why don\'t I come and fight for ya?", "我来你的团队为你而战，如何呀？");
	text = text.replace("I\'m a strong and able bodied man, a little horse, I mean worse, for the wear, but that aside, and the, uh, dead animal thing, I\'m a man of upstanding and moral sensibilities.", "我四肢健全又身强体壮，关于这匹小马，我是说更糟的那件事，只不过是表面现象，但是撇开这一点，还有，呃，还有那些死掉的动物，我是一个正直的并且有道德感的人。");
	
	text = text.replace("You take out your blade and cut the man down.", "你拔出了你的利刃，砍断了吊着那个男人的绳子。");
	text = text.replace("He crumples onto his shoulders and splays out, his lashed back in the dirt.", "他把他蜷缩的肩膀张开，他受过鞭打的背部倒在了土地上。");
	text = text.replace("The soil may as well have been salt judging by his wailing.", "他号啕大哭了起来，土地可能都因此而变咸了。");
	text = text.replace("One of the whippers stands up.", "其中的一个鞭打者站了起来。");
	text = text.replace("Hey, just what do you think you\'re doing?", "嘿，你觉得你在干什么？");
	text = text.replace("We ain\'t finished here!", "我们的事还没完呢！");
	text = text.replace(/(.*?) draws his weapon and the man backs off\./, "$1 拔出了他的武器，那个鞭打者便退后了。");
	text = text.replace("The horse owner spits and shakes his head.", "马的主人啐了口唾沫，摇了摇他的头。");
	text = text.replace("Are you really going to defend this piece of work?", "你真的要保护这货吗？");
	text = text.replace("Ain\'t that some fucking horseshit.", "他就是狗屎。");
	text = text.replace("I guess now I can say I\'ve seen it all which is exactly what I said when I caught this bastard porkin\' my dead horse!", "我猜现在我能说我确确实实看到了我之前说的整个过程，当我抓到这个混蛋在日我的死马的时候！");
	text = text.replace("The man catches his breath then points at the recently rescued.", "男人深吸了一口气，然后指着刚刚获救的家伙。");
	text = text.replace("I hope you die on your first day out ya filly fiddling bastard.", "我希望你第一天就死在外面你这个日马的混蛋。");
	
	text = text.replace("You take out your blade and cut the man down.", "你拔出了你的利刃，砍断了吊着那个男人的绳子。");
	text = text.replace("He falls right on his head and his neck breaks with a disgusting crack.", "他的头直落到地上，脖子伴随着一阵令人胆寒的咔咔声断掉了。");
	text = text.replace("The rest of his body crumples with his legs awkwardly heaved over his own chest, a position no doubt strange to this sexual deviant.", "他身体的剩下部分随着双腿笨拙地越过了他自己的胸口上方而摊平在地，这个姿势很明显对这个有怪异性癖的人来说不正常。");
	text = text.replace("The horse owner springs to his feet.", "马主人突然挪了挪他的脚。");
	text = text.replace("Well shit, sir, we was just gonna whip him good.", "我靠，先生，我们只是想好好的鞭打一下他。");
	text = text.replace("Why\'d you go and kill him for?", "你为啥要把他杀了呢？");
	text = text.replace("He pauses then waves a dismissive hand.", "他闭上了嘴，然后轻蔑地摆了摆手。");
	text = text.replace("Shit. Shit, man. Well, alright.", "该死。该死，老兄。好吧，好的。");
	text = text.replace("We\'ll just all depart in our own way and say nothing of what happened here.", "我们接下来会各走各的路，并且对于这里发生的事一个字也不会说。");
	text = text.replace("Ain\'t that right fellas?", "这样你们觉得可以吗，伙计们？");
	text = text.replace("The rest of the men nod.", "其余的人点头。");
	text = text.replace("\'Course. I ain\'t ruining my life over some filly fiddler.", "快跑吧。我才不要让我的生活因为什么日马者而被毁。");
	text = text.replace("Good going, sellsword, stupid sword swingin\' sumbitch.", "好样的，佣兵，愚蠢的剑杀了一个臭婊子的。");
	
	text = text.replace(/(.*?) steps forward and takes the horse owner\'s whip\./, "$1 上前了一步，夺走了马主人的鞭子。");
	text = text.replace("He bends it and runs the leather through his hands.", "他把它卷了起来起来，用手握在这个皮圈上。");
	text = text.replace("Nodding, he calls it a \'fine tool\' for a good whipping, but that the men were going about it \'all the wrong way.\'", "点着头，他说这是一个“不错的工具”，可以用来鞭打，但是这些人用的方法“全都是错的。”");
	text = text.replace("He points at the wounds on the man\'s back.", "他指了指那人背后的伤口。");
	text = text.replace("See these streaks? They\'re thin and barely opened.", "看到这些伤口了吗？它们又薄开口又小。");
	text = text.replace("Don\'t let the amount of blood fool you, these are superficial.", "不要让出血量骗了你，这些都是表皮伤。");
	text = text.replace("Here, let me show you a good hiding.", "来，让我给你表演一下什么叫痛打。");
	text = text.replace("The flagellant drop the whip\'s strings, twirls them around for a moment, then strikes.", "苦修者放下了鞭子的细端，转了一会儿，然后击打。");
	text = text.replace("The hanging man cries out.", "吊着的男人大叫了起来。");
	text = text.replace("A wound opens and gapes from the tip of one rib clear across his back to the tip of another.", "一个伤口出现了，它从一根肋骨的尖端裂开，横贯他的后背连到了另一根肋骨的尖端。");
	text = text.replace(/You can see the muscle and fat bubbling beneath. (.*?) strikes again, and again, and again\./, "你可以看到皮肤下面满满的肌肉和脂肪。$1 再一次击打，再一次，再一次。");
	text = text.replace("Blood splashes the flagellant as he works and the horse-porker has long since passed out.", "在鞭打的同时，血溅到苦修者身上，日马者已经昏厥了很久了。");
	text = text.replace("Eventually, one of the men gets to his feet and takes the whip back.", "终于，一个人站了起来，夺回了鞭子。");
	text = text.replace("Th-that\'s enough. You fellas get on and go, alright? Farkin\' hell...", "那，那已经够了。你们上路走吧，行吗？我的老天爷啊…");
	text = text.replace(/Another man cuts the filly fiddler down and tends to his new, quite serious wounds\. (.*?) wipes his brow and admires his handiwork\./, "另外一个人把日马人放了下来，然后仔细观察着那些新的，触目惊心的伤口。$1 擦了擦他的额头，同时欣赏了一下他的作品。");
	text = text.replace("Mmhmm, that\'s how it\'s done.", "嗯哼，事情就该这么办。");
	
	text = text.replace(/(.*?) asks if the horse is still around\. Its owner nods\./, "$1 问马是否还在附近。主人点了点头。");
	text = text.replace("Aye, freshly dead, freshly soiled by that prick. Why?", "啊，新鲜的尸体，刚刚被刺的方式弄脏了。为什么？");
	text = text.replace("The butcher asks if he can take it off his hands. The owner shrugs.", "屠夫问他能不能接手那匹死马。主人耸耸肩。");
	text = text.replace("Yours if you want it.", "如果你想要的话，它就是你的了。");
	text = text.replace("Though you\'d best be careful cutting around the bits he touched with his own bits.", "虽然你在切被他碰过的那一部分附近时最好小心一点。");
	text = text.replace(/Before anymore can be said, (.*?) has the man take him to the horse corpse to, well, butcher it\./, "在说其他什么之前，$1 让人把他带到了马的尸体旁，以便于，嗯，肢解它。");
	text = text.replace("The company gets some questionable meat to eat.", "战队拿到了一些有问题的肉可以吃。");

//thief_caught_event.nut
	text = text.replace("During a short rest, your men managed to catch a man that tried to make off with some of your supplies.", "在一次短暂的休息时，你的人设法抓到了一个尝试偷取你们补给的人。");
	text = text.replace("His clothes are but rags and he looks more skeleton than man.", "他衣衫褴褛，比起人瘦得更像个骷髅。");
	text = text.replace("What are you going to do with him?", "你要怎么处理他？");
	
	text = text.replace("Under the cloak of night some thief managed to nick some of your supplies.", "在夜幕的掩护下，一些小偷设法偷走了你的一些补给。");
	text = text.replace("He will probably offer them back to you in the next settlement...", "他也许会在下次扎营的时候把它们还给你…");
	
	text = text.replace(/(.*?) gives the thief a proper beating with a short cane\./, "$1 用一根木棍给了这个贼一顿名副其实的痛打。");
	text = text.replace("The shaft lands viciously hard and you can hear the sound of the blows passing through the man\'s almost hollow frame.", "棍子不怀好意地重重落下，你可以听到武器猛击的声音穿过了他那几乎中空的骨架。");
	text = text.replace("He wilts and turns and tries hard to get away, but the sellsword is persistent in meting out the punishment.", "他瘫倒，又转身用尽全力尝试脱逃，但是佣兵执着于完成惩罚。");
	text = text.replace("When it\'s all said and done, you leave the beaten man behind, wimpering and clutching the dirt between his frail fingers.", "当一切都被完成之后，你把那个挨了打的人留在了那里，他的整个身体都蜷缩在土里。");
	
	text = text.replace("Feeling bad for the feeble man, you decide to give him some water and food.", "出于对这个虚弱的人的怜悯，你决定给他一些食物和水。");
	text = text.replace("He almost snatches the meal away from you and drives his famished face into it.", "他几乎是把食物从你的手中抢走，然后把他的整张饥饿的脸埋在里面。");
	text = text.replace("The thief thanks you between every bite.", "小偷每咬一下都感谢你一句。");
	
	text = text.replace("You tell the men to get back to marching.", "你告诉你的手下回去继续行军。");
	text = text.replace("The thief wipes his mouth and stands up, wobbling as his weak legs take a few steps after you.", "小偷擦了擦他的嘴然后站了起来，摇晃着，用他那瘦弱的腿走了几步跟上了你。");
	text = text.replace("He asks if maybe he could join the company.", "他问他可不可以加入战队。");
	text = text.replace("He\'ll give his life for you, if he must, just anything to not have to steal anymore.", "他会把他的生命献给你，如果他必须的话，这样他就什么都不用偷了。");
	
	text = text.replace("As the thief cowers, you draw your sword.", "当小偷恐惧地后退的同时，你拔出了剑。");
	text = text.replace("He begs for mercy as his mirrored face ripples over the blade\'s fuller and edges.", "刃和脊上反射着他那整张乞求着怜悯的脸。");
	text = text.replace("You raise the weapon.", "你举起了武器。");
	text = text.replace("The man screams out that he\'ll work for you, that he\'ll work for free, anything to spare his life.", "那人尖叫着说他愿意为你工作，他愿意免费工作，任何事都行，只要能留他一命。");
	text = text.replace("You hesitate, your sword still lingering in the air.", "你犹豫着，你的剑还在空中挥舞。");
	
	text = text.replace("The punishment for thievery is death.", "对于偷窃的惩罚就是死刑。");
	text = text.replace("You plunge the sword down, cutting off the thief\'s last words with a quick stab into his chest.", "你重重地将剑挥下，用迅捷的刺入他胸口的一击结束了他剩余的话语。");
	text = text.replace("He seizes up, speechless save for the scratching of his thin hands grabbing that which is killing him, and then he falls back, dead within moment.", "他身体僵直，无言地用他那瘦弱的手捂住正在杀死他的那个伤口，然后倒下，没过一会就死了。");
	text = text.replace("You retrieve your weapon and clean it off in the nook of your elbow.", "你把武器从他的身体里拔了出来，然后在你的肘关节上擦了擦。");
	text = text.replace("The dead man\'s head turns to a side as blood pools quietly beneath him.", "死人的头转向一边，血在他的身下汇成了一滩。");
	
	text = text.replace("You lower your weapon and the man crawls to you and hugs your legs.", "你放下了你的武器，那人爬向了你保住了你的双腿。");
	text = text.replace("He kisses your feet until you draw away.", "他亲吻着你的脚直到你走开。");
	text = text.replace("To get things straight, you give him a long list of orders and how it is to work in the company.", "为了确保一切顺利，你给了他一张长长的关于命令和如何在战队里工作的清单。");
	text = text.replace("You also give him a contract which he signs with a jagged \'x\'.", "你也给了他一份合同，他用一个歪歪扭扭的“x”来签。");
	text = text.replace("A few of the brothers then spend the rest of the day teaching him the ropes and introducing him to the rest of the company.", "有几个兄弟花了这天接下来的时间来教他如何打结，并把他介绍给战队里的其他人。");
	text = text.replace("By night\'s end, it seems like he\'s already beginning to fit in.", "到了晚上时，他看起来已经开始适应了。");
	text = text.replace("By next morning, you wake to see a great number of supplies are missing and the new man is nowhere in sight.", "第二天早上，你醒来却看见一大堆补给不见了，新来的那个也看不见了。");
	text = text.replace("It appears that, although you stayed the thief\'s execution, he went on ahead and stole things anyway.", "看来，虽然你饶恕了那个小偷，他也依然偷了你的东西然后逃跑了。");
	text = text.replace("Let that be a lesson to you.", "让这成为给你的一个教训。");

//training_accident_event.nut
	text = text.replace(/While training, (.*?), not being the most dexterous fellow, manages to hurt himself with his own weapon\./, "进行训练时，$1，没能成为一个灵巧的人，他用自己的武器伤了自己。");
	
	text = text.replace("Traveling, you like to keep your men fresh with the occasional training exercise.", "在旅行时，你喜欢让你的人通过一些不时的训练来保持战斗力。");
	text = text.replace(/Unfortunately, while practicing a riposte, (.*?) managed to stick himself in the foot\./, "不幸的是，在训练还击时，$1，插到了自己的脚。");
	text = text.replace("The man appears even more hurt by the embarrassment.", "他看起来因尴尬受到的伤更甚。");
	
	text = text.replace(/While doing inventory, you ask (.*?) to carry over a quiver of arrows\./, "在清点库存时，你命令 $1 去搬一筒箭。");
	text = text.replace("The short, simple journey ends with the man tripping over a rock and turning himself into a pincushion.", "这趟简单的旅途以他被一块石头绊倒而结束，并且让他成为了一个大号箭靶。");
	
	text = text.replace(/You find a rather drunk (.*?) nursing the side of his face\. (.*?) explains that the idiot tried to dance over a series of rocks, only to fall and bash himself in the face\. Great\./, "你发现 $1 醉着处理他脸一边的伤口。$2 解释说这个呆子尝试在一堆尖石上跳舞，只是跌倒了然后脸狠狠撞在了地上。真好。");
	
	text = text.replace(/While (.*?) and (.*?) train, (.*?) comes in between them, lecturing on how to do it properly while at the same time not watching where he\'s going\./, "当 $1 和 $2 训练时，$3 站到了他俩之间，讲着如何才能正确地训练，同时没看着他在往哪里走。");
	text = text.replace("A wayward wooden sword crosses paths with his face and a moment later the idiot is unconscious.", "一把失控的木剑横贯在他的脸上，没过一会那个傻子就失去意识了。");
	
	text = text.replace(/It appears (.*?) got a little too much to drink before partaking in today\'s sparring\./, "看来 $1 在参加训练前喝得有点太多了。");
	text = text.replace("As the story was explained to you, the drunkard mistakened a tree for an enemy combatant.", "告诉给你的事情经过是这样的，那个醉汉错把一棵树当成了敌人。");
	text = text.replace("He then, again as the story goes, proceeded to charge said tree, knocking himself out in the process.", "之后事情是这样进行的，他，向那棵树发起了冲锋，在过程中撞到了自己。");

//traveler_event.nut
	text = text.replace("You eye a traveler in the distance bobbing forth, slouched and crooning like a wingless gargoyle.", "你看见一个旅行者踟蹰而来，没精打采地低声念念有词像个丢了翅膀的石像鬼。");
	text = text.replace("His walking stick bobs and prods in front of him and even far away you hear the snicker and snacker of stones being tapped.", "他的手杖在前方戳戳点点你甚至在很远就能听到路上石头被敲击的声音。");
	text = text.replace("You give an order for your men to hold and wait, letting the stranger come to you.", "你命令你的人暂时停下等待，让这个陌生人靠近前来。");
	text = text.replace("When he finally nears, he looks up.", "等他终于靠近了，他抬头看来。");
	text = text.replace("At first, his nose is all that you see, the rest of him hidden in a cloak.", "刚开始，你就只能看见他的鼻子，他的其余部分都藏在斗篷里。");
	text = text.replace("He sniffs gingerly like a blind mole come across a bizarre impasse.", "他像一只瞎鼹鼠一样谨慎地嗅着和你的人形成了一种古怪的对峙。");
	text = text.replace("Just as you begin to ask if the man is alright, he throws the cloak back, revealing himself.", "你正准备问问他是否有什么麻烦的时候，他揭开了斗篷，展示了身形。");
	text = text.replace("That which faces you is a tired figure.", "你面前是一个疲倦的家伙。");
	text = text.replace("Hobbled. Sleepless days pinch creases about his eyes.", "步履蹒跚。睡眠不足使他的眼角满是皱纹。");
	text = text.replace("Reddened cheeks spread as he smiles.", "他微笑的时候脸上满是不正常的潮红。");
	text = text.replace("He asks if he might stay with your party for a time.", "他问他是否可以和你的队伍在一起待一段时间。");
	text = text.replace("A traveler hails your party from the roadside.", "一个旅行者在路旁拦住了你的队伍。");
	text = text.replace(/He says he\'s on his way to (.*?) but that he wouldn\'t mind a rest\./, "他说他是在去 $1 的路上但是他需要休息。");
	text = text.replace("The next question he has is an obvious one: he wonders if it\'d be alright to stay with your party for the night.", "接下来的问题显而易见：他想知道他是否可以和你的队伍一起过夜。");
	text = text.replace("A traveler carrying a cart of personal goods heads your way.", "一个旅行者装着一货车个人物品迎面而来。");
	text = text.replace("You let him approach, holding your hand up to warn him to go no further.", "等他离你不远，你举起你的手示意他不要再继续靠近。");
	text = text.replace(/He states that he is a simple wanderer and that he\'s only looking to get to (.*?)\. First showing that he is completely unarmed, he asks if maybe he can stay the night with your company\./, "他声明他只是个流浪者而且他只是想去 $1。 在展示了自己手无寸铁之后，他问自己能不能和你的战队一起过夜。");
	text = text.replace("A whistling man ambles down the road, a cheery dog huffing at his side with its tongue aloll.", "一个吹着口哨的人沿着道路小跑着，一只狗伸着舌头在他身边兴奋地狂吠。");
	text = text.replace("Seeing your troop, he stabs his walking stick into the dirt and tents his hands atop it.", "看到你的队伍，他把手杖戳进泥地里双手撑在上面。");
	text = text.replace("Some small talk is made of the weather, notably that rain is in the belly of some oncoming clouds.", "聊了些天气之类的客套话，尤其是乌云压城山雨欲来之类的话。");
	text = text.replace("He asks if mayhaps he could dodge the rain in the company of sellswords.", "他问他能不能在一群佣兵战队里躲一下雨。");
	text = text.replace("A strange request, not one usually made to men who earn blood money.", "一个奇怪的请求，对于挣血钱的人来说很少遇到这种请求。");
	text = text.replace("A man walks the road with a shovel bobbing over one shoulder and a sack of dirt swinging in the other hand.", "一个人一手压着肩上上下颠动的铁锹另一只手拎着一大袋泥土。");
	text = text.replace(/When you inquire as to what he is doing, he says he\'s just buried his brother and he\'s on his way back to (.*?)\. The sack holds some of the dirt where his kin was laid to rest\./, "你问他在干什么，他说他刚刚埋葬了他的兄弟并且正准备回 $1。这个袋子装着他的血亲长眠之地的泥土。");
	text = text.replace("Respectable. The man looks weary, as weary as a man who has buried his sibling would understandably be.", "值得尊敬。这个人看起来疲惫不堪，确实如一个刚刚亲手埋葬了自己兄弟的人那样疲惫。");
	text = text.replace("Perhaps sensing your pitying gaze, he asks if maybe he can stay with your company for a time.", "也许觉察到了你同情的目光，他问是否可以和你的战队在一起待一会儿。");
	text = text.replace("You spot a strange man hobbling along the road.", "你看见一个奇怪的人沿路蹒跚而行。");
	text = text.replace("He\'s dressed in a long cloak and he\'s got a knapsack yoked over one of his shoulders.", "他穿着一个长斗篷而且一个肩膀上还勒着一个小背包。");
	text = text.replace("His eyes stare at the ground until they come to your feet at which point he finally looks up.", "他的眼睛盯着地面一直到看到你的脚才抬头。");
	text = text.replace("Seeing your company, the man is surprisingly unalarmed.", "看到你的战队，这个人很奇怪地毫不紧张。");
	text = text.replace(/In fact, he\'s quite receptive of your presence and asks if maybe he could spend the night with sellswords before continuing his journey to (.*?)\./, "事实上，他对你的出现非常乐于接受并且询问他是否可以和你们佣兵一起度过一个夜晚以便明天继续前往 $1。");
	text = text.replace("A man with a pitchfork is crossing a field where the crops have failed.", "一个带着草叉的人走过一片庄稼枯萎凋零的庄稼地。");
	text = text.replace("His feet scuff up the deadened ground and you see tufts of ash being pitched wind-wise.", "他的脚踩着干旱龟裂的土地你看到带起一蓬蓬灰尘随风而去。");
	text = text.replace("When he gets to the road, you hail him down and ask where he\'s coming from.", "当他走到路上来的时候，你拦住他问他来自何方。");
	text = text.replace("The man is a daytaler only trying to get back home.", "这人是个临时工并且正准备回家。");
	text = text.replace("All the work around here is dried up, literally.", "他在这里所做的一切工作都已经结束了，确实是。");
	text = text.replace("Licking his cracked lips, the man wonders if maybe he could stay the night with your company.", "舔舔干裂的嘴唇，这人想知道他能不能和你的战队一起过夜。");
	text = text.replace("He certainly looks like he could use some rest, anyway.", "他肯定是需要休息一下，无论如何。");
	text = text.replace("A man carrying a bucket of tools crosses paths with your company.", "一个人携带一大桶工具与你的战队不期而遇。");
	text = text.replace("The roads seem ill-fit to place one man against a company of sellswords, and this stranger appraises the situation correctly by placing his wares down and putting his hands up.", "这道路看上去怎么都容不下一个带桶的人和一整个战队佣兵同时通过，这个陌生人放下手里的桶并且高举双手解决了这个问题。");
	text = text.replace("You tell him to calm and ask where he is going.", "你告诉他别紧张并且问他去哪里。");
	text = text.replace(/He explains that he is a mason from (.*?), but that his work there is done\./, "他解释道他是一个来自 $1 的石匠，但是他在本地的工作已经做完了。");
	text = text.replace("He\'s only on his way back to his family located on a homestead a good day\'s walk from where you stand.", "他只是想回到自己那个离此地只有一天路程的家。");
	text = text.replace("Looking rather thirsty and tired, the man asks if maybe he could spend the night with your company to help him rest for the coming walk.", "看上去又渴又累，这个人问是否可以和你的战队一起过夜休息以恢复体力继续前行。");
	text = text.replace("A figure appears on the horizon, blurred and shimmering in a heat haze.", "一个身影出现在地平线，在热浪中模糊又闪烁。");
	text = text.replace("It appears to have paused, no doubt having seen you, too.", "那个身影看起来暂停了，毫无疑问也看到你了。");
	text = text.replace("With little fear, you press the men onward and soon come across a man toting a few bags of this or that.", "带着一点担心，你带着你的人前进并且很快遇到了一个携带着几个装满零碎东西背包的男人。");
	text = text.replace("He\'s sitting down on the ground and doesn\'t bother getting up when you near.", "他坐在地上并且即使你靠近了也没站起来。");
	text = text.replace("He explains he\'s been on the road for days and could use a good night\'s rest.", "他解释说他连续多日赶路现在需要休息。");
	text = text.replace("Naturally, he asks if he can spend that rest in the company of your men.", "很自然的，他问可不可以跟你战队的人一起休息。");
	text = text.replace("You come across a man who is weak and weary.", "你遇到一个身体虚弱意志动摇的男人。");
	text = text.replace("He explains that he has been searching for his lost dog, but that he\'s just about given up.", "他解释说他在寻找他丢失的狗，但是他已经快要放弃了。");
	text = text.replace("Before he heads home, he wonders quite loudly if maybe a night\'s rest in your company could help him find the energy to seek out his mutt for one more day.", "在掉头回家之前，他觉得如果能和你的战队一起休息一晚也许能帮他回复精力支撑他再找一天碰碰运气。");
	text = text.replace("A man tracked by buzzards is found on the side of the road.", "你在路边发现一个被秃鹰追踪的人。");
	text = text.replace("He\'s not hurt or wounded, just exhausted.", "他并没有受伤，只是精疲力尽。");
	text = text.replace("He asks with a cracking voice if maybe he could spend the night in the company of your men.", "他用沙哑的嗓子询问是否可以和你战队的人一起度过夜晚。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("Man is treated to war the day he is born.", "男人从出生那天起就被请上战争的筵席。");
	text = text.replace("It is his mother who is with him for that first battle, and to his mother whom he calls in his last.", "正是自己的母亲陪着自己打了人生第一场战斗，而人生的最后一场战斗中也会哭喊自己母亲的名字。");
	text = text.replace("If only the evil we see in others could be seen in ourselves, then the call to swords might fall on deaf ears.", "要是我们能像发现他人的邪恶一样发现自身的邪恶就好了，那样的话当有人召唤战争时大家都会充耳不闻。");
	text = text.replace("How sad that men are so uncomfortable looking inward, and how sad that when the call for swords is made our ears hear better than ever.", "令人伤心的是人们不愿意自我反省因为那样会令自己心怀愧疚，更令人伤心的是当战争召唤的时候所有人的耳朵似乎比平时任何时候都要更灵光。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("I\'d found myself nearing the top of a mountain a few months ago.", "我几个月前才去过一个高峰附近。");
	text = text.replace("Highest I\'ve ever been!", "那是我去过最高的山峰！");
	text = text.replace("Traveled there in the company of an expedition.", "我跟一个探险队一块儿去的。");
	text = text.replace("Some man smarter than I reckoned it might be worthwhile so he could point his big glasses to the skies.", "某个大聪明把一个长管子对着天空一个劲儿地看并且觉得这物有所值。");
	text = text.replace("Anyway, I looked down at the land and could see what had been done to it.", "不管怎样，我朝山下看看到了这样的一幕。");
	text = text.replace("Cities and towns and roads, little moles of gritty patchwork.", "城市道路星罗棋布，构成像鼹鼠洞一样的地表拼图。");
	text = text.replace("Wagons scuttling like ants, selling what could be pilferaged from this man or this animal or this land.", "载重货车像小蚂蚁一样缓缓前行，售卖着从这些人这些动物和这些土地盗窃来的各种物资。");
	text = text.replace("Holes in the forests where trees used to be.", "原本是森林的地方现在全是的大坑。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("Thank you for offering the fish, sirs, but I will have to turn it down. Let me explain.", "感谢你们提供的鱼，先生们，但是我不得不拒绝。请听我解释。");
	text = text.replace("Just the other day I tried diggin\' a hole for m\'kin as he\'d passed away as folks requiring holes in the earth tend to do.", "那天我正在挖坑准备掩埋我的兄弟像传统那样土葬。");
	text = text.replace("T\'was a distant cousin that stood close.", "有个远方表亲就在我旁边。");
	text = text.replace("Lived next door, actually.", "他就住我隔壁，事实上确实如此。");
	text = text.replace("Feller died of illness, something we don\'t know of, but none but he got so I guess we is alright.", "这家伙死于疾病，某种我完全不知道的疾病，但除了他谁也没有感染这疾病我猜我们都逃过一劫。");
	text = text.replace("He was all green when he passed.", "他死的时候还是那么年轻。");
	text = text.replace("Y\'all know what that might have been?", "你们知道那是个什么疾病吗？");
	
	text = text.replace("No? Damn. Well anyway, I dug his grave for him, as he surely wasn\'t going to do it himself.", "不知道？我靠。唉算了我继续说，我得给他挖个墓穴，我敢肯定他不打算自己亲自挖。");
	text = text.replace("I got far into the ground when I come across a big ol\' stone.", "我越挖越深直到我发现了一块大石头。");
	text = text.replace("Pick hit it hard, broke the shaft in two and made chalk of my pickaxe.", "镐重重地敲打在石头上，把手柄都震断了我的镐也崩出个大白点。");
	text = text.replace("I said horseshit, I\'ve gone too far to stop here so get out of the way, stone!", "我说我就日了，我挖了这大半天却要在这里停下没法再挖，就因为一块石头！");
	text = text.replace("But that rock had bones in it.", "但是我发现这块石头里面有骨头。");
	text = text.replace("Not on it, in it.", "不是在上面，是在里面。");
	text = text.replace("Strange looking ones, but bones nonetheless.", "看起来很奇怪，但肯定是骨头不会错的。");
	text = text.replace("Death is remarkably familiar from an outsider\'s perspective.", "从一个事不关己的旁观者态度来说死亡真是太熟悉了。");
	text = text.replace("Anyway, the skull seemed to be looking at me, judging me, saying \'what is it you think yer doing here?\'", "不管怎么说，那个骷髅似乎在盯着我看，审视着我，对我说“你这货在这儿干什么？”");
	text = text.replace("So I got up out of that hole and ran to m\'home, my cousin\'s remains yoked over my shoulders like I\'d stolen them.", "于是我赶紧爬出洞穴狂奔回家，我远方表亲的尸体就这么扛在肩膀上就好像是我在盗尸一样。");
	text = text.replace("I was bothered. Couldn\'t sleep.", "我不胜困扰。没法安眠。");
	text = text.replace("Felt like I was laying over what must\'ve been hundreds of fellers right then, some so old they\'d taken shape with rocks of all things.", "我感觉我正躺在几百几千死掉的尸体上，有的尸体太古老了以至于都变成了石头或者其他什么鬼东西。");
	text = text.replace("Dead fellers. All the way down.", "死人啊。一直往下挖。");
	text = text.replace("Nothing but dead, all the way down I say!", "什么都没有只有死人，我是说往下挖一直都是死人没别的！");
	text = text.replace("And I didn\'t know what to do and I suppose it still bothers me now if it ain\'t obvious.", "我都不知道该怎么做了我现在还在被死者困扰着应该是很明显的事情了对吧。");
	
	text = text.replace("Later on I decided I wouldn\'t bury m\'cousin.", "后来我觉得不想埋葬我的远方表亲了。");
	text = text.replace("Instead, I burned his remains and threw the heap of what was left stewing and smoking into\'a\'pond.", "换个思路，我把他的尸体焚烧之后把骨灰和剩下的一堆冒烟的东西都扔进了“一个”池塘。");
	text = text.replace("Said to m\'self, \'cousin, you ain\'t gonna be no rock\'.", "我对自己喃喃自语，“表哥，你不会变成石头的”。");
	text = text.replace("But the other day I found them bones washed ashore, and there was a fat bellied fish caught in the ribs.", "但是后来我发现骨头被冲到岸边，有一条吃的肥肚油肠的大胖鱼被困在他的肋骨中间。");
	text = text.replace("Caged himself there on account of good eats, I guess.", "会被困住是因为狂吃海塞吧，我猜的。");
	text = text.replace("I picked that fish up and held it, and my cousin I s\'pose, in my hand.", "我把这条鱼拎起来抓在手上，我的远方表哥，就这样在我手上。");
	text = text.replace("T\'was limp. Bugeyed as fish are without their watery lids.", "这真让人感到无力。没有水这鱼只能鼓眼吹气半死不活。");
	text = text.replace("But then a dog ran by and took it from me.", "但这时有一只狗跑过从我手里一口抢走了鱼。");
	text = text.replace("Gobbled it right quick for it knew the nature of its crime, I think.", "狼吞虎咽一口就咽下去了因为就连它也知道吃了那东西这件事的本质是多大的罪行，我觉得是这样。");
	text = text.replace("That\'s where a piece of my cousin ran off to.", "这就是我的一块远方表哥的下场。");
	text = text.replace("Dodged the earth on account of the hungry rocks only to be eaten by a squire of a fish that served itself to a righteous dog of all things.", "躲过了吞噬尸体的饥饿岩石层却只是葬身鱼腹并且又给一只狗上了菜。");
	text = text.replace("So now you know why I don\'t eat fish no more.", "所以现在你知道我为啥不吃鱼了吧。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("I took part in the eastern campaigns.", "我参加了东部战役。");
	text = text.replace("Drove the supply wagons, carrying untold numbers of armor, weapons, horses, foods, you name it.", "我驱赶着后勤补给车，带着无法计数的铠甲，武器，马匹，食物，你永远都想不到有多少。");
	text = text.replace("Hell, that\'s an age ten years past now, I believe.", "狗日的，那至少是十年前了吧，我感觉是的。");
	text = text.replace("T\'was the last time men truly stood together, and I suppose the last time the greenskins did the same.", "那大概是最后一次人类全部精诚团结万众一心，我估计那些绿皮怪物也是一样。");
	text = text.replace("No mystery that when the two forces met they shattered against one another.", "这两股强大的力量相遇必然会互掐起来相互摧毁。");
	text = text.replace("Now we dwell in a time of chaos and rumor and superstition and idle talk amongst strangers.", "而我们现在却生活在一个混乱的时代流言迷信满天飞并且陌生人之间都能吹牛打屁胡扯。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("Ever seen a greenskin cleave a horse\'s head off?", "你看过绿皮一刀砍掉一匹马的脑袋吗？");
	text = text.replace("Quite the sight. But I\'ve also seen a horse kick an orc\'s teeth out and bury him in mud with stomping madness.", "相当震撼。不过我也看过一匹马踢掉兽人的牙齿并且把这货一通狂踩成烂泥。");
	text = text.replace("We forget, I think, that the horse is more akin to fancy a war than we are.", "也许我们忘记了，我觉得是这样，马其实是比我们更适合战争的生物。");
	text = text.replace("Frightful, curious animals, sure, but violent.", "可怕而古怪的动物，当然，也很暴力。");
	text = text.replace("They say, left to themselves they oft kill one another, kill each other\'s children and their children\'s children.", "对它们来说，动物经常捕杀其他动物，或者干脆自相残杀，猎杀对手的孩子甚至孩子的孩子。");
	text = text.replace("It\'s a damned thing that women love us both.", "女人们即喜欢我们又喜欢那个真是太特么操蛋了。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("Ah, the Battle of Many Names.", "啊，世纪之战啊。");
	text = text.replace("Aye, I took part.", "嗯，我参加了。");
	text = text.replace("Vanguard. Front and center.", "先锋队。中央前线。");
	text = text.replace("No, I do not wish to talk about it.", "不，我不想谈这个话题。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("The Battle of Many Names?", "世纪之战？");
	text = text.replace("Who did not take part in that?", "谁没参加过呢？");
	text = text.replace("Half the world was on the march then, I swear it.", "半个世界都在向那里进军，我发誓。");
	text = text.replace("I stood with the infantry.", "我是步兵大队的。");
	text = text.replace("Footman to a lord, to be precise.", "准确说来，是一位领主的随从护卫。");
	text = text.replace("Protected him well until the orcs released their berserkers.", "我们保护他保护的很好直到兽人放出了他们的狂战士。");
	text = text.replace("After that, everybody sought to protect themselves, a job which proved quite difficult.", "从那以后，所有人都只想保护自己，就连保护自己都被证明很难做到。");
	text = text.replace("I used to lie about how I made it out.", "我以前经常撒谎说我是怎么英勇作战杀出重围。");
	text = text.replace("Now I don\'t. The truth is my lord had his face crushed by a chain and his mount flipped and fell atop me, its poor heart struck dead in fright.", "现在我不想吹了。事实上我的领主被一根链子抽到脸上抽死了而他的马倒下来压住了我我才活下来，那匹可怜的马是竟然是被吓死的。");
	
	text = text.replace("The traveler pauses, staring into the campfire.", "旅行者停了下来，眼睛盯着篝火。");
	text = text.replace("He prods the edge of it with a stick.", "他用手杖探了探边缘。");
	text = text.replace("That\'s the last thing I remembered as far the fightin\' was concerned.", "那大概是聊起战争这个话题我最不愿回忆的一个情景。");
	text = text.replace("I eventually woke to the rains coming up to my nose.", "我终于醒来，雨已经到了我的鼻子了。");
	text = text.replace("Nearly drowned me in my dozing.", "我昏迷中差点被淹死。");
	text = text.replace("I wiggled my way out from under the horse and crawled to god knows where.", "我从马的尸体下艰难地爬出来爬了鬼知道多久。");
	text = text.replace("Orcs and men lay everywhere, dead, dying, drowning.", "兽人和人类到处都是，死透的，快要死的，快被淹死的。");
	text = text.replace("Lots of screaming. Couldn\'t tell who or what it was coming from.", "惨叫呻吟。不知道是谁发出来的。");
	text = text.replace("I remember the mud.", "我还记得那些泥浆。");
	text = text.replace("I remember it clutching at me.", "我还记得我深陷其中。");
	text = text.replace("A maiden, strong-armed like an ox, saved me from it.", "一位女士，她的手臂比牛还强壮，她拯救了我。");
	text = text.replace("She threw me on a cart and the last thing I saw was the battlefield and, I\'m sorry.", "他把我扔进一辆货车而我最后看见那个战场的是。啊对不起。");
	text = text.replace("I must stop. Thank you for having me for the night.", "我必须停止这个话题。谢谢你让我和你们一起过夜。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("I led a company in the Battle of Many Names.", "我带领一支战队参加了世纪之战。");
	text = text.replace("It was a righteous affair.", "这可是是正义的事业。");
	text = text.replace("Man against orc! Oh, what a sight.", "人类对兽人！哇，多么壮观。");
	text = text.replace("Half of my men died on those fields, but their sacrifice saved the whole land!", "我的人在战场上死了一半，但是他们的牺牲拯救了整个大陆！");
	text = text.replace("I look fondly on those times. What man doesn\'t?", "我深情的感慨那些时光。谁又不是呢？");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace(/Out in (.*?) they had a father up for trial\./, "就在 $1 外他们在审判一个父亲。");
	text = text.replace("He\'d murdered two brothers on account of knocking his cart over.", "如果考虑到他弄翻了货车造成的伤亡的话他已经谋杀了两个兄弟。");
	text = text.replace("And then apparently the taste of it had him murdering some more.", "显然意犹未尽还想杀死更多人。");
	text = text.replace("All told, he took the lives of at least seven people.", "总共算起来，他至少杀了七个人。");
	text = text.replace("Naturally, they hanged the man.", "自然，他们把这个人判处绞刑。");
	text = text.replace("But I ran into his son the other day and he told me the hanging was merely some clerical mistake.", "但是后来有一天我遇到了那人的儿子而他告诉我那天的绞刑只是一个文书错误。");
	text = text.replace("His father was an upstanding man, not the least bit self-serving and the people he killed had it coming.", "他的父亲是个堂堂正正的汉子，完全没有任何利己之心却遭遇了仇家的报复。");
	text = text.replace("What\'s more curious, this youngin\' is now mayor!", "更令人奇怪的是，这年轻人现在是个镇长！");
	text = text.replace("Now, the way I remember it the man slaughtered seven folks outright. Just like that!", "现在，这就是我记忆中的那个人杀了七个人的事件。就是这样！");
	text = text.replace("But last time I was in town they\'d moved his long-necked bones to a proper cemetery and I\'ll be damned if I didn\'t see some flowers on the tombstone.", "但我上一次去镇上的时候他们已经把那个吊死的尸体移进了合适的墓穴并且如果我没撞鬼的话墓碑上还有人送花。");
	text = text.replace("Not sure what to make of these things.", "我也不知道这种事情到底该信谁的。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("You ain\'t the only mercenary company out here.", "你们不是这一块儿唯一的雇佣兵战队。");
	text = text.replace("I\'m sure you know that, and I don\'t mean to sound threatening, but I only wish to tell ya something.", "我相信你们也知道，我也没有威胁的意思，但我只想告诉你一件事。");
	text = text.replace("A couple weeks past some two or three companies of men, standing like your own, met at a crossroads and apparently the path wasn\'t big enough for all of \'em, so they fought.", "两个星期前大概两到三个战队的人，就跟你们现在这样，在一个十字路口相遇并且显然那个路口装不下两方那么多人，于是他们干起来了。");
	text = text.replace("If any survived, it wasn\'t enough to carry off those who didn\'t.", "就算有人活下来，活的人也不够把死尸运走。");
	text = text.replace("I like your men.", "我喜欢你的手下们。");
	text = text.replace("They is good people.", "他们都是好人。");
	text = text.replace("But please do be careful out there.", "但是在那边时请一定要小心。");
	text = text.replace("Killing raiders and brigands and the gods know what else isn\'t the only thing you\'ll be doing.", "杀人越货的掠夺者和强盗们还有上帝才知道什么鬼玩意儿在那里蠢蠢欲动。");
	text = text.replace("You kill in a market of competitors, sellsword.", "你身处一个竞争激烈的杀戮市场中，佣兵。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("A boy stole my lunch the other day, but he\'d done not do anything but stand there and eat it in front of me.", "有一天一个小男孩偷了我的午饭，但是他得手之后不但不跑还就在我面前开始吃我的午饭。");
	text = text.replace("I said, \'give me back my lunch ya scamp\', but he said no.", "我说，“把午饭还给我你这个臭流氓”，但是他说不。");
	text = text.replace("I reached for it but his scrawny legs proved to be more cat than chicken.", "我伸手去拿，但他那瘦骨嶙峋的腿与其说是鸡，不如说是猫。");
	text = text.replace("I said, no, I asked why he\'d done have to eat it in front of me.", "我说这样可不行，我就问他为什么非要在我面前吃。");
	text = text.replace("This was torture, you see.", "这简直是折磨，你看到的。");
	text = text.replace("He said \'because I\'m hungry\'.", "他说“因为我饿”。");
	text = text.replace("I told \'im, \'I\'m hungry too, now give it back\'.", "我就说了，“那我也饿啊，赶紧还给我”。");
	text = text.replace("Naturally, he done said no.", "很自然的，他还是说不行。");
	text = text.replace("And so naturally when he\'d done turned around I cracked him with a stone and that slackened his speed a bit and I got m\'lunch back.", "顺理成章的当他转身想跑的时候我一石头砸中他了并且减缓了他的速度所以我拿回了我的午饭。");
	text = text.replace("But then yonder comes a footman of the mayor who says don\'t do that.", "但是那边来了一个镇长的步兵护卫说叫我别动手。");
	text = text.replace("I asked \'im why not, he said \'because that\'s the mayor\'s boy\'.", "我就问我为什么不能，他说“因为那是镇长的儿子”。");
	text = text.replace("My punishment was nothing, but I was warned t\'not do it again.", "他也没惩罚我，只是警告我不要再犯。");
	text = text.replace("I told \'im, I said, \'tell the boy to not steal again!\'.", "我就跟他说，我这样说的，“告诉那个孩子以后别再盗窃了”。");
	text = text.replace("And they said they had, and that I was more likely to yield to a command than he and that\'s t\'way it t\'was.", "他们说早就说过了，只不过我看上去比那个孩子更容易听话就是这么个事儿。");
	text = text.replace("Farkin\' small towns, I swear on m\'sack those places are more billy than hill.", "狗娘养的小镇，我敢拿我的袜子打赌这地方比魔鬼山还招人恨。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace("Death was strange on the battlefield of Many Names.", "世纪之战战场上的死亡都很奇怪。");
	text = text.replace("Orcs don\'t kill like men do, they make it fast.", "兽人杀人可不是跟人类这样，他们杀人超快。");
	text = text.replace("They leave you little wait between the now and the then.", "他们动起手来可不会给你留下时间哔哔赖赖。");
	text = text.replace("I got a good look at their handiwork after it was all said and done. Men strewn in pieces.", "尘埃落定之后我仔细研究过他们的手法。人被拆分的零零散散。");
	text = text.replace("Whole parts, legs, arms, bodies split in seams most unnatural.", "大块躯干，腿，胳膊，以极其不自然的裂缝分隔开的躯体。");
	text = text.replace("Instant death. Swing, head gone!", "痛快的死法也有。伸手一挥，脑袋飞了！");
	text = text.replace("And the body crumples and stiffens.", "而且尸体还会干缩和变硬。");
	text = text.replace("Most of the dead looked like that, like they\'d just been scared and sat frozen in their embarrassment.", "大部分的尸体都是那个样子，就好像他们吓坏了只好尴尬地坐在原地不动一样。");
	text = text.replace("Most looked nothing like men at all.", "大部分尸体早就不成人形了。");
	text = text.replace("A man should look asleep when he\'s dead, you know?", "一个人死掉后就应该像是在睡眠的样子，你知道吗？");
	
	//text = text.replace("He continues.", "他继续道。");
	text = text.replace("A few received the courtesy of a slow death, of a pause to get ready and make themselves comfortable and find peace, to curl up into a ball and depart this place in a similar shape to how they\'d come in.", "有些人得到了所谓礼貌对待让你缓慢的死去，用刑暂停假惺惺地给你机会让你可以自己寻找舒服和慰藉，比如说把你卷成一个球把你滚来滚去啊什么的。");
	text = text.replace("But I will say one man, taken apart at the beltline, managed to hang on.", "但是我要说一个人，拦腰被斩断了，但却没死。");
	text = text.replace("I found him myself.", "我发现他了。");
	text = text.replace("I told him to close his eyes because I thought if he went to sleep maybe death\'d wake up.", "我告诉他赶紧闭眼因为我想只要他睡着了死神就会来拯救他。");
	text = text.replace("But he didn\'t go to sleep.", "但是他不想睡去。");
	text = text.replace("He just kept breathing, and talking.", "他只是不停地呼吸，说话。");
	text = text.replace("Talking about this chicken he had as a boy, and how he got upset when his father slaughtered it.", "说他小时候养的小鸡，说他爸爸杀鸡的时候他有多难过。");
	text = text.replace("Talked about a girl, and then a wife and a mother.", "说到一个小女孩，说到她变成一个妻子然后成为母亲。");
	text = text.replace("Talked about two mothers, actually.", "他谈到了两个母亲，事实如此。");
	text = text.replace("The man pauses, staring into the campfire.", "这个男人停了下来，盯着篝火。");
	text = text.replace("He looks up at you.", "他抬头看着你。");
	text = text.replace("I did not know half a man could live for so long.", "我从来没想过半截人可以坚持这么久。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler does speak some words which reside within your mind long after he\'s gone.", "关于这个或那个的谈论很多，但旅行者说的一些话在他离开后很长一段时间仍留在你的脑海里。");
	text = text.replace(/I saw\'r man cut down by lightning a few months ago\. (.*?) was his name\./, "几个月前我看见一个人被雷劈了。他的名字叫 $1。");
	text = text.replace("He had a lumber mill for a mouth, a wooden bite from side-to-side.", "我们以前开玩笑说他的嘴巴是个伐木场，咬一口如同伐木拉锯。");
	text = text.replace("Termites for teeth we used to say!", "他的牙齿跟白蚁一样！");
	text = text.replace("Anyway, I\'d found his head aflame, grinning hot fire back at me, his flesh curled down in strips of black and purple.", "不管怎么说，我发现他的脑袋在燃烧，咧开的嘴里面还在喷火，他的皮肉呈青紫色卷曲起来。");
	text = text.replace("The ground around him was scorched, smoke drifting around and little fires crackling.", "他身边的土地都被烤焦了，浓烟滚滚火花四溅。");
	text = text.replace("But he was still alive.", "不过他还活着。");
	text = text.replace("So I ran off to get some help when I heard a horrid noise behind me.", "于是我赶紧跑开去求援这时候我能听到身后传来一阵惨叫。");
	text = text.replace("Damned lightning struck him again!", "这狗日的雷电又劈了他一次！");
	text = text.replace("Smote by the gods through and through.", "他被神惩罚了一遍又一遍。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("The traveler speaks of some idle news.", "旅行者谈到一些无聊的消息。");
	text = text.replace(/They hanged some lady in (.*?)\. Didn\'t see her drop, but I did see her swing\./, "他们在 $1 绞死了某个女士。我没看到绞刑现场，我看的时候她已经在绞架上荡来荡去了。");
	text = text.replace("They said she stove a man\'s head in while he slept. What a wench.", "他们说她趁一个男人熟睡的时候把他脑袋给烤了。真是个婊子。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("The traveler speaks of a crime and its punishment.", "旅行者谈到了犯罪及其惩罚。");
	text = text.replace(/Out in (.*?) they hanged a boy for killin\' a merchant\./, "就在 $1 他们绞死了一个男孩因为他杀死了一个商人。");
	text = text.replace("Said he threw a stone at the trader to knock him off his cart.", "据说他扔石头把这个商人从货车上砸掉下来。");
	text = text.replace("He then ran over to steal his things, but the stoned man wasn\'t knocked out, so he drew his dagger and the boy drew his and I guess the boy was the one left standing when it was all said and done, o\'course, he now just be left swinging.", "而他跑过去抢劫了商人的财产，但是这个被砸中的商人并没有昏迷，于是他拔出匕首而那个男孩也拔出匕首我猜最后应该是男孩赢了，当然他现在也在绞架上晃啊晃。");
	text = text.replace("Talk of the execution say he kicked good and long, wouldn\'t stop kicking even after he was dead.", "关于行刑有人说这孩子在绞架上又踢又蹬坚持了很久，甚至死透了还在抽搐着又蹬又踹。");
	text = text.replace("Maybe his cold feet were lookin\' for warmth.", "也许他冰冷的双脚只是想寻找一点温暖。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("Much talk is made about this or that, but the traveler gets a little skittish and you ask what is on his mind.", "关于这个或那个的谈论很多，但旅行者变得有点不安，你问他在想什么。");
	text = text.replace("I\'ve heard rumors of graveyards turning up earth-empty.", "我听到一些谣言说坟墓都被掀了个底朝天。");
	text = text.replace(/They hanged a man out in (.*?) for gravedigging, unfortunately they kept finding deadless graves anyway\./, "他们在 $1 绞死了一个人说他盗墓，但是不幸的是还是能继续不断找到没有尸体的墓穴。");
	text = text.replace("Now, I\'m no superstitious man, but the way I hear it the dead\'re stepping out of the ground.", "如今，我可不是一个迷信的人，但是连我都听说了死者不断从地下爬出来。");
	
	text = text.replace("Whew. Yeah I suppose you is right.", "切。好吧我算你说得对。");
	text = text.replace("Dead walking the earth?", "死者出来遛弯了是吧？");
	text = text.replace("Ha! I\'ll leave such ideas to the children.", "哈哈！我会把这种故事留给小朋友。");
	
	text = text.replace("May the old gods have mercy for if my damned mother-in-law walks the earth she\'ll certainly have none for me.", "希望远古众神饶恕我假如要是我那该死的丈母娘从坟墓里爬出来她可不会对我有一点怜悯。");
	
	text = text.replace("You sit about a fire.", "你坐在火旁。");
	text = text.replace("The rather unfortunate looking man stares into the fire as he talks.", "那个看上去很倒霉的家伙一边盯着火堆一边说。");
	text = text.replace("I hear the rich folk have got these things that let them see what they look like.", "我听说有钱人有一种东西能让他们看到自己长什么样子。");
	text = text.replace("Mirrors! Aye, that\'s the name.", "镜子！对，就是这个东西。");
	text = text.replace("Wish I had one.", "真希望我也有一个。");
	text = text.replace("I hadn\'t seen my own face in.. well, ever.", "我已经有…呃…我从来就没看过自己长啥样子。");
	text = text.replace("Maybe a bit of a look when staring into a pond, I guess.", "也许只有在对着池塘的时候能看到一点模糊的影子吧，我觉得。");
	
	text = text.replace("The man\'s brow furrows.", "这人皱起了眉头。");
	text = text.replace("Oh yeah thanks, sellsword, that makes me feel so much better. Farkin\' cunt.", "哦谢谢你，佣兵，这让我感觉好多了。我操。");
	
	text = text.replace("The man stares into the mirror like he was watching his own death.", "这个男人盯着镜子就好像在看着自己的死尸一般。");
	text = text.replace("He rubs his chin and turns his head, desperately looking for some angle that won\'t disappoint.", "他搓着下巴转动着脑袋，拼命地试图寻找到一个不让人失望的角度。");
	text = text.replace("I\'ll be damned if my mother ain\'t the biggest liar that ever walked the earth.", "如果我的老妈不是这个世界上最大的骗子那就是我被诅咒了。");
	text = text.replace("Look at that ugly mug!", "你看那个丑鬼！");
	text = text.replace("He hands the mirror back and can\'t help but laugh at his unfortunate visage.", "他递还镜子并且因为那丑脸而忍不住地笑起来。");
	text = text.replace("I suppose I no longer have to wonder why the womenfolk run from me.", "我想我再也不用疑惑为什么女人都离我远远的了。");

//traveling_troupe_event.nut
	text = text.replace("While camping beside the road, a colorful wagon trundles on up with a sort of clanking, jingling musical immodesty.", "在路边露营时，一辆多彩的载重货车伴随着叮当作响的嘈杂声音隆隆驶来。");
	text = text.replace("You didn\'t think it a particularly big cart, but about fifteen men and women inexplicably pour out of its back.", "你可能不认为它是一辆特别大的车，但是大约有十五个男人和女人莫名其妙地从它的背后涌出。");
	text = text.replace("Painted faces, musical instruments, juggling balls, longswords for swallowing, wine jugs for firebreathing, the troupe of entertainers fan out and demonstrate mini-talent shows as though you\'d already paid for their services.", "彩绘的面孔、乐器、杂耍球、吞东西的长剑、喷火的酒壶，这群艺人在表演小型才艺表演，就好像你已经为他们的服务付了钱一样。");
	text = text.replace("When they finish, they clap, stomp their feet, and freeze before you, hands out, smiles across their faces.", "当他们结束时，他们鼓掌，跺脚，在你面前停下脚步，伸出手，脸上露出笑容。");
	text = text.replace("A white-faced mime ironically speaks.", "一个白脸的哑剧演员讽刺地说。");
	text = text.replace("What say you, travelers, care for a show?", "旅客们，你们喜欢看戏吗？");
	text = text.replace(/A mere (.*?) crowns to entertain you all evening!/, "只要付 $1 克朗就能让你整个晚上都很愉快！");
	
	text = text.replace(/(.*?) steps forward and picks up some of the troupe\'s tools of trade\./, "$1 向前走几步，拿起一些剧团赖以谋生的乐器。");
	text = text.replace("He tests them out, impressing the entertainers with how well he\'s able to use their own equipment.", "他试着演奏他们，展示他有多么精于此道，深刻打动了这些娱乐者。");
	text = text.replace("The mime asks if perhaps they could play a couple of tunes with him.", "这些哑剧演员们询问他们是否可以和他一起演奏几首曲子。");
	text = text.replace("He nods and joins the entertainers, putting on a show that\'s for the ages.", "他点了点头，加入了表演者的行列，上演了一场经久不衰的表演。");
	text = text.replace("When it\'s all over, the troupe is so impressed that they try and recruit the man.", "演出结束后，剧团深受感动，他们试着招募这个人。");
	text = text.replace(/You tell them that ain\'t happening and (.*?) nods\./, "你告诉他们那是不可能的，然后 $1 点头。");
	text = text.replace(/My time is with the (.*?) now, but I appreciate the compliment\./, "我现在与 $1 同行，但我很感谢你们如此欣赏我。");
	text = text.replace("You ask how much for the show, but the troupe leader shakes his head.", "你问演出多少钱，但剧团领导摇了摇头。");
	text = text.replace("No need. It was a pleasure playing with him.", "没有必要。和他一起表演十分高兴。");
	text = text.replace("We\'ve not put on a show like that in some time and the practice will do us well.", "我们已经有一段时间没有做过这样的表演了，练习一下会对我们有好处的。");
	
	text = text.replace(/Before the troupe can start, (.*?) the nobleman gets up and asks if they know of a particular song from his days in the court\./, "在演出开始前，$1 这个贵族站起来并询问他们是否知道一首他在宫廷时的歌。");
	text = text.replace("They used to sing it when I was a little lad.", "我小的时候，他们常唱这首歌。");
	text = text.replace("It\'s been years since I\'ve heard it.", "我已经好几年没听到这首歌了。");
	text = text.replace("The mime, again breaking character, grins and loudly proclaims that they know it.", "哑剧演员，挺身而出，他咧嘴笑着，大声宣布他们知道。");
	text = text.replace("He snaps his fingers and the musicians of the group pick up their instruments.", "他打响指，乐队的乐手们拿起了乐器。");
	text = text.replace("When they start, the tune is instantly catchy.", "当他们开始演奏时，曲调立刻朗朗上口。");
	text = text.replace("It\'s a stringed and horn orchestration, played alongside a large woman singing from both heart and belly.", "这是个由弦乐和号角构成的编曲，旁边一个从心底和腹中唱歌的壮硕女人演奏着它。");
	text = text.replace("She is a tempest of a singer, bringing both the quiet and ferocity of a large storm\'s coming and going, and her lyrics are that of incredible heroism of yore.", "她是一个暴风雨般的歌手，带来了暴风雨来了又去的平静和凶猛，她的歌词充满了昔日不可思议的英雄主义。");
	text = text.replace("After the troupe finishes, you ask how much you owe them.", "剧团演出结束后，你问他们该付多少钱。");
	text = text.replace("The mime shakes his head.", "哑剧演员摇了摇头。");
	text = text.replace("No, sir, payment is not necessary.", "不，先生，报酬不是必须的。");
	text = text.replace("It\'s been awhile since that got requested and it was a pleasure to play it for you.", "已经有一段时间没有人提出这样的要求了，很高兴为大家演奏这首歌。");
	
	text = text.replace("You order the troupe raided.", "你下令掠夺剧团。");
	text = text.replace("The mime, this time actually in character, holds up his hands and mouths \'what?\'.", "这个哑剧演员，这次是成了真的哑巴，举起他的手和张开了他的嘴说“什么？”。");
	text = text.replace(/But the playfulness is wiped away when (.*?) walks up and plants a punch right on his chin\./, "但当 $1 走上前一拳打在他的下巴上时，他的顽皮就消失了。");
	text = text.replace("The mime goes down with a catlike cry, mewling in the mud as he nurses his jaw.", "哑剧演员随着一声不敢太出声的惨叫而落下，用土涂在下巴上都做护理。");
	text = text.replace("The rest of the company knocks the troupe around while raiding their wagon for goods.", "战队的其余人员在掠夺剧团的载重货车寻找货物的同时把他们团团围住。");
	text = text.replace(/A juggler gets kicked right in the balls and a singer has her throat chopped by (.*?)\'s hand\./, "一个杂耍者的蛋被踢了，一个歌手的喉咙被 $1 用手砍了。");
	text = text.replace("The sword swallower tries to hide his sword the only place he knows where, but a mercenary retrieves it with a rather painful unsheathing.", "吞剑者试图把他的剑藏在只有他才知道的地方，但是一个雇佣兵用一个相当痛苦的方式把剑从那里取了出来。");
	text = text.replace("The firebreather drinks the entirety of his jug then asks if you want to take that, too.", "喷火者喝光了整瓶水，然后问你是否也想喝。");
	text = text.replace("You have him gut-punched for his snark.", "你一拳狠狠的打在他的鼻子上。");
	text = text.replace("When it\'s all said and done, there really isn\'t much to take as beating up jesters isn\'t the most profitable business.", "当一切结束，小丑是受伤最少的，因为痛打小丑得不到任何快乐。");
	text = text.replace("At least with a busted mouth maybe the mime will do his job better.", "被打破了嘴的哑剧演员或许能演得更好。");
	
	text = text.replace("You pay for a show which the troupe puts on quite well.", "你为剧团演得很好的一出戏付了钱。");
	text = text.replace("The jesters crack out some jokes, the jugglers juggle which is sorta old-hat but whatever, singers sing, swords get swallowed, fire \'breathed\', and the mime, well, he\'s godawful and you actually hope he dies.", "小丑会讲一些笑话，杂耍者玩杂耍，有点老掉牙，但不管怎样，歌手唱歌，吞剑表演，火被“呼吸”，还有哑剧演员，好吧，他糟糕的你真希望他去死。");
	text = text.replace("When it\'s all said and done, you do feel like you got your money\'s worth and the men are happy.", "当一切尘埃落定，你会觉得你的钱花得值，大家也会很开心。");

//travelling_monk_event.nut
	text = text.replace("You meet a monk on the roads and with him is a donkey-pulled cart, the poor draught animal carrying its head low in mute exhaustion.", "你在路上遇到了一个僧侣，跟着他的是一个驴拉的车，那个可怜的拖着车的牲口低着头，无声而疲惫。");
	text = text.replace("Broomstraw and virid moss are strung up to one side of the cart, both twisting eagerly in the very winds that dried them, and some pots and pans clatter like rustic windchimes as the modest wares come to a bumbling stop.", "刚割完的金雀花杆和碧绿的苔藓挂在车的一侧，两者都在将它们烘干了的大风中大幅度地弯曲着，一些壶和盘子相互碰撞着，听起来就像乡巴佬的风铃，好像是些朴实的货物笨手笨脚地停停走走。");
	text = text.replace("A barrel totters on the edge of the cart\'s bed and a couple of bees sway to keep up, poking and prodding at its cracks with thirsty curiosity.", "一个桶子在车板的边缘摇摇晃晃，一对蜜蜂摇动着来保持飞行，它们因极大的好奇心戳着桶的裂缝。");
	text = text.replace("The monk lifts a wool hat up out of his face but the lip of it folds back down over his eyes.", "僧侣把一顶羊毛帽从他的脸上拿起举高，但是帽檐直接叠进了他的眼睛里。");
	text = text.replace("He takes it off altogether and passes a sleeve across his brow.", "他马上把帽子全拿了下来，然后用袖子擦了擦他的眉毛。");
	text = text.replace("Carrying a jolly smile, he seems not at all disturbed by the veritable living armory standing before him.", "带着惬意的微笑，他似乎一点也没被面前货真价实的盔甲人打扰到。");
	text = text.replace("Evening gents. Don\'t s\'pose yer the kind to march b\'neath a lord\'s banner.", "晚上好先生们。不难看出你们并没有在一面贵族的旗帜下行军。");
	text = text.replace("Y\'look like sellswords t\'me.", "对我来说你们看起来像佣兵。");
	
	text = text.replace("Aye, I was thinkin\' you\'d ask.", "是，我已经想到你会问了。");
	text = text.replace("This here is Bessie, a cow\'s name for a donkey\'s arse.", "这是贝西，一头母牛的名字，但我给了这头蠢驴。");
	text = text.replace("Don\'t worry, she won\'t kick ye.", "别担心，她不会踢你的。");
	text = text.replace("She\'s all hawed-out, see?", "她很乖的，看到了吗？");
	text = text.replace("What she carry, well, that\'s beer.", "她带着什么，哦，那是啤酒。");
	text = text.replace("For men yonder, so that they may drink to men above.", "这是给那边的人的，这样他们就可以和更多的人喝酒。");
	text = text.replace("If ye don\'t mind, or if ye don\'t mind m\'business, I\'d like to get on where I be going.", "如果你不介意的话，或者你不在乎我的生意的话，我想继续向我该去的方向走了。");
	text = text.replace("The monk picks up the reins of his jenny as he readies to start moving.", "僧侣握紧了他的母驴的缰绳，他已经准备好要出发了。");
	
	text = text.replace("You hold your hand up, stopping the monk before he can get going again.", "你举起了你的手，在僧侣再次上路之前拦下了他。");
	text = text.replace("He sighs, slowly lowering the reins out of his hand.", "他叹了口气，慢慢地放下了手中的缰绳。");
	text = text.replace("Feeling as though he may be getting the wrong impression, you quickly ask if maybe he has beer to spare for your men.", "你感觉到他好像会错了你的意，因此你马上问他有没有些啤酒能够分给你的人。");
	text = text.replace("You are more than willing to pay.", "你很乐意付钱。");
	text = text.replace("The monk looks back at his stock for a moment, then turns around.", "僧侣回头看了看他的存货，然后转了过来。");
	text = text.replace("Aye. I give yer men a sip for a crown or two.", "行。我给你的人一小口一克朗，或者两口一克朗。");
	text = text.replace("Don\'t mind the bees \'round the top, they\'ll scurry when you come, but if you scurry when they scurry, they\'ll scurry after ya. Strange little gits.", "别在意绕着顶上转悠的蜜蜂，你来的时候它们很快就会跑了，但是如果当它们跑了的时候你跑了，它们就会快速地追着你跑。奇怪的小家伙。");
	text = text.replace("You ask the man how much he wants.", "你问他他想要多少。");
	text = text.replace("I\'d wager ten crowns a head will do.", "我觉得一个人十克朗就够了。");
	text = text.replace("I\'m no business man, though, I might be takin\' advantage of m\'self here.", "虽然我不是商人，但是在这我自己也想获利。");
	
	text = text.replace("You agree to pay the man what he\'s asked for and he opens his arm in invitation.", "你答应了给他付他要求的，他张开了双臂以示欢迎。");
	text = text.replace("Your men pop the lid off the cask and dip their cups in.", "你的人掀开了酒桶的盖子，把他们的杯子伸了进去。");
	text = text.replace("They come to sit in the shade, sipping tankards and exchanging beers.", "他们坐到了树荫下，抿着金属酒杯，并且交换着啤酒。");
	text = text.replace("The monk bids you a good farewell and the men all lift their cups to him in a loud, increasingly slurred cheer.", "僧侣向你道了别并且祝你好运，所有的人都举起了他们的酒杯，向他进行了一个大声的，连续不断而含混不清的致意。");
	
	text = text.replace("You hold your hand up, stopping the monk before he can get going again.", "你举起了你的手，在僧侣再次上路之前拦下了他。");
	text = text.replace("He sighs, slowly lowering the reins out of his hand.", "他叹了口气，慢慢地放下了手中的缰绳。");
	text = text.replace("Feeling as though he may be getting the wrong impression, you quickly ask if maybe he has beer to spare for your men.", "你感觉到他好像会错了你的意，因此你马上问他有没有些啤酒能够分给你的人。");
	text = text.replace("You are more than willing to pay.", "你很乐意付钱。");
	text = text.replace("The monk looks back at his stock for a moment, then turns around.", "僧侣回头看了看他的存货，然后转了过来。");
	text = text.replace("Aye. Damn it to hells if the gods wouldn\'t be happy with yer money crossin\' m\'palms.", "是啊。如果上帝不高兴我拿你的钱，那就去他的吧。");
	text = text.replace("If ye fight the good fight, then I bid you to take some for free, but not all of it of course.", "如果你打了一场好仗，那么我请你免费喝一些，但肯定不是全部。");
	text = text.replace("You thank the monk for his generosity and order you men to be modest with their drinking.", "你谢过了僧侣的慷慨，并且命令你的人喝的时候都诚实一点。");
	text = text.replace("As a few brothers circle around to the cask, the monk throws his hands up.", "当几个兄弟围在桶边的时候，僧侣举起了他的手。");
	text = text.replace("Don\'t mind the bees \'round the top, they\'ll scurry when you come, but if you scurry when they scurry, they\'ll scurry after ya. Strange little gits.", "别在意绕着顶上转悠的蜜蜂，你来的时候它们很快就会跑了，但是如果当它们跑了的时候你跑了，它们就会快速地追着你跑。奇怪的小家伙。");
	
	text = text.replace("As the cart waddles by, you take the pommel of your sword and bash it against the cask of beer, popping the lid off the top and sending a number of bees into a frenzy.", "当运货车摇晃着离开的时候，你握紧了你剑上的配重球，并且用它猛击啤酒桶，砸开了顶上的盖子，这让许多蜜蜂陷入了疯狂。");
	text = text.replace("The monk lets go of the reins as he looks back at you.", "当僧侣回头看你的时候，他放开了缰绳。");
	text = text.replace("T\'was afraid you\'d do that.", "我就担心你会那样做。");
	text = text.replace("The man disappears beneath a punch, his body twisting as he falls to the ground.", "他在被揍了一拳后消失了，他的身体在他掉到地面的时候扭成了一团。");
	text = text.replace("A few brothers converge on him for some good kicks while others lift the beer and take it to some shade.", "当其他人举起了啤酒，并把它们带到阴凉地的时候几个兄弟蜂拥过去给了他结结实实一顿踢打。");
	text = text.replace("You dip a mug into the cask for a drink then lift it to the monk writhing on the ground.", "你把一个马克杯伸进了酒桶以便于你喝酒，然后把它举向了在地上抽搐翻滚着的僧侣。");
	text = text.replace("Bottom\'s up lads, and let us not forget to thank our generous friend over there!", "喝光它们小伙子们，同时，别忘了谢谢我们那边慷慨的朋友！");
	text = text.replace("The monk turns over, eyes wincing as they rapidly blink.", "僧侣翻倒过来，呲牙咧嘴，眼睛不停地眨着。");
	text = text.replace("He\'s clutching his back with one hand while using the other to slowly get up.", "他用一只手捂着他的背，用另外一只手支持着他缓慢地站起来。");
	text = text.replace("With a bent posture, he takes the reins of the donkey and starts forward.", "他以一个弯曲的姿势握上了驴的缰绳，开始向前走。");
	text = text.replace("He tries to slip his hat back on but it falls away and he doesn\'t bother to go after it.", "他尝试再带上他的帽子，但是帽子掉了下来，他并没有花时间管它。");
	text = text.replace("The man grows small in the distance, blurred by horizon and alcohol alike, and then he is gone.", "他离得越来越远，因距离太远和酒精作用越发模糊不清，他走了。");
	text = text.replace("The men all lift their cups to you in a loud, increasingly slurred cheer.", "所有的人都举起了他们的酒杯，向你进行了一个大声的，连续不断而含混不清的致意。");

//troublemakers_bully_peasants_event.nut
	text = text.replace(/Entering (.*?), it isn\'t long until (.*?) is bothering the locals\./, "在进入 $1 后不久，$2 就开始骚扰当地人了。");
	text = text.replace("He\'s slapping buckets out of their hands and kicking women into the mud.", "他用手把他们手上的篮子打掉，把女人踹到泥地里去。");
	text = text.replace("When an old man confronts him, the sellsword draws out his weapon.", "当一个老人反抗他的时候，佣兵拔出了他的武器。");
	text = text.replace("Other peasants beg that you put a stop to this at once.", "其他农民请求你快点制止这一切。");
	
	text = text.replace(/You shrug\. (.*?) doesn\'t run the old man through, but he does threaten to, raising the weapon on high\./, "你耸耸肩。$1 并没有刺穿那个老人，但是他确实威胁要那样，他把他的武器举的高高的。");
	text = text.replace("When the old man cowers, the sellsword delivers a punch that knocks the elderly right out, his teeth peppering the muck like spits of white rain.", "当老人因恐惧而退缩时，佣兵直截了当的给了他一拳，老人的牙洒落在地上就像下了一场白色的雨。");
	text = text.replace("This brings a few jeers from the villagers, but they know not to contest your presence any further.", "这引来了村民们的嘲讽，但他们知道不应再跟你的部队进行任何争执了。");
	text = text.replace("A few men drag the elder away while children boo and women hiss.", "几个男人缓慢地拉起了老人，小孩和女人在一旁发出不满的嘘声。");
	text = text.replace(/One child even runs up to the sellsword, pointing at him as he yells \'he\'s a bad man\.\' (.*?) shrugs as he sheathes his weapon\./, "甚至有一个小孩跑到了佣兵的面前，边指边喊“他是个坏人。”$1 耸耸肩，把武器插入了鞘中。");
	text = text.replace("And yet the bad man still stands.", "那个坏家伙还在这呢。");
	text = text.replace("Would you also like a taste of the mud, little one?", "小家伙，你也想尝尝泥巴的味道吗？");
	text = text.replace("The kid quickly runs off.", "孩子马上跑开了。");
	
	text = text.replace(/As (.*?) raises his weapon on high, you grab him by the forearm and bring it back down\./, "当 $1 高举起他的武器的时候，你抓住了他的小臂，把它摁了下来。");
	text = text.replace("He swings around, looking at you sternly.", "他转了过来，死死地盯着你。");
	text = text.replace("The cowering old man backs off, soon collected by caretakers that shuttle him back inside before he gets himself hurt.", "那个吓坏的老人向后退去，然后被看门人们带走，带回了房子里面，在他让自己受伤之前。");
	text = text.replace("A few other peasants linger around, watching with keen interest.", "有几个其他农民长时间围在周围，抱着极大的兴趣看着热闹。");
	text = text.replace("You tell the sellsword to back down.", "你命令佣兵退下。");
	text = text.replace("He\'s paid to fight who you deem he should fight, not a bunch of peasants who are minding their own.", "他是被雇佣来应该和你的人战斗的，不是一群过着自己日子的农民。");
	text = text.replace(/As (.*?) glances around, you realize you\'ve left him no \'out\' that will save face\./, "当 $1 环顾四周时，你意识到你没有给他留下任何可以挽回面子的“机会”。");
	text = text.replace("In his eyes, there is a look that says he\'s about to kill you.", "他的眼神告诉你，他有想要杀了你的想法。");
	text = text.replace("It\'d be the end of him, but he\'d go out with his suicidal pride intact.", "那样的话他就完蛋了，他会和他那致命的骄傲一起完完整整地离开。");
	text = text.replace("But the look fades, and embarrassment and humiliation take its place.", "但是那种眼神马上消退了，尴尬和耻辱取而代之。");
	text = text.replace("He sheathes his weapon, spits, and remarks that he was only having some fun.", "他收剑入鞘，啐了一口，解释说自己只是想找点乐子。");
	
	text = text.replace("You look at the peasant who hailed you down.", "你看了看围在你周围乞求着的农民。");
	text = text.replace("Who are you, peasant, to tell me or my men what to do?", "你们是谁啊，农民，你们觉得你们可以告诉我的人或者我该怎么做？");
	text = text.replace("The man takes a step back, stammering something about \'only trying to help.\'", "农民后退了一步，结结巴巴地说他只是想帮忙之类的话。");
	text = text.replace("Laughing, you tell your men to take what they want.", "大笑着，你告诉你的人拿走任何他们想要的东西。");
	text = text.replace("If this village has no respect for the authority of armed men, then you will have to teach them that respect.", "如果这个村子对全副武装的人的权威没有任何的尊重，那么你将不得不教会他们尊重。");
	text = text.replace("Women scream and bundle up their children as the order leaves your tongue.", "当你的命令从嘴里吐出来的时候，女人们尖叫了起来并且抱紧了她们的孩子。");
	text = text.replace("They run off and a few men join them.", "她们跑开，有几个男人也加入了她们。");
	text = text.replace(/Other men stay behind, protecting their homes, but the (.*?) makes quick work of their modest defenses\./, "其他男人留在了后面，企图保卫他们的房子，但是 $1 迅速瓦解了他们简单的反抗。");
	text = text.replace("Your mercenaries are soon pillaging each and every home, taking what they can with roaring laughter.", "你的雇佣兵很快抢劫了每一户人家，在放声大笑中拿走了所有他们能拿走的东西。");
	text = text.replace("Today is a good day.", "今天是个好日子。");
	
	text = text.replace(/(.*?) places himself between (.*?) and the old man\./, "$1 站在了 $2 和老人之间。");
	text = text.replace("He shakes his head \'no\' in a very modest fashion, but you can\'t help but notice that his swordhand is also on the pommel of his weapon.", "他摇了摇头“不”，十分庄重，但你不禁也看到了他使剑的那只手也放在了他武器的配重球上。");
	text = text.replace("The troublemaking sellsword briefly seems to consider cutting the man down, but then a smile snaps across his face.", "那个制造麻烦的佣兵看上去有那么一瞬间想要把他砍倒，但是之后一个微笑浮现在了他的脸上。");
	text = text.replace("He laughs as he sheathes his weapon.", "他一边收入武器，一边笑了。");
	text = text.replace("Only having a bit of fun, my brother.", "只是找点乐子而已，我的兄弟。");
	text = text.replace(/The peasants slowly start going about their business again, but they are wary and stare side-eyed at your men for the rest of your duration in (.*?)\./, "农民们慢慢地重新开始他们的工作，但是他们依然充满了警惕，并且在接下来他们都会注意你的人，只要你还在 $1。");
	
	text = text.replace(/(.*?) steps in between (.*?) and the old man\./, "$1 走到了 $2 和老人之间。");
	text = text.replace("The troublemaking sellsword laughs and sheathes his weapon.", "那个制造麻烦的佣兵边笑边收起了他的武器。");
	text = text.replace("He turns back to the rest of the company, grinning and shaking his head, but you notice that this smile quickly fades.", "他回头走向了战队其余的人，一边咧嘴笑着，一边摇晃着他的头，但是你注意到了这笑容马上消失了。");
	text = text.replace(/Before you can say anything, (.*?) wheels a fist back around and knocks (.*?) out cold\./, "在你来得及说任何事之前，$1 转身无情地给了 $2 一拳，把他打倒在地。");
	text = text.replace("Well, that\'s one way to mollify a mercenary.", "好吧，那也算是一种安抚雇佣兵的方法。");

//uber_courageous_event.nut
	text = text.replace(/(.*?) carries a brand of courage one part fearless, one part craziness\./, "$1 带着勇气的烙印一部分来自胆量，另一部分来自疯狂。");
	text = text.replace("His urgency to throw himself against his enemies is inspirational, if no doubt foolish to a mind of reason and rationality.", "他给敌人带来的紧迫感将鼓舞人心，如果不去怀疑有理智和理性的头脑是愚蠢的。");
	text = text.replace(/But this is the (.*?), a band of men who are drawn to the simple life of sword and coin\. (.*?)\'s indomitable nature in this struggle of kill or be killed has rubbed off on a few of the sellswords\./, "但这就是 $1，一群被剑与金钱的简单生活吸引的人。$2 不屈不挠的天性已经在为了杀与被杀斗争的佣兵生活中消磨掉了。");

//walkers_bond_event.nut
	text = text.replace(/Men of the road, (.*?) and (.*?) share stories of their travels with one another\./, "四处漂泊中遇到路人，$1 和 $2 分享他们的旅行经历。");
	text = text.replace("You don\'t really understand what\'s so rich about walking about, but the two men do bond over their tales and that\'s good enough for you.", "你并不真正了解到处旅行有什么好处，但这两个人的经历让你受益良多，这对你来说已经足够好了。");
	text = text.replace(/(.*?) and (.*?) have seen much of the world\./, "$1 和 $2 见过大千世界。");
	text = text.replace("They\'ve spent years on the road, and now they\'re telling tales of those years to one another.", "他们花了好几年的时间四处漂流，现在他们相遇，互相讲述那些年的奇遇。");
	text = text.replace("Their appreciation for each other rises, and your appreciation for not listening to boring travel stories also increases.", "他们互相吹牛的同时，心心相惜之感与日俱增，精彩绝伦的故事让你激动异常。");
	text = text.replace("Most men find the task of walking about to be pretty simple, but men who do little else but walk about find more interest in the affair.", "大多数男人都觉得旅行很单调无聊，但总有那么一些人认为旅行乐趣无穷，以至于他们一直在前进的路上。");
	text = text.replace("Unsurprisingly, (.*?) and (.*?) have come to bond of their tales of... walking around.", "不出所料，$1 和 $2 已经把他们的…经历联系在了一起。");

//wardogs_fight_each_other_event.nut
	text = text.replace("A series of barks followed by muted growling interrupts your work.", "一连串的狗吠声，接着是压抑的低吼，打断了你的工作。");
	text = text.replace(/You leave your tent to see that the two wardogs, (.*?) and (.*?) are fighting\./, "你离开帐篷看见两条战犬，$1 和 $2在打架。");
	text = text.replace("They\'ve locked their jaws onto the nape of each other\'s necks.", "他们咬在一起争锋相对谁也不让谁。");
	text = text.replace("A few brothers try to intervene, but every time they do the wardogs briefly separate and snap at the humans as if to say this fight is between them and them only.", "几个队友试图劝架，但每次当他们出手干预时，战犬就会短暂分开同时向劝架的人咆哮，好像在说这是它们之间的战斗，谁也不许插手。");
	text = text.replace("You elect to stand back and let nature take its course.", "你选择后退一步不去干预它，顺其自然。");
	text = text.replace("Once the dust settles, you step forward to see how everything shook out.", "等到战斗结束，分出胜负，你再视情况而定。");
	text = text.replace(/You yell at (.*?) to separate the two wardogs\./, "你冲着 $1 喊把那两条狗分开。");
	text = text.replace("He takes up a long stick and lowers it into the furred and furious melee.", "他拿起一根长棍子，捣进激烈的混战中，试图把它们分开。");
	text = text.replace("The dogs yelp as the metal comes between them.", "当棍子夹在混战的两狗中间时，它们大叫起来。");
	text = text.replace("One takes hold of the pole-handle and rips it forward, dragging the brother into the fray.", "其中一只咬住了棍子一头，把它往前一扯，那个可怜的劝架队友被拖进了战场。");
	text = text.replace("Man and beast blur together as all three fight for their own survival, each taking turns at fighting off the other.", "人和兽混战着，都在为自己拼命。");
	text = text.replace("As the dust settles, you take stock of who or what is still standing.", "当战斗结束，你在估算谁还会活着。");
	text = text.replace("Unfortunately, both dogs passed away.", "不幸的是，两条狗都死了。");
	text = text.replace("They died with bloodied fur clenched in their jaws, each one sharing a sum of both victory and defeat.", "它们死的时候，嘴上咬着血淋淋的皮毛，每个人都分享着胜利和失败的经验。");
	text = text.replace(/You have (.*?) bury the bodies lest their smell attract even angrier beasts\./, "你让 $1 埋葬它们的尸体，以免尸体的气味引来愤怒的野兽。");
	text = text.replace(/The battle over, you have (.*?) take a look at the wardogs\./, "战斗结束后，你让 $1 看看战犬。");
	text = text.replace("They growl as he approaches, but that\'s all they got to muster for the fight has been kicked out of them.", "当他走近时，它们咆哮着，但没有进一步动作，它们早已斗到精疲力尽。");
	text = text.replace("He reports on a few broken teeth and they each got a bit of a limp, but they ain\'t lame.", "他报告说，狗儿有几颗牙齿坏了，每只都有点瘸了，但它们不是真的瘸了。");
	text = text.replace("In time, they\'ll be good as new for fighting.", "随着时间的推移，他们会变得像没瘸的一样能够战斗。");
	text = text.replace("Hopefully, just not fighting one another...", "我希望，别再打架了…");
	text = text.replace("One wardog limps off from the melee, leaving behind a dead mutt.", "一只战犬一瘸一拐地从混战中逃离，留下一只死狗。");
	text = text.replace("That the winner did not even eat or try to eat the loser shows all you need to know about these animals\' namesake.", "胜利者甚至没有吃或尝试吃失败者，这表明你需要重新认识一下这些动物。");
	text = text.replace(/You have (.*?) take care of the survivor while a few other brothers bury the body of the departed\./, "你让 $1 照顾活下来的狗，而其他几个兄弟埋葬死狗的尸体。");
	text = text.replace(/(.*?) manages to separate the two wardogs before they kill one another\./, "$1 设法在这两条狗互相残杀之前将它们分开。");
	text = text.replace("Unfortunately, he paid a price heavy with bites and scratches.", "不幸的是，他付出了沉重的代价。");
	text = text.replace("He\'ll survive, but you can\'t help but notice that he\'s very skittish and wary of the dogs now.", "他会活下来，但你发现他现在对狗充满戒备。");
	text = text.replace(/You order (.*?) the houndmaster to do something\./, "你就命令驯兽师 $1 做点什么阻止它们。");
	text = text.replace("He nods and steps forward, calmly walking between the two fighting dogs.", "他点头，向前走去，平静地走在两只斗狗之间。");
	text = text.replace("They bark and snap at each other, but both pause to eye the man coming in.", "它们互相吠叫，互相攻击，但两狗都停下来看着进来的人。");
	text = text.replace("One growls, but does in fact sit down.", "一只在咆哮，但实际上慢慢坐下。");
	text = text.replace("The other backs up, its tail wagging furiously, but there\'s still fire in its eyes.", "另一只后退了，它的尾巴拼命地摇着，虽然它任然有怒气。");
	text = text.replace("The houndmaster crouches down and pets them both on the head.", "那驯兽师蹲下来，摸摸狗头。");
	text = text.replace("One mutt lowers itself, and the other follows suit.", "一只狗低下头，另一只跟着。");
	text = text.replace("The man slowly brings the dogs together, practically touching noses, and then whispers to them both.", "他慢慢地把两只狗拉在一起，先摸了摸鼻子，然后低声对它们说。");
	text = text.replace("Slowly, but surely, the bestial energy leaves the dogs and their softened dispositions seem more fit for watching children than fighting in a mercenary band.", "慢慢的，不错所料，狗的狂暴因子消失了，它们的温顺的性情似乎更适合看孩子，而不是在一个铁血交织的雇佣兵团战斗。");
	text = text.replace("The houndmaster gets back up and the dogs happily follow him. He nods.", "驯兽师站了起来，狗很高兴地跟着他。他点头。");
	text = text.replace("Just a small row between dogs, heh.", "哈哈，只是狗儿之间的小吵闹。");
	text = text.replace("He walks off while the rest of the company looks on slackjawed, as if they\'d just watched some kind of procession of druidic sorcery.", "他说完就走了，而队伍里的其他人惊掉下巴地看着他，就像是看到一种德鲁伊魔法。");

//warriors_death_event.nut
	text = text.replace(/The battle over, you look around at the destruction it had wrought\. (.*?) is on his back, staring blankly at the skies with glazed eyes\./, "战争结束后，你看看它所造成的破坏。$1 仰卧在地上，眼睛呆滞地盯着天空。");
	text = text.replace("Other brothers litter the battleground.", "其他兄弟残肢飞的到处都是。");
	text = text.replace("They are ill-shaped, ragged, fractured and fragmented and soon fermented.", "它们形状畸形，破碎不堪，支离破碎，很快就会发臭。");
	text = text.replace("It is a collectively cruel end.", "这是一个大型绞肉机现场。");
	text = text.replace("And now the flies are gathering, dotting the dead like skittering moles.", "现在苍蝇聚集在一起，像只小鼹鼠似的盯着死去的人。");
	text = text.replace(/They copulate on cold skin with shameless abandon and set about burrowing the next brood in the still-warm gore\. (.*?) walks up and asks what it is you wish to do with the bodies\./, "他们以不知羞耻的方式在冰冷的皮肤上交配，并开始在温暖的血河中产卵。$1 走上前问你，那些尸体怎么办。");
	text = text.replace("You take a look up at the skies.", "你抬头看看天空。");
	text = text.replace("Crows and archcrows circle overhead.", "乌鸦和秃鹫在头顶盘旋。");
	text = text.replace("They squall and sqwuak and bicker amongst one another as they await your departure.", "当你离开的时候，他们就会呼啸而至，叽叽喳喳，开启盛宴。");
	text = text.replace("Sheathing your sword, you nod at the battleground.", "你放下你的剑，点头示意了一下战场。");
	text = text.replace("Loot the bodies. Leave the dead to the birds.", "收拾战利品，然后把死人留给鸟。");
	text = text.replace("You nod toward the dead.", "你向死者点头致意。");
	text = text.replace("Those were some fine men and fine men get a fine burial.", "那些死去的都是不错的好人，好人就应该有好的葬礼。");
	text = text.replace("We\'ll honor them just as we should: a good hole to sleep in, crowns which they can spend in the next world, and a feast to celebrate.", "我们会向他们致以崇高的敬意：一个可以睡觉的好地方，足够他们在天堂使用的克朗，和一次盛大的庆祝宴会。");
	text = text.replace("I\'d expect the same to be done for me!", "我也希望死后能得到同样的待遇！");
	text = text.replace("The surviving men cheer and begin preparations.", "活下来的人欢呼并开始准备。");
	text = text.replace(/You assign the duty of burials to (.*?), a man well-practiced for this particular trade\./, "你把埋葬的任务分配给 $1，他在这个行业里很有经验。");
	text = text.replace("It doesn\'t take him long to shovel perfectly squared holes into the ground.", "他一会儿就在地上挖了一个足够大的方坑。");
	text = text.replace("He wraps the bodies in linens before carefully placing them into their final rests.", "他把尸体用亚麻布包起来，然后才小心地放在挖好的墓穴里。");
	text = text.replace("When it\'s all said and done, the graves lay across the ground as though they were an earthly fenceline knocked astray.", "当这一切说到做到的时候，坟墓就建好了，仿佛是栅栏被破坏了插在地上。");
	text = text.replace(/Each mound of dirt has a stake before it with the dead brother\'s name carved into the wood\. (.*?) stands his shovel and tents his hands on the handle\./, "每堆土都有一根木桩，木头上刻着死去的兄弟的名字。$1 把铲子插在地上，双手搭在把手上。");
	text = text.replace("He nods at his work.", "他对自己的工作满意地点头。");
	text = text.replace("They\'re in deep.", "他们埋得很深。");
	text = text.replace("The man spits.", "那人吐了口唾沫。");
	text = text.replace("Only thing after \'em now be the worms.", "现在能打扰你们的只有虫子了。");
	text = text.replace("Hope that don\'t bother ya - but anywhere a man goes once he\'s dead there be a mouth in need of new feed.", "他们说人一旦死了，无论到哪里都有一张嘴需要食物。");
	text = text.replace("Lest you burn the bodies, I s\'pose, but they say even then the spirits have their licks.", "恐怕你烧了尸体，我摆了个姿势，但他们说即使这样，灵魂也会有舔食的感觉。");
	text = text.replace("Snortin\' smoke is a spirit\'s spice or some such thing.", "即使这样也有像吸入烟雾一样的灵魂食物，或者诸如此类的东西。");
	text = text.replace("Picking up his shovel, the gravedigger turns and leaves as though both his work and words were but dreams upon dreams.", "拾起铁锹，掘墓人转身离去，仿佛他的工作和言语都只是梦中的梦。");

//wildman_causes_havoc_event.nut
	text = text.replace(/Civilization is no place for a wildman like (.*?) and he quickly proves it\./, "城市文明是不适合像 $1 的野人的，他很快就证明了这一点。");
	text = text.replace("Apparently, the damned man went crazy while in a shop and trashed the whole place.", "显然，那该死的乡巴佬在商店里发疯了，他把整个地方弄得乱七八糟。");
	text = text.replace("As the story goes, he just walked in and started taking things, not quite understanding the social norms of paying for goods.", "正如之前所想的，他只是走进来，开始拿东西，却不太了解购买商品的社会规矩。");
	text = text.replace("The shop owner then came after him with a broom, trying to shoo the man out of his store.", "店主拿着扫帚追赶他，想把他赶出商店。");
	text = text.replace("Believing the broom a monster, the wildman proceeded to go completely crazy.", "野人从没见过像扫帚这样的怪物，于是他完全疯狂了。");
	text = text.replace("Judging by the reports, it was quite the commotion, up to and including shite throwing.", "从报告来看，当时相当混乱，包括野人把他的屎丢的满天飞。");
	text = text.replace("Now the shop owner is in your face demanding compensation for the damage done.", "现在店主当着你的面要求赔偿所造成的损失。");
	text = text.replace(/Apparently he\'s wanting (.*?) crowns\./, "很明显，他想要 $1 的补偿。");
	text = text.replace("Behind him, a few town militia stand with very watchful eyes.", "在他身后，有几个城镇的民兵站在那里，个个眼里闪着警觉的光芒。");
	text = text.replace("You push the shop owner away, telling him that you owe nothing.", "你一把推开店主，并告诉他，你什么都不欠他的。");
	text = text.replace("When he jumps forward again, your hand deftly moves to the pommel of your sword, stopping the man in one swift motion.", "当他再次向前跳的时候，你的手灵巧地摸向你的剑鞘，店主迅速停止了他的挑衅动作。");
	text = text.replace("He raises his hands up, nodding as he backs off.", "他举起双手，一边后退一边点头。");
	text = text.replace("A few townspeople see this and skirt by, trying to avoid your gaze.", "有几个镇上的人看到了这个情况，眼神躲闪的避开你的目光。");
	text = text.replace("The militiamen notice, but they seem uncertain on whether to take action or not.", "民兵注意到了这边的情况，但他们似乎不确定是否对此采取行动。");
	text = text.replace("You go and see the shop.", "你去看了看商店。");
	text = text.replace("The wildman truly did a number on the place..", "那个野人真的在这个地方拉屎。");
	text = text.replace("And it reeks of his... scent.", "还有他的味道…气味。");
	text = text.replace("It would be a bad look for the company to not handle this issue with great care.", "如果队伍不能非常小心地处理这个问题，那将会很糟糕。");
	text = text.replace("You agree to pay for the damages, something most mercenary bands would not have done.", "你同意赔偿损失，这是大多数雇佣兵团不会做的。");
	text = text.replace("This act of kindness does not slip the townspeople by.", "这种善意的行为能稳定城镇秩序，不会让镇上的人因混乱逃离。");
	text = text.replace("Surveying the damage, you agree to compensate the businessman.", "调查损失后，你同意赔偿商人。");
	text = text.replace("But this isn\'t your fault, it\'s the wildman\'s.", "但这不是你的错，是野人的错。");
	text = text.replace("You dock his pay: for some time to come, the mercenary\'s earnings will be halved.", "你扣他的工资：在将来的一段时间里，这个雇佣兵的收入会减半。");
	text = text.replace("Furthermore, you take what earnings he\'s made and hand them over to the shop owner.", "而且，你会把他挣的钱拿去交给店主。");
	text = text.replace("It doesn\'t even begin to cover the damages, but it\'s a start.", "它甚至根本不够赔偿损失，但它是一个开始。");
	text = text.replace("One man is left happy, and another quite disgruntled.", "一个人很高兴，而另一个人很不高兴。");
	text = text.replace("You tell the wild cretin that now he\'ll think twice about smearing shit all over someone else\'s walls.", "如果你问那个白痴，他现在是否会重新考虑在别人的墙上涂上屎。");
	text = text.replace("But the wildman doesn\'t seem to understand you.", "但是野人似乎无法理解你。");
	text = text.replace("He just understands that the gold he once owned has been given to someone else, and he eyes its departure with sadness and bottled anger.", "他只知道，他曾经拥有的金子已经给了别人，他看着这些的离去而悲伤和愤怒。");
	text = text.replace("While leaving town, you hear a bark over your shoulder.", "当你离开小镇的时候，你听到你身后的吠声。");
	text = text.replace("But it is from no dog: you turn \'round to find a number of militiamen converging on the road, fanning out from homes and shops.", "但这不是狗干的：你转过身去，发现有一群民兵聚集在路上，他们从家里和商店里陆续出来。");
	text = text.replace("They say you did that businessman wrong and they won\'t be having your kind in a place like this no more.", "他们说商人那件事你做错了，他们不会再让你这样的人住在这个地方了。");
	text = text.replace("You can either pay up right now, or they\'ll take it from you by force.", "你要么现在就把钱付清，要么他们就会用武力把钱拿走。");
	text = text.replace("The men before you are weak and frail, a force cobbled together out of the meek and downtrodden.", "在你们面前的，是从镇子中的软弱，谦卑，被欺压的人中拼凑出来的有力量的人矮子中的高个。");
	text = text.replace("Nowhere in their ranks is the actual businessman you had trouble with.", "在他们的队伍中没有一个是对你有麻烦的大商人。");
	text = text.replace("While you admire their tenacity, you can\'t quite bring yourself to slaughter half a town over a rather small affair.", "虽然你钦佩他们的坚韧，但你不能因为一件小事而去杀戮半个城镇。");
	text = text.replace("You reach to your side, drawing a few gasps from the poorly armed crowd of men, only to return your hand with a purse in its palm.", "你伸手摸向你的身后，那群武装不济的人中有几个倒抽一口冷气，结果你手里却提溜一个钱包，你把钱包丢给他们，收回手");
	text = text.replace("A deal is struck and the compensation is paid.", "一笔交易达成了，赔偿也支付了。");
	text = text.replace("The townspeople are relieved, though a few of the men are not so happy about backing down from a fight.", "虽然有些人不太愿意放弃战斗，但是大部分镇上的人都松了一口气。");

//wildman_finds_something_event.nut
	text = text.replace(/While trying not to lose your temper at just how many low-hanging branches are catching you in the face, (.*?) hurries to your side and says (.*?) the wildman has run off\./, "当你试着不要因为有许多根低垂的树枝刮到了你的脸而发脾气时，$1 他赶紧跑到你身边说野人 $2 跑了。");
	text = text.replace("You turn round to see the rest of the men looking as confused as you are.", "你转过身去看到其他人和你一样困惑。");
	text = text.replace("Holding your fist up to quiet the company, the forest returns your order of silence with muted chirps of distant birds and the buzz of a bee or wasp somewhere unseen.", "举起你的拳头让队伍安静下来，森林不远处鸟儿的若有若无的叫声和蜜蜂或黄蜂的嗡嗡声在你的沉默中清晰可闻。");
	text = text.replace("Shaking your head, you decide to continue the march.", "摇摇头，你决定继续前进。");
	text = text.replace("A few hours later, the wildman jumps out of a bush you were about to cleave with a machete.", "几个小时后，野人从你准备用大砍刀砍开的灌木丛后跳出来。");
	text = text.replace("He\'s got an armful of random items in hand.", "他手里拿着一大堆稀奇古怪的东西。");
	text = text.replace("Where he got these things, you\'ve no idea, but you have the men sift through the findings. (.*?) returns to rank as though nothing happened at all.", "你不知道他是从哪里得到这些东西的，但你让人仔细检查了这些战利品。$1 回到队伍中，就像什么都没发生一样。");
	text = text.replace("You glance at the man and catch him staring at a butterfly on his finger.", "你瞥了他一眼，发现他盯着停在他手指上的一只蝴蝶。");
	text = text.replace(/When you glance at him again, the butterfly is gone and the man is swallowing something\. (.*?) gives you a report on what he brought\./, "当你再撇他一眼的时候，蝴蝶不见了，那人正在吞东西。你的下属 $1 正向你报告他带来的东西。");

//wildman_offers_mushrooms_event.nut
	text = text.replace("You take a rest at the base of an enormous tree.", "你在一棵大树底下乘凉。");
	text = text.replace("Somehow, the sun manages to sear a path through the forest canopy and blind your eyes.", "不知何故，一束阳光从树顶穿透重重树叶缝隙照耀到你的眼睛。");
	text = text.replace(/Getting up to move, you run into (.*?) the wildman\./, "你遇到了野人 $1 站起来活动了下身子。");
	text = text.replace("He\'s offering you a handful of various questionables: mushrooms, flower petals, berries.", "他拿了一把各种各样的东西：蘑菇、花瓣、浆果。");
	text = text.replace("With a grunt, he ushers them toward your face.", "放到你面前问你要不要。");
	text = text.replace("Surprisingly, the bits of forest foods are actually quite good.", "令人惊讶的是，这些森林食物实际上相当不错。");
	text = text.replace("Sweet, but not too sweet, and with a hint of oak.", "甜，但不太甜，并带有一丝橡木的味道。");
	text = text.replace("You thank teh weeldman fore his gift.", "你要感谢野人的礼物。");
	text = text.replace("He rises hyyy into the skies, the skies of all things, shaking what are noww braanches you had earlier mistakenly assumed were human arms of humane purposes.", "他把双手高高举起，摇晃着你早先错误地认为是人类出于人道目的的武器的现在的树枝。");
	text = text.replace("Cats rain from his mouth as he speaks.", "他和你开口说话时，许多彩虹猫猫从他嘴里欢跳而出。");
	text = text.replace("His tongue is a leenguage of marbled letters, floating before his lips innn.. innn... in great sighs for sentences.", "他的舌头吐出一串晦涩难懂的古老词汇，在他的嘴边…嘴边…嘴边飘动着。拖出一声长长的叹息。");
	text = text.replace("Feeling good about his graces, you give him a weave, a wave of yer hand, but find yer fingers are also hands, something you had not noticed in the befores.", "你对他的这些把戏很满意。于是向他挥一挥手，但发现你的每根手指也是一只手，你竟然以前从来都没发现。");
	text = text.replace("A shock to your beliefs, yer memories of childhood flooded with fleeting feet rocking yer crib, yer domain, yer castle.", "你的信仰受到了巨大的的冲击，你童年的记忆充斥着飞逝的脚步，摇曳着你的婴儿床，你的领地，你的城堡。");
	text = text.replace("All lies. All of it! Blackness comes. The darkness smiles.", "都是假的。所有的一切！黑暗降临了。深渊在微笑。");
	text = text.replace(/You awake on the ground, (.*?) gently dabbing a rag of water over your forehead\./, "你醒了躺在地上，$1 轻轻地用一块湿毛巾擦着你的额头。");
	text = text.replace("He\'s back! You alright?", "他醒了！你还好吧？");
	text = text.replace("You can\'t quite remember what happened, but your mind is desperately telling you not to ask.", "你不太记得发生了什么事，但你的理智却在拼命地告诉你不要问。");
	text = text.replace("You simply nod in response and get the men back to marching.", "你只是点头回应，然后带着你的人继续前进。");

//wildman_testing_money_event.nut
	text = text.replace(/You find (.*?) the wildman stacking his crowns into towers\./, "你发现野人 $1 把他的克朗堆成塔。");
	text = text.replace("He leans back from his moneyed manifestations with a wide grin, but then suddenly launches forward, knocking the towers over like a child would their blocks.", "他嘴角微微向后一咧，突然间向前冲去，撞倒了塔就像一个小孩一样。");
	text = text.replace("He laughs maniacally as the coins scatter.", "硬币散去的同时，发出大笑声。");
	text = text.replace("The man playing with his money is a curious sight.", "一个大人像小孩一样玩钱真是太怪了。");
	text = text.replace("Perhaps the wildman has no real conception of what crowns are good for?", "也许那个野人不知道克朗的可爱之处？");
	text = text.replace("If so, maybe... maybe you could take them back?", "如果是这样，也许…也许你可以把它们拿回来？");
	text = text.replace("You crouch down.", "你蹲下来。");
	text = text.replace(/Hey there (.*?)\. Mind if I take one of these\?/, "嗨，$1 介意我拿一个吗？");
	text = text.replace("Carefully, you pick up a coin and measure the wildman\'s reaction.", "你双眼盯着野人，小心翼翼地拿走一枚硬币。");
	text = text.replace("He shrugs and grunts as if to say \'it\'s yours\'.", "他耸耸肩，咕噜着好像在说“它是你的”。");
	text = text.replace("You take another crown. And then another.", "你拿走了另一枚克朗。然后再一枚。");
	text = text.replace("The wildman glares at you, but you slowly produce a stick with a frilly bow tied to the top.", "那野人瞪着你，但是你缓缓从身后拿出一根绑着皱巴巴蝴蝶结的棍子。");
	text = text.replace("Its whirly nature captures the wildman\'s eye.", "野人的目光牢牢的被它吸引。");
	text = text.replace("When he reaches out for it, you draw it back and shake your head.", "当他不由自主地伸出手去触碰棍子时，你缩回棍子，摇摇头。");
	text = text.replace("You then point at the crowns, and then at the stick.", "你指了指那堆克朗，再指了指棍子。");
	text = text.replace("One for the other, yes?", "我一个换你一堆这很公平，你同意吗？");
	text = text.replace("The wildman looks at his crowns, mulling them over like an accountant, but you know his thoughts are far more chaotic than that.", "野人看了看那堆克朗精明的就像一个会计一样仔细思考，但是你知道他的内心要远比表现出来的混乱的多。");
	text = text.replace("Suddenly, he growls and pushes his crowns forward and takes the stick away from you.", "突然，他咆哮着把他的克朗往前一推，然后拿走棍子。");
	text = text.replace("Looks like the trade is done.", "貌似交易结束了。");
	text = text.replace("You crouch down and look at the mess of crowns.", "你蹲下来看着那堆乱糟糟的克朗。");
	text = text.replace("Those are real shiny, huh?", "这真美啊，哏？");
	text = text.replace("The wildman grunts and tries to shoo you away.", "野人哼了一下，想把你赶走。");
	text = text.replace("Resisting, you pick up a crown.", "你反抗了一下，并拿走了一枚克朗。");
	text = text.replace("His hands drop and he jerks his head up, glaring at you.", "他松了松指骨，扭了扭脖子，发出嘎达噶达的声音。");
	text = text.replace("Slowly, you put the coin down and then produce a stick with a string wrapped around its top.", "怒视着你，慢慢地，你放下硬币，从身后拿出一根顶部缠有绳子的棍子。");
	text = text.replace("His stare slackens, the sturdy stick a slick treat to the unkempt wildman.", "野人的目光柔和下来，结实的棍子对于那个蓬头垢面的野人来说如此的精巧迷人。");
	text = text.replace("You motion that you\'ll give it to him in exchange for the crowns.", "你提议把它给他以换取克朗。");
	text = text.replace("He takes the stick.", "他拿走了棍子。");
	text = text.replace("You take the crowns.", "你拿走了克朗。");
	text = text.replace("But when the wildman plays with the string, it falls off and blows away in the wind.", "但当野人玩弄绳子时，它脱落了，并被风吹走。");
	text = text.replace("He cries out, then stares murderously at you, yourself standing there with both arms barreled to try and hold all the crowns.", "他大声叫着，然后恶狠狠地盯着你，你站在那里，双手试图抓住所有的克朗。");
	text = text.replace("The wildman screams. You drop the crowns and run as fast as you can.", "野人在尖叫。你不得不把克朗放下，撒腿就跑。");
	text = text.replace("There is all manner of chaos going on behind you - tools and weapons being broke, brothers running for their lives, and the absolute bedlam of a bunch of confused men beset by a wildman - but you dare not look.", "你们身后发生了各种各样的混乱－工具和武器都被打破了，兄弟们都在逃命，被野人包围的一群可怜的人完全陷入了混乱－但是你们不敢看。");

//witch_being_burned_event.nut
	text = text.replace(/You stroll into (.*?) just in time to see a smoldering body keel forward from the blackened stake onto which they were tied\./, "你漫步到 $1 那里，正好看见一具焦黑的尸体，尸体从黑木桩上微微前倾。");
	text = text.replace("A few citizens pass you, cheering the death of a witch.", "几个市民从你身边经过，正为一个女巫的死欢呼。");
	text = text.replace(/Curious as to whether or not this was true, your very own witchhunter, (.*?), goes to the body and examines it\./, "女巫猎人，$1，好奇这是否是真的，她上去检查它的身体。");
	text = text.replace("With a sigh, he looks back at you and shakes his head.", "叹了口气，回头看着你，摇了摇头。");
	text = text.replace(/(.*?) welcomes you with horrifying screams\./, "$1 的人们用可怕的尖叫声欢迎你。");
	text = text.replace("Three of its citizens are in the town center being burned alive.", "三名市民在市中心被活活烧死。");
	text = text.replace("The fires grow beneath them until the flames come licking their feet, then crawling up their legs, drawing them to cry out for mercy to which the crowds responds by throwing rocks.", "火在他们的附近地面蔓延，直到火焰来舔他们的脚，然后爬上他们的腿，他们大声呼喊救命希望人们怜悯，人们却用投掷石块来回应。");
	text = text.replace(/You about draw your sword to end this injustice when (.*?) the witchhunter stays your hand\./, "当你打算是否拔出你的剑来结束这种不公正时，女巫猎人 $1 拉住了你的手。");
	text = text.replace("He shakes his head and points at the burnings.", "他摇摇头，指着燃烧的人。");
	text = text.replace("Soon enough, the begging stops and all three victims open their mouths, issuing forth a rumbling that silences the crowd and even the crackle of fire beneath them.", "很快乞求声停止了，三个受害者张大嘴巴，发出轰隆隆的声音，人群安静下来，火光倒映在人们脸上。");
	text = text.replace("They speak in a guttural, uniform voice.", "他们用喉音统一的声音说话。");
	text = text.replace("Ye who watches us perish, shall perish themselves!", "你们这些看着我们灭亡的人，将自我毁灭");
	text = text.replace("The bodies suddenly slump forward as though instantly made dead and the cooking of their flesh resumes with a steady popping.", "说话的人的身体突然往前倒，好像一下子就死了，烤肉的声音滋滋滋的响着，不断变小。");
	text = text.replace("The witchhunter orders your men to look away, which you quickly do, and behind you comes renewed screams, but this time from the townspeople themselves.", "女巫猎人命令你的人把目光移开，你很快就会看到，在你身后又有新的尖叫声，但这次是镇上的人自己发出的。");
	text = text.replace("You shant forget this moment anytime soon.", "你很快就会忘记这一刻的。");

//witchhunter_ghoul_teeth_event.nut
	text = text.replace(/(.*?) the witch hunter comes to you with a vial of unknown liquid\./, "$1 女巫猎人带了一小瓶未知的液体来找你。");
	text = text.replace("Anti-poison.", "解毒剂。");
	text = text.replace("He explains. He pops the cork off and gives you a smell.", "她解释。她拔掉软木塞，给你闻了闻。");
	text = text.replace("There\'s a strong scent of piss. He nods.", "有一股强烈的尿臭味。他点头。");
	text = text.replace("Aye, it\'s wretched, but you need the wretched to fight the wretched, and a goblin\'s poison is a real wretched matter to contend with.", "是的，它很恶心，但是你需要恶毒的人去和恶毒的人战斗，而哥布林使用毒药是一件非常恶心的事情。");
	text = text.replace("But this will help.", "但这解药会有所帮助。");

//wound_gets_infected_event.nut
	text = text.replace(/You discover (.*?) passed out in the grass and there\'s no mead or ale beside him as a sort of coma culprit\./, "你发现 $1 昏倒在草地上并且他旁边没有该死的致使人昏迷的蜂蜜酒和麦芽酒。");
	text = text.replace("Crouching down, you see that his eyes are dimmed and he does not respond to questions.", "你蹲下来，看见他两眼无神，口不能言。");
	text = text.replace("His chest rises and falls to uneven breathing.", "他的胸口起伏不定，呼吸不匀。");
	text = text.replace(/You peel back the dressings over his (.*?) to reveal green, sickly flesh\./, "你剥掉他一半伤口上的敷料 $1，露出绿色，病态的腐肉。");
	text = text.replace(/(.*?) is laughing with the rest of the men when he suddenly falls over with his eyes going to the back of his head\./, "$1 当他两眼翻过去人朝后倒的时候，他正与旁边休息的人一起大笑。");
	text = text.replace("The rest of the men rush to his aid.", "其余的人看见了，都去帮他急救。");
	text = text.replace("Sir, his wound\'s beyond sore.", "先生，他的伤口在溃烂。");
	text = text.replace(/The flesh around his (.*?) has gotten pulpy, slathered with dead skin and the pulsing viridian of infections ready to be sloughed off\./, "他伤口 $1 周围的肉在浮肿，死皮和病毒感染的腐肉需要被清除。");
	text = text.replace(/(.*?)\'s (.*?) has gotten infected\./, "$1的 $2 伤口已经被感染了。");
	text = text.replace("The flesh around the injury is black and that which has color is green, both very bad signs.", "伤口周围的肉是黑色的，有的是绿色的，都是非常不好的迹象。");
	text = text.replace(/Infection is settling into (.*?)\'s (.*?)\. There\'s no saying if he\'ll survive or not, but either way he\'s going to be in bad shape for a time\./, "感染已经进入了 $1的 $2 伤口。我不知道他能不能活下来，但无论如何，他都会有一段时间状态不佳。");
	text = text.replace(/You come to find (.*?) leaning against a tree\./, "你发现 $1 他靠在一棵树上。");
	text = text.replace("He\'s shaking and saliva is dropping from his lips.", "他在发抖，口水从嘴里流出来。");
	text = text.replace(/I\'m alright, sir\. My (.*?)\'s just\.\.\. a little infected\./, "我很好，先生。我的伤口 $1 只是…有点感染。");
	text = text.replace("Give me time, I\'ll get better.", "给我时间，我会好起来的。");
	text = text.replace("You purse your lips.", "你抿抿你的嘴唇。");
	text = text.replace("Perhaps he\'ll get better on his own, but he\'ll be hardly in fighting shape if he goes without care.", "也许他自己就会好起来，但如果他不加注意地走，他的状态就很难恢复。");
	text = text.replace(/(.*?) is no longer in sound fighting shape\./, "$1 他不再是正常的战斗状态。");
	text = text.replace("His wounds have gotten infected.", "他的伤口被感染了。");
	text = text.replace("Without immediate care, it may take some time for him to get back into fighting shape.", "如果不立即治疗，他可能需要一段时间才能恢复战斗状态。");
	text = text.replace(/(.*?) stumbles into your tent\./, "$1 他摇摇晃晃绊进你的帐篷。");
	text = text.replace("He coughs into the crook of his elbow and a stringy bit of saliva trails between it and his lips.", "他剧烈地咳嗽，鼻涕眼泪甩了他一脸。");
	text = text.replace("Ah shit, sorry sir.", "啊，糟糕，对不起，先生。");
	text = text.replace("I\'m uh, I think I\'m a little sick.", "我，呃，我想我有点不舒服。");
	text = text.replace("Taking a look at him, you surmise that his wounds have gotten infected.", "瞄他一眼，你就知道他的伤口已经感染了。");
	text = text.replace("He may still be able to fight, but you probably shouldn\'t risk that until he gets better.", "他也许还能战斗，但你不该冒险，应该等他好起来。");
	text = text.replace(/While the company eats around a campfire, (.*?) suddenly vomits\./, "当队伍围着篝火吃饭的时候，$1 突然呕吐了起来。");
	text = text.replace(/You see that there\'s sweat all over his brow and his eyes are a bit dazed\. (.*?) shakes his head\./, "你看他的额头上全是汗，眼睛有点茫然。$1 狂摇他的头。");
	text = text.replace("Sir, his wounds have gotten infected.", "先生，他的伤口被感染了。");
	text = text.replace("The wounded brother sails back into the grass, arms pawing the air.", "那受伤的兄弟委顿在草地上，手臂在空中挥舞。");
	text = text.replace("I\'m fine, ya gits.", "我很好，菜鸡们。");
	text = text.replace("I\'ll fight the lot of you.", "我一个挑你们一群。");
	text = text.replace("His balled fists pedal back and forth before he slides into a deep sleep.", "很明显，他脑袋都烧糊涂了，在他进入深度睡眠之前，他手握双拳来回打出。");
	text = text.replace("Yeah, he\'s probably not gonna be battle ready for awhile.", "是啊，他可能还没准备好战斗呢。");
	text = text.replace(/Battles take a toll on men, and sometimes they survive wounds that come back to get them\. (.*?) is such a man - infection from injuries has spread about his body\./, "战争会对人造成伤害，有时他们会在受伤后幸存下来。$1 是这样的人，由于受伤而感染在他的身体上蔓延开来。");
	text = text.replace("He\'s very sick and should not fight unless absolutely necessary.", "他病得很重，除非有必要，否则不应该打架。");
	text = text.replace("With each battle, a man risks death.", "每次战斗，都会面临死亡的危险。");
	text = text.replace(/With each injury, he risks infection\. (.*?) has received the latter and it just may preempt the former\./, "每次受伤，都有感染的危险。$1 他现在已经成为了后者，或许还会成为前者。");
	text = text.replace("His wounds have become black and where they aren\'t black they are green.", "他的伤口变成了黑色，不是黑色就是绿色。");
	text = text.replace("He\'s able to walk, but should probably be kept out of the frontlines until he gets better.", "他能走路，但在他康复之前，不该靠近前线。");
	text = text.replace(/A man may survive a battle with terrible wounds, but it only starts another battle against infection\. (.*?)\'s injuries have gotten worse and may need time to heal\./, "一个人可能在可怕的创伤中幸存，但这只会引发另一场与感染的战斗。$1 的伤势越来越严重，可能需要时间才能痊愈。");
	text = text.replace("Unless absolutely necessary, he should be kept out of the frontlines.", "除非绝对必要，否则他不应出现在前线。");
	text = text.replace(/(.*?)\'s injuries have gotten worse, possibly infected\./, "$1 他的伤势越来越严重，可能感染了。");
	text = text.replace("Some suggest maggots to help clear out the infection, while others hint at amputations and more drastic measures.", "一些人建议用蛆帮助清除感染，而另一些人暗示截肢和更激烈的措施。");
	text = text.replace("As far as you\'re concerned, you simply need to give it time.", "就你而言，你只需要给它一点时间。");
	text = text.replace("That said, the mercenary should probably be kept out of the fights until he gets better.", "也就是说，这个雇佣兵应该被排除在战斗序列之外，直到他康复。");

//wound_heals_event.nut
	text = text.replace(/You go to check on (.*?) - he\'d suffered a terrible wound not long ago and sometimes it can lift a man\'s spirits just to let him know others care\./, "你去慰问 $1，他不久前受了重伤，有时候仅仅让他知道有人关心他，就能令他精神振奋。");
	text = text.replace("Thinking you\'ll find the man nursing his injuries, you instead are surprised to see that he is in good health.", "就像医师在为他疗伤时，你会惊讶地发现他很健康。");
	text = text.replace("The wounds have apparently healed in such speedy fashion that others might call it a miracle.", "伤口以肉眼可见的速度愈合，以至于其他人称之为奇迹。");
	text = text.replace(/(.*?) was injured in battle and you figure it\'d be best to go see how he is doing\./, "$1 在战斗中受伤，你认为最好去看看他怎么样了。");
	text = text.replace("Surprisingly, he\'s doing quite well.", "令人惊讶的是，他恢复的相当不错。");
	text = text.replace("His wounds have healed in such quick fashion you almost want to believe he consulted some dark arts while no one was looking.", "他的伤口愈合得如此之快，以至于你差点以为他在没人的时候，接触并使用了黑魔法。");
	text = text.replace("There are no signs of black magics around, just one sturdy and hard to kill man of flesh and blood.", "然而周围没有黑魔法的痕迹，只有一个坚强并杀不死的血肉之躯。");
	text = text.replace(/(.*?) enters your tent and flashes his wound - or what\'s left of it\./, "$1 进入了你的帐篷，把他的伤口给你看，伤疤几乎都没有了。");
	text = text.replace("The garish thing has seemingly healed entirely.", "那个狰狞的伤口似乎已经完全愈合了。");
	text = text.replace("The mercenary looks at you with a giddy smile.", "这个雇佣兵面带甜笑地看着你。");
	text = text.replace("They\'ll have to try harder to take me out of this world, captain.", "队长，他们想要干掉我得用出吃奶的力气。");
	text = text.replace(/(.*?) comes into your tent and shows off an old wound\. He speaks excitedly\./, "$1 进入你的帐篷，给你看了他的一个旧伤，他激动地说。");
	text = text.replace("Is that a miracle or what?", "这是奇迹还是什么？");
	text = text.replace("The injury has healed almost completely.", "伤口几乎完全愈合了。");
	text = text.replace("You tell the man that he\'s made of hardier things and the gods had nothing to do with it.", "你告诉他，他是由更坚韧的东西制成的，而神与之无关。");
	//text = text.replace("He shakes his head.", "他摇了摇头。");
	text = text.replace("You need to have more faith.", "你需要更多信仰。");
	text = text.replace(/You go looking for (.*?) - the mercenary had taken quite the injury last you saw\./, "你去看望伤者 $1，那个你上次看到伤的非常重的雇佣兵，然而，他居然兴致高昂。");
	text = text.replace("The man, however, is in high spirits.", "然而，这个人心情很好。");
	text = text.replace("He turns to you, taking a break from sharpening some steel.", "他在磨他的铁剑，发现你过来，转身面对你。");
	text = text.replace("Need something, sir?", "先生，你需要点什么？");
	text = text.replace("You inquire about his injury. He shrugs.", "你询问他的伤势，他耸耸肩。");
	text = text.replace("I don\'t die easy.", "我不容易死。");
	text = text.replace("I ate a lot of them pointy orange things when I was young.", "我年轻时吃了很多尖尖的橙色食物。");
	text = text.replace("I ate a lot of lettuce growing up.", "我从小就吃了很多生菜。");
	text = text.replace("One might say I\'m hard to... kale.", "人说我很难…额。");
	//text = text.replace("He nods.", "他点头。");
	text = text.replace("Yeah, I know. But it\'d be nice if they were looking out for me, too. Just in case...", "是的，我知道。但如果他们也在照顾我，那就太好了。以防万一…");
	text = text.replace("Need something sir?", "先生，你需要点什么？");

	return text;
}
