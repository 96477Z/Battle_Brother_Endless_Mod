var TranslateShiJian_WenBen_DLC4 = function(text)
{
//adopt_warhound_event.nut
	text = text.replace("You come across a caldera the bottom of which you find a few sheep nuzzling something.", "你碰到一个死火山口，在它的底部你发现几只羊用鼻子摩擦着什么东西。");
	text = text.replace("As you draw close, you see that there is an enormous hound there, its fur matted with blood, its collar shredded, and its paws wiry where the claws have come apart.", "当你走近时，你看到那里有一只巨大的猎犬，它的皮毛上沾满了鲜血，项圈被撕碎了，爪子上的指甲已经断了。");
	text = text.replace("It regards you with a growl, but can\'t maintain it for long as it simply puts its head down with an exhausted huff.", "它对你发出一声咆哮，但没坚持多久它就垂下头，发出一声疲惫的呼噜声，也许它撑不了多久了。");
	text = text.replace("The sheep depart and beyond them you find a man leaning against a rock.", "羊走了，在他们后面，你看见一个人倚在岩石上。");
	text = text.replace("His chest has been ripped open and whatever killed him did it with such force as to spray his innards all along the rocks.", "他的胸部被撕开了，杀死他的东西用如此大的力量把他的内脏扯了出来，散落在岩石上。");
	text = text.replace(/Following the trail, you do find a monstrous Nachzehrer whose throat has been ripped out\. (.*?) nods\./, "沿着这条路走下去，你发现一个巨型食尸鬼，他的喉咙被撕开了。$1 点头。");
	text = text.replace("I think that pup might be worth having in the company.", "我觉得这条狗值得被收留到战队。");
	
	text = text.replace("You reach out to the hound and it lifts it head to you as though you were another threat.", "你把手伸向那只猎犬，它抬起头来看着你，仿佛你是另一个威胁。");
	text = text.replace("Its eyes peer blackly from a long-matted mane that still drips with blood.", "它黑色的眼睛从长而杂乱的鬃毛上凝视着，鬃毛上还滴着血。");
	text = text.replace("The sheep, having seen what carnage this beast has already wrought, bay nervously as they watch you.", "绵羊见识过这只野兽的造成的杀戮，一边紧张刨着蹄子，一边注视着你。");
	text = text.replace("But you won\'t be deterred.", "但你不会被吓倒。");
	text = text.replace("You put your hand forth, palm supinated, and the weary dog slowly lowers into it. You nod.", "你伸出手，掌心后仰，那只疲倦的狗慢慢地俯下身来。你点头。");
	text = text.replace("There\'s more fight in you yet, friend.", "还有更多战斗需要你呢，朋友。");
	
	text = text.replace("You move to take the hound, but as you crouch down one of the sheep bays and charges, knocking you over.", "你想带走那只猎犬，但当你蹲下时，一只羊叫着冲过来，把你撞倒了。");
	text = text.replace("The men laugh and by the time you get to your knees another sheep crushes you from behind to many cheers.", "队员们哈哈大笑，当你跪下来的时候，另一只羊从后面把你压扁了，欢呼声此起彼伏。");
	text = text.replace("Drawing out your sword emits a sharp twang that sends the sheep scurrying.", "拔出你的剑会发出一种使羊逃跑的尖锐的声音。");
	text = text.replace("When you look back at the hound its nose is to the dirt and its eyes peerless.", "当你回头看那只猎犬时，它的鼻子落上了灰尘，眼睛暗淡了。");
	text = text.replace("It has died and the sheep slowly collect around it bleating and crying out.", "它已经死了，羊群慢慢地聚集在它周围，咩咩叫着。");
	text = text.replace("You sheathe your sword and tell the company to move on.", "你把你的剑套在鞘上，告诉大家继续前进。");
	
	//text = text.replace(/(.*?) steps forward\./, "$1 走上前去。");
	text = text.replace("I know this breed.", "我知道这个品种。");
	text = text.replace("It is of northern stock, a sturdy creature.", "它是北方的一种家畜，一种健壮的动物。");
	text = text.replace("There is one thing it shall respect in a man and it is strength.", "在它身上有一样东西是值得尊敬的，那就是它的力量。");
	text = text.replace("The sellsword crouches before the dog and without pause puts its hands around the scuff of its neck and starts to scratch.", "佣兵在狗狗面前蹲下，不停地用手掐住狗狗脖子上的伤痕，开始抓挠。");
	text = text.replace(/Despite the sudden movements, the dog responds positively and when the man stops scratching the dog lifts up off the ground and lopes forward and follows the man\. (.*?) stares back at you as he roughs the dog up with some heavy petting\./, "尽管动作很突然，狗还是做出了积极的反应，当他停止抓挠时，狗就会从地上站起来，向前跑，跟在他后面。$1 盯着你，重重的爱抚着狗。");
	text = text.replace("Yeah he\'ll fight for us.", "是的，他会为我们而战。");
	text = text.replace("Fightin\' is what he\'s made for.", "战斗是他的使命。");
	text = text.replace("He just needed someone to watch him rip and tear.", "他只是需要有人看着他撕咬和流泪。");
	text = text.replace("What a lovely creature this is.", "这是一个多么可爱的动物啊。");
	text = text.replace("And the dog is fine, too.", "而且这只狗也很好。");

//barbarian_tells_story_event.nut
	text = text.replace(/(.*?) shares tales around the campfire of northern heroics and monsters\./, "$1 在篝火旁分享了关于北方英雄和怪物的故事。");
	text = text.replace("There can\'t be much said of his dialogue, given that he isn\'t the most eloquent, but he does a great job of it through miming and drawing in the ground.", "他的对话不值得多说，因为他不是最能言善辩的，但他通过模仿和在地上画的方式把它表现得很好。");
	text = text.replace("One tale seems to be that of a huge warrior defeating a much larger warrior, or perhaps even defeating an ogre.", "一个故事似乎是一个强壮的战士击败一个更庞大的战士，或者甚至击败一个食人魔。");
	text = text.replace("It\'s hard to tell, but the barbarian makes a fascinating display of combat which the men applaud.", "这很难说，但野蛮人做了一个吸引人的战斗演示，大家热烈鼓掌。");
	text = text.replace("One tale is of two lovers, and with great use of his hands, makes a riveting show of what it is to plough and be ploughed.", "有一个故事是关于一对恋人的，他们用自己的双手，生动地展示了什么是耕耘，什么是被耕耘。");
	text = text.replace("And, apparently, what it is to be betrayed and stabbed in the back.", "显然，被背叛和背后捅刀子是什么滋味。");
	text = text.replace("You\'re not sure who is stabbing whom, nor when or in what sense, but the tale has the men on the edges of their seats and ends with applause.", "你不知道是谁捅了谁，也不知道是什么时候捅的，也不知道是以什么方式捅的，但这个故事让人如坐针毡，并以掌声结束。");
	text = text.replace("One tale speaks to a friendly unhold.", "一个故事讲述的是一个友善的巨魔。");
	text = text.replace("The men gasp at the very notion of it, but the barbarian slaps his wrists and wags his finger.", "人们一想到它就倒抽一口凉气，但野蛮人却拍打着手腕，摇着手指。");
	text = text.replace("This, you assume, is his way of telling you it\'s all true, every word or grunt.", "这个故事，你以为，是他告诉你这一切都是真的方式，每一个字或咕哝。");
	text = text.replace("The idea of a friendly monster unsettles the men initially, but by the end of the story they clap and nod as though they wish it really were the truth.", "一开始队员们对一只友善的怪物感到不安，但在故事的结尾，他们鼓掌和点头，似乎他们希望这是真的。");

//barbarian_volunteer_event.nut
	text = text.replace("Unlike the south, finding travelers on the northern \'roads\' is often a cause for caution.", "与南方不同的是，在北方的“道路”上发现旅行者往往是一个需要谨慎的由头。");
	text = text.replace("You ever know what monstrous man or beastly barbarian you\'ll come across next.", "你知道你接下来会遇到什么样的怪物。");
	text = text.replace("This time it is a large man limping with a dog beside him.", "这次是一个大块头男人一瘸一拐地走着，旁边有一条狗。");
	text = text.replace("You draw your sword halfway out of its sheath and loud enough to gain his ear.", "你把剑从剑鞘中抽出一半，声音大到足以吸引他的耳朵。");
	text = text.replace("The man looks up and his dog rears to the sudden yank of a leash.", "那人抬头一看，突然拉了一下皮带，他的狗受惊向后一靠。");
	text = text.replace("The northerner can speak a bit of your tongue.", "这个北方人能说一点你的语言。");
	text = text.replace("Ahh, fighters. I\'m a fighter myself.", "啊,战士们。我自己也是个战士。");
	text = text.replace("You ask why he is alone.", "你问他为什么独自一人。");
	text = text.replace("He explains that his clan had a dispute, and that he was to duel another man to decide who would take control.", "他解释说，他的部落发生了争执，他将与另一个人决斗，以决定谁将取得领导权。");
	text = text.replace("You ask why he did not duel this man, you ask if he is afraid.", "你问他为什么不跟这个人决斗，你问他是否害怕。");
	text = text.replace("The traveler shakes his head.", "旅行者摇了摇头。");
	text = text.replace("No. The clansman was my brother.", "不。这个族人是我的兄弟。");
	text = text.replace("And I\'d no desire to kill kin.", "我不想杀死我的亲人。");
	text = text.replace("They gave me this bitch here as both insult and reward and threw me from the tribe.", "他们给了我这个婊子作为侮辱和奖励并把我赶出了部落。");
	text = text.replace("I\'ve no land or people to go to, but if you\'d have me, I\'d surely fight for you just as well as anyone else.", "我无家可归，但如果你收留我，我一定会像其他人一样为你而战。");

//cultist_origin_armor_event.nut
	text = text.replace(/An urgency takes (.*?)\. He stands removes himself from the party\'s campfire and strides across the campground and retires to his tent\./, "紧急情况影响了 $1。他从聚会的营火旁站起来，大步跨过营地，退到帐篷里。");
	text = text.replace("It is there that you see him at work, his silhouette and shadows moving frenetically.", "就是在那里，你看到他在工作，他的轮廓和影子在疯狂地抖动。");
	text = text.replace("And there\'s more than just him in there: curves of unknown come and go beside him, reaching up in poles of black, tendrils of darkness, whipping and flailing to match the energy of his own procession.", "他不只是在那里：一些不明的曲线影子在他身边来来回回，达到了黑暗的极致，黑暗的触手，鞭笞和击打，使之配得上他的仪式所拥有的能量。");
	text = text.replace("And then he is done, his silhouette falling forward before yanking something to the light.", "然后他就完事了，在他把什么东西拉到灯光之前，他的影子轮廓向前倒去。");
	text = text.replace("He leaves his tent with the sort of hurry with which he entered, but this time he has a leather chest armor in hand.", "他匆忙地离开帐篷，但这次他手里拿着一件皮制胸甲。");
	text = text.replace("He drops it to the ground.", "他把它扔在地上。");
	text = text.replace("He awaits us all, brothers.", "他即将降临到我们，兄弟们。");
	text = text.replace("The chest armor is patterned with unique cuts which are arranged in strips that, to the unbelieving eye, would be meaningless.", "胸甲上有独特的切口，这些切口被排列成条状，对不相信的人来说，毫无意义。");
	text = text.replace("To you, it is but a language of Davkul.", "对你来说，它不过是达库尔的一种语言。");

//cultist_origin_finale_event.nut
	text = text.replace(/(.*?) enters your tent and a strong, brisk wind chases in after him, rearing up your scrolls and other notes\./, "$1 进入你的帐篷，一股强劲的，轻快的风追赶着他，掀起你的卷轴和其他记事本。");
	text = text.replace("He walks forward, hands crossed before him, a rather priestly look to his approach.", "他走上前，双手交叉在胸前，看起来相当虔诚地走近。");
	text = text.replace("Sir, I\'ve been spoken to and it is a grave matter which I\'ve been given responsibility for.", "先生，我被喻示了，而且是件我被赋予责任的大事。");
	text = text.replace("You put your hand up and tell the man to be silent.", "你举起手来，叫他安静。");
	text = text.replace("Carefully, you reach out to each candle in the tent and snuff them out until one remains.", "小心地，你走到帐篷里的每一根蜡烛前面，把它们一一熄灭，直到有一根还剩下。");
	text = text.replace("You bring it to your face...", "你把蜡烛拿到面前…");
	
	text = text.replace("Kneeling before the candle, you hold your hand over the flame and the fire comes to a standstill, pointing upright and unmoving.", "你跪在蜡烛前，把手放在火焰上，火就停了下来，笔直而不动。");
	text = text.replace("You\'ve seen icicles more animated than it.", "你见过冰柱似乎比它更生动。");
	text = text.replace("You stare into the glow and the tent melts away, slipping into the folds of an immense and immutable darkness.", "你凝视着夜光，帐篷融化了，堕入一片无尽的黑暗中。");
	text = text.replace("The cultist is gone.", "异教徒离开了。");
	text = text.replace("In his place is a black cloak, its arms to your shoulders, a slate of granite for a head, its edges chipped and cracking.", "在他的之前的位置上是一件黑色斗篷，它保护你的双肩，一片花岗岩作为头部，它的边缘破碎并裂开着。");
	text = text.replace("It appears there is something behind this mask, behind this futile effort to keep your mind safe from its true visage.", "在这个面具背后，在这个徒劳的努力背后，似乎有某种东西在保护你的心灵远离它的真实面容。");
	text = text.replace("You reach out to the mask, but some invisible force stops you.", "你伸手去拿面具，但是一些看不见的力量阻止了你。");
	text = text.replace("In good time you shall see all that I am.", "在一个好时候，你会看到我的全部。");
	text = text.replace("The voice is booming yet narrowed into a brutish whisper only for you to hear.", "这声音是隆隆的，但变小成一种只有你才能听到的粗野的低语。");
	text = text.replace(/I\'ll give you Death, mortal, and warmed in its comforts, Death shall be visited upon your enemies\. (.*?) will not be lost, he will be with you always, this I promise you\./, "我将会给你死亡，凡人，和它温暖的慰藉，死亡将会造访你的敌人们。$1 不会消失，他与你同在，这是我向你保证的。");
	text = text.replace(/A whiteness snaps back over you, a rush of wind, tent flaps curling outward, the candle\'s flame tilting impossibly without going out, and a frigid coolness that has your first breath seen floating across the air. (.*?) is nowhere to be seen\./, "一股白浪卷回你身上，一阵狂风，帐篷的襟翼向外卷曲，蜡烛的火焰倾斜着，难以置信的没有熄灭，当你开始用喉咙呼吸的时候，感到阵阵凉意。$1 不见了踪影。");
	text = text.replace("You quickly get up and touch your face and skin, making sure that you are all that you\'re supposed to be.", "你很快站起来触摸自己的脸和皮肤，确信你就是原来的自己。");
	text = text.replace("To your great disappointment, Davkul is gone and you are still you.", "令你失望的是，达库尔走了，而你还是你。");
	
	text = text.replace("Davkul would be most unhappy with your failure to obey, not that you feel any urge other than to do what is asked.", "达库尔会对你的不服从感到最不高兴，不是因为你除了按要求去做之外，还有其他的要求。");
	text = text.replace(/You and the (.*?) go to (.*?)\'s tent\./, "你和 $1 一起去了 $2的帐篷。");
	text = text.replace(/He leans up as though already expecting you and he sees the knife in the carriage of your party and nods at the simple sight of it\. (.*?) kneels beside the man and you realize they\'ve already talked before this, that the question to you very well may have been a test of your devotion to Davkul\./, "他探起身子，就好像已经在等着你了，他看着你们部队马车上的刀，目光坚定的点头。$1 跪在这个人旁边，你意识到他们在此之前已经谈过了，这个问题对你来说很可能是对你是否忠于达库尔的考验。");
	text = text.replace("You are happy to have passed.", "你很高兴你通过了考验。");
	text = text.replace(/(.*?) unbuttons his shirt and (.*?) pierces his chest as though he were putting a key into a lock, and he twists it all the same\./, "$1 解开了他的衬衫扣子，$2 刺穿了他的胸膛，就好像他把钥匙插进了锁里一样，他还是拧开了锁。");
	text = text.replace("The sacrifice gasps and tenses, for no devotion to Davkul can put aside the manner in which death may be permitted, which is in pain and suffering.", "这种献祭让人喘不过气来，也让人紧张，因为任何对达库尔的忠诚都无法抛开死亡的可能，那是一种痛苦和折磨。");
	text = text.replace("But he smiles, and the light doesn\'t so much go out of his eyes as the darkness, a sort you haven\'t seen before, replaces it.", "但他微笑着，眼中的光芒并没有很快消失，一种你从未见过的黑暗，取代了它。");
	text = text.replace("And like that, he is gone.", "就这样，他死了。");
	text = text.replace(/(.*?) gets to work on the still warm corpse, carving the flesh with rapid slices across the skin and hard cuts into the tendons\./, "$1 开始在仍然温暖的尸体上工作，沿着皮肤和坚硬的肌肉把尸体上的肉快速切成薄片。");
	text = text.replace("He pulls the chest apart.", "他把尸体的胸腔拉开。");
	text = text.replace("A black fog lingers with the blade\'s every move, and it seems to sway cheerily after its every move.", "刀锋的每一个动作都带着一团黑雾，似乎在每一个动作之后都欢快地摇摆着。");
	text = text.replace(/When (.*?) is done, (.*?) has been turned into a slab of armor, flesh torn asunder and stretched, teeth for rivets, tendons for strappings, bones for pauldrons, a cuirass of absolute carnage\./, "当 $1 完工后，$2 变成的一副板甲，血肉被撕裂和拉伸，牙齿被用来做铆钉，肌腱被用来做绷带，骨头被用来做护肩，这绝对是一副杀戮的铠甲。");
	text = text.replace(/And it pulses and moves as though that manifested it still lived\. (.*?) turns to you, his hands slopped red\./, "它像脉搏一样跳动着，好像它仍然有生命力一样。$1 转向你，双手被鲜血染红了。");
	//text = text.replace("Davkul awaits us all.", "达库尔即将降临到我们。");
	text = text.replace("You nod and embrace your fellow comrade.", "你点头并拥抱你的战友。");
	
	text = text.replace("You feel this is a test.", "你觉得这是个考验。");
	text = text.replace("Not one to pass by sacrificing one of your men, but quite the opposite.", "没有人会用牺牲其中一个战友的方法来通过考验，这是绝对应该反对的。");
	text = text.replace("Davkul may have sent false believers to see if you would do all that they say, simply because they say it.", "达库尔可能派了错误的信徒来查看你是否按他们说的做了，仅仅因为他们说过。");
	text = text.replace("You do not know how you know this, you just know, which is the very sort of certainty a man should follow most.", "你不知道你是怎么知道这些的，你只知道，这正是一个男人最应该遵循的。");
	text = text.replace(/Just as you stand to go tell (.*?) of your decision, half the candles in the room suddenly blow out\./, "正当你准备告诉 $1 你的决定时，房间里的一半蜡烛突然熄灭了。");
	text = text.replace("Tendrils of smoke waft in the remaining gloom, a twisting haze through which, for but a moment, you swear you see a blackened visage fade out the tent\'s opening.", "缕缕青烟在残留的黑暗中飘荡，那是一种扭曲的烟雾，你发誓，在那烟雾中，你能看到一张发黑的脸，一会儿就从帐篷的出口消失了。");
	text = text.replace(/You get the feeling that (.*?) already knows what choice you\'ve made\./, "你会有这样一种感觉，$1 早就已经知道你的选择了。");
	text = text.replace("You stay in the tent and await Davkul\'s presence.", "你呆在帐篷里，等着达库尔的出现。");
	text = text.replace("When it is not felt, you simply light the candles again and speak to the emptied room.", "当感觉不到的时候，你只是再次点燃蜡烛，对着空无一人的房间说话。");
	//text = text.replace("Davkul awaits us all.", "达库尔即将降临到我们。");

//cultist_origin_flock_event.nut
	text = text.replace(/(.*?), a wandering devotee of Davkul, has come to join the (.*?)\. The company gathers around him, he nods, they nod back, and just like that he is with you\./, "$1，一个流浪的达库尔信徒，已经加入了 $2。战队成员们聚集在他周围，他点头，他们也点头，就像他在早就你身边一样。");
	text = text.replace(/(.*?), a man in rags, yet armored in the shadows of Davkul, has joined the (.*?)\./, "$1，一个衣衫褴褛，但身披达库尔甲的人加入了 $2。");
	text = text.replace(/A man by the name of (.*?) shows you his dedication to Davkul, a series of spiritual rites shaped about his skull as gruesome scars\./, "一个名叫 $1 的人向你展示了他对达库尔的奉献，一系列精神仪式造就了他的的头盔，上面有一些可怕的疤痕。");
	text = text.replace(/He is welcomed into the (.*?)\./, "他被欢迎加入 $1。");
	text = text.replace(/(.*?) stalked the company for a time before approaching you directly\./, "$1 在直接联系你之前，跟踪了战队一些时间。");
	text = text.replace("He is an advocate for Davkul\'s purpose, and with that his argument has been made and yourself engendered to it all the same.", "他是达库尔目的的拥护者，他的观点已经提出，而你自己也完全同意他说的。");
	text = text.replace("The man joins the company.", "这个人加入了战队。");
	text = text.replace(/Davkul surely watches over you as a man by the name of (.*?) joins the (.*?)\. He stated that he had but one purpose and it was to find you and ensure that this world sees all that awaits it\./, "达库尔肯定会像一个名叫 $1 的人一样守护着你，他加入了 $2。他说他只有一个目的，那就是找到你，确保这个世界看到所有等待着的东西。");
	text = text.replace(/(.*?) says that he saw the shadows flicker behind your body as though they were \'of flame\.\'/, "$1 说他看到你身后的影子在闪烁，就好像它们是“火焰”一样。");
	text = text.replace("He states that he will join your cause for surely Davkul has embedded in you an aspect of the dark and infinite.", "他声明他将加入你们的事业，因为毫无疑问，达库尔已经在你们身上嵌入了黑暗和无尽。");
	text = text.replace(/(.*?) walks beside you\./, "$1 与你同行。");
	text = text.replace("He calls you an aspect of Davkul\'s darkness, and that eternal eyes surely watch over your party whole.", "他称你为达库尔黑暗的一面，那永恒的眼睛一定会守护你的整个团队。");
	text = text.replace(/The (.*?) takes him beneath its many shadowed wings\./, "$1 把他带到很多暗影的羽翼之下。");
	text = text.replace(/(.*?) finds the (.*?) on the march and joins its ranks as though he were no stranger at all\./, "$1 在行军中找到了 $2，并加入了它的队伍，就好像它并不陌生一样。");
	text = text.replace("No one says a word and you simply direct him to the inventory where his purpose may gather teeth.", "没有人说什么，你只是简单地引导他去存货那里，他的目的可能是收集牙齿。");
	text = text.replace(/With a showing of his scarred head, (.*?) states he is at the speartip of Davkul\'s purpose\./, "通过展示他伤痕累累的头颅，$1 声称他是传达达库尔意志的先锋。");
	text = text.replace(/You nod and welcome him into the (.*?)\./, "你点头欢迎他加入 $1。");
	text = text.replace(/Walking in the shadow of Davkul, you were bound to find men such as (.*?)\. He is keen on joining the company, in particular because you are in command of it, and more particularly because he believes Davkul has chosen you\./, "行走在达库尔的阴影中，你一定会发现像 $1 这样的人。他渴望加入这个战队，尤其是因为你是这个战队的负责人，更重要的是，他相信是达库尔选择了你。");
	text = text.replace(/(.*?) bands with the company and there is little argument as to why\./, "$1 和战队合作，至于为什么，几乎没有争论。");
	text = text.replace("When asked where he came from, he shrugs and speaks of Davkul while nodding knowingly in your direction.", "当被问到他来自哪里时，他耸耸肩，说是达库尔，并有意地朝你的方向点头。");

//cultist_origin_hood_event.nut
	text = text.replace(/(.*?), one your followers, enters your tent and then just as soon leaves\./, "$1，你的一个追随者，进入你的帐篷，然后很快的离开了。");
	text = text.replace("You stand to see where he\'s gone, but come to find a leather half-helm sitting atop your table.", "你站起来想看看他去哪儿了，却发现你的桌子上放着一顶皮头盔。");
	text = text.replace("The leather is stitched with hairs of unknown origin and pinched together by what look like hooks and fingernails.", "这种皮革是用来历不明的毛发缝制而成，然后用看似钩子和指甲的东西把它们夹在一起。");
	text = text.replace("The holes of the helm are a pitch black, and you get the sense that even if you filled them the darkness would never depart.", "头盔上的洞是漆黑一片，你能感觉到即使你把它们填满，黑暗也永远不会消失。");
	text = text.replace("It is then, staring into those emptied sockets, that you know something is staring back. You nod approvingly.", "然后，盯着头盔上那些空槽，你知道有什么东西在盯着你。你赞许地点头。");

//cultist_origin_sacrifice_event.nut
	text = text.replace("Most would consider the dream to have been a nightmare: the darkness surrounded you, a black so flat you could reach out and touch it.", "大多数人会认为这个梦是一场噩梦：黑暗包围着你，一片漆黑，你伸手就能摸到它。");
	text = text.replace("The voice spoke a language you\'d never heard before, and yet you understood it nonetheless.", "那个声音说的是一种你以前从未听过的语言，但你至少能听懂。");
	text = text.replace(/Two faces emerged for the infinite shade: (.*?) and (.*?)\. The men seemed so close, yet when you reached out they shrank, as though your fingers stretched infinitely into the void\./, "在无尽的阴影中出现了两个面孔：$1 和 $2。那些人似乎离你很近，但当你伸出手去时，他们却退缩了，仿佛你的手指无限地伸入虚空。");
	text = text.replace("Upon waking, you knew what must be done.", "一醒来，你就知道该做什么了。");
	text = text.replace("But a trust had been put in you here, a trust by Davkul.", "但你在此时获得一种信任，达库尔的信任。");
	text = text.replace("A trust to do what few men can: make a choice.", "但是这种信任不是一般人能承受得起的：做出一个选择。");
	text = text.replace("Davkul\'s presence arrived during a campfire.", "达库尔的出现是在一场营火中。");
	text = text.replace("The rest of the men faded into the aether of infinite black, and a strange entity replaced them.", "其余的人都消失在无尽的黑暗之中，取而代之的是一个奇怪的实体。");
	text = text.replace("An entity which you could not see, but whose presence was but a penumbra of crossing shadows.", "一个你看不见的实体，但它的存在只是一团混沌的阴影。");
	text = text.replace(/It requested a sacrifice, not by speaking to you, but by showing: (.*?) and (.*?)\. First one melted away before revivifying, then the other repeated the process until both existed with their hands out and eyes closed\./, "它要求一次献祭，不是通过对你说话，而是通过展示：$1 和 $2。第一个人的幻象不见了，然后另一个重复这个过程，直到两人都伸出手闭上眼睛。");
	text = text.replace("It was clear that Davkul was trusting you with a choice.", "这很清楚了，达库尔相信你的选择。");
	text = text.replace(/When the shadows snapped away, the campfire was blinding\. (.*?) and (.*?) were staring at you\./, "当影子啪的一声消失时，营火变得很刺眼。$1 和 $2 正盯着你。");
	text = text.replace("Is all alright, sir?", "准备好了么，先生？");
	text = text.replace("You traveled to the place.", "你去了那个地方。");
	text = text.replace("You knew you were sleeping, but you knew damn well you traveled there nonetheless, shifting beyond your mind, beyond your body, coursing over the earth, over its rivers, across its dry earth, and past the mountains which would crumble.", "你知道你在睡觉，但你知道得很清楚，你还是去了那里，超越了你的思想，超越了你的身体，越过了大地，越过了河流，越过了干涸的大地，越过了即将崩塌的群山。");
	text = text.replace("There you found Davkul, the immutable darkness, the inviting shade.", "在那里你找到了达库尔。永恒的黑暗，迷人的暗影。");
	text = text.replace(/(.*?) and (.*?) were already there, standing closest to you and Davkul\'s shape shifted restlessly behind their images\./, "$1 和 $2 已经在那里了，站在离你最近的地方，达库尔的身影在他们的影子后面快速地变换着。");
	text = text.replace("A black hand of fog pushed one man forward and then yanked him back, then repeated it with the other man.", "一只黑色的雾手把一个人往前推了推，又把他拉了回来，然后又对另一个人重复了一遍。");
	text = text.replace("You nodded in understanding. A sacrifice was required and you were to choose.", "你点头表示理解。献祭是必须的，你必须做出选择。");
	
	text = text.replace(/(.*?) is bound and put to the fire\./, "$1 被捆绑并投入火中。");
	text = text.replace("The smell of burnt pork fills the air and the men around you rejoice with tears in their eyes.", "空气中弥漫着肉烧焦的味道，你周围的人眼里充满了泪水。");
	text = text.replace("You see a face twisting in the smoke of the sacrifice, a knowing visage that approves.", "你看到一张扭曲的脸，在祭品的烟雾中，那是一副赞许的表情。");
	text = text.replace("The men are emboldened.", "这些人受到了鼓舞。");
	text = text.replace(/(.*?) is chopped to pieces until he is but a torso and head\./, "$1 被切成了碎片直到只剩躯干和头部。");
	text = text.replace("The blood has emptied across the ground and yet there\'s still light in his eyes and a perverse smile upon his face.", "血已经流遍了整个地面，但他的眼睛里仍然有光，脸上还带着一丝狡黠的微笑。");
	text = text.replace("You take an axehead and run it into his throat until he is no more.", "你拿把斧头砍进他的喉咙，直到他死去。");
	text = text.replace("Every bodypart is separated and put upon a pole, caked in grease, and lit aflame.", "他身体每一部分都被分开了，挂在一根杆子上，涂上油脂，点燃。");
	text = text.replace("You and the men dance beneath the pyres as the night comes and the night goes.", "你和队员们在柴堆下跳舞，从夜晚来临持续到夜晚离去。");
	text = text.replace(/The procession is such: (.*?) is flayed alive and pierced with sharpened sticks through each limb and held aloft, spread-eagled over a fire which cooks him until death\./, "过程是这样的：$1 被活着剥皮，用削尖的木棍刺穿祭品的四肢，举在高处，呈鹰状摊在火上，把祭品烤熟，直至死亡。");
	text = text.replace(/The men watch his passing in silence, but as soon as one of his charred limbs breaks and collapses his corpse into the flames the men cheer and hoot and holler, some pray, others roll around in the ashes of (.*?), some licking it off their fingertips like it were sweets\./, "队员们静静地看着他的死亡，但是当他的一条腿烧断了，他的尸体倒在火焰中时，有人开始欢呼雀跃，有的在祈祷，有的在 $1 的灰烬中打滚，有的在舔手指就像舔糖果一样。");
	text = text.replace("It is a good night.", "真是一个美好的夜晚。");
	text = text.replace(/A long stick is pierced through (.*?) from posterior to out the side of his neck\./, "一根长棍从 $1 的脖子后面穿过去。");
	text = text.replace("He is tilted up into the sky and held there by one man while others use long spears to stab him through until his corpse is the apex of an uncovered tent.", "他仰面朝天，被一个人扶着，其他人则用长矛刺穿他的身体，直到他的尸体像一个简陋帐篷的顶端。");
	text = text.replace(/The conical corpse is then covered with grass and mud until there stands a tipi, a torso and head of (.*?) all that remains above, and should you enter the tent you would find his legs dangling from its ceiling\./, "圆锥形的尸体被草和泥土覆盖，直到建起一个尸观，$1 的头和剩下的部分都用上了，如果你进入尸观，你发现他的腿悬挂在天花板上。");
	text = text.replace("The monument should stand as an omen for those to come, and a sign that they should come to accept that which awaits us all.", "这个尸观应该预示着这帮家伙的未来，或者说是个标志，他们应该接受那个等着我们所有人的东西。");

//cultist_origin_vs_old_gods_event.nut
	text = text.replace("While enjoying a slice of bacon, you hear a quarrel taking shape.", "正在享用一片培根的时候，你听到一场争吵愈演愈烈。");
	text = text.replace("You ignore it for a time, but the shouts only get louder, quickly rising over your ability to enjoy a good meal.", "你忽视它一段时间，但叫喊声只会越来越大，迅速上升为超过你享受一顿好饭的忍耐力。");
	text = text.replace("Angered, you stand up and head toward the disturbance.", "被惹怒了，你站起来，朝骚动的方向走去。");
	text = text.replace(/You find (.*?) and (.*?) facing off, the cultist and follower of the old gods having apparently discovered some differences to which the latter no doubt cannot even begin to truly understand\./, "你发现 $1 和 $2 正在对峙，这些异教徒和古老神明的追随者们显然发生了一些分歧，而后者显然无法真正开始理解这些差异。");
	
	text = text.replace("You step off to the side, letting the men hash out their differences as men with great differences do.", "你退到一边，让队员们用男人的方式解决他们的分歧。");
	text = text.replace("Fists for arguments, the follower of the old gods makes his case, battering the cultist again and again.", "古老神明的追随者们挥舞着拳头，为自己辩护，一次又一次地击打异教徒。");
	text = text.replace("But the man with the scarred head only grins in return.", "但那个头上有疤的人只以咧嘴笑回应。");
	text = text.replace("His eyes are puffing up, the lids purpled and puckering over his eyesight.", "他的眼睛肿了起来，眼皮皱成紫色，遮住了他的视线。");
	text = text.replace("Yet, still, he grins, and there is bloody laughter spewing out of his reddened mouth.", "然而，他仍然咧嘴一笑，这是血腥的笑声从他流血的嘴里传出。");
	text = text.replace("Such darkness! Davkul is most pleased!", "如此的黑暗！达库尔非常高兴！");
	text = text.replace(/With an axious look, (.*?) steps off (.*?) and backs away\./, "焦虑的看了一眼，$1 离开了 $2 并后退了。");
	text = text.replace("He\'s rubbing his bloodied knuckles, realizing he may have broken a few in the seemingly one-sided scuffle.", "他揉着血淋淋的指关节，意识到自己可能在这场看似一边倒的混战中弄断了几个。");
	text = text.replace("But it\'s the cultist\'s words that hurt him most of all.", "但最刺伤他的是那个异教徒的话。");
	text = text.replace("Man isn\'t tempted by the darkness, he is called to it!", "人不是受到黑暗的诱惑，而是受到黑暗的召唤！");
	text = text.replace("Lost without it! Gleeful in its return!", "失去了没有它！它的归来让人欣喜！");
	text = text.replace(/Almost afraid to look back, (.*?) hurries away as the cultist remains behind, laughing and chuckling on the grass\./, "几乎不敢回头看，$1 匆忙离开，而异教徒留在后面，在草地上笑着。");
	text = text.replace("You go over and pick him up, clapping a hand on his shoulder.", "你走过去抱起他，拍着他的肩膀。");
	text = text.replace("Davkul awaits us all, brother. You did well.", "达库尔即将降临到我们，兄弟。你做的很好。");
	
	text = text.replace("You figure to let them do what they must, but a shadow draws over both your shoulders.", "你想让他们做他们必须做的事，但你肩膀上浮现了阴影。");
	text = text.replace("The blackness spools before you until it\'s a great sheet blocking the world whole.", "黑暗在你面前缠绕，直到它的巨大大床单遮住了整个世界。");
	text = text.replace(/In this infinite space there is a view of men dying, that of (.*?) and (.*?), and you see yourself amongst them\./, "在这无限的空间里，有一种死人的观点，那是 $1 和 $2，你看到你自己在他们中间。");
	text = text.replace("And more than that, you see a deed left undone, your work with and through Davkul unfinished.", "更重要的是，你看到的是一件未完成的事，你的工作和为达库尔干的都没有完成。");
	text = text.replace("Just as you realize the omen, it snaps away and you find the two men ready to fight.", "就在你意识到预兆的时候，它突然消失了，你发现那两个人正准备战斗。");
	text = text.replace(/Shouting, you split the godly and ungodly apart. (.*?) leaves, but you spend a moment with (.*?), leaning in and whispering\./, "大叫着，你们喊叫，把信古老神明的人和邪教徒分开了。$1 离开了，但你花了一点时间与 $2，靠在一起耳语。");
	text = text.replace("The light is only for a moment, brother, and its extinguishment is inevitable.", "光明只是暂时的，兄弟，它的消逝是不可避免的。");
	text = text.replace("Trust in Davkul, and await the darkness that is to come.", "相信达库尔，等待黑暗的来临。");

//cultist_origin_vs_uneducated_event.nut
	text = text.replace("A few brothers come to you looking rather worried.", "有几个兄弟来找你，看上去很着急。");
	text = text.replace(/They say (.*?) has been sitting with (.*?) for a few hours now\./, "他们说 $1 和 $2 坐在一起已经几个小时了。");
	text = text.replace("When you ask what\'s the worry, they remind you that the cultist has a scarred forehead and speaks of incredibly strange things.", "当你问他们担心什么时，他们会提醒你，那个额头有伤疤的异教徒，说着令人难以置信的怪事。");
	text = text.replace("Yeah. Those are the demands of Davkul, an example of one\'s committment.", "是的。这些都是达库尔的要求，一个关于承诺的范例。");
	text = text.replace("You do not understand what could possibly be wrong with that.", "你不知道这会有什么问题。");
	text = text.replace(/You go and see the two men\. (.*?) looks up at you, smiling, and says the cultist actually has a lot to teach him\./, "你去看看那两个人。$1 抬头看着你，微笑着，说异教徒确实教会了他很多。");
	text = text.replace("Perhaps he does, but you know Davkul\'s presence need not be felt in all, and if it desired being forced upon the world it would be a misapprehension of Davkul\'s purpose.", "也许他是这么想的，但你知道，达库尔的存在根本不需要被感知，如果他渴望被强加到这个世界上，那将是对达库尔奥义的误解。");
	
	text = text.replace("You nod and turn away.", "你点头，转过身去。");
	text = text.replace(/By next morning, (.*?) is found with a fresh wound on his forehead, the blood of conversion and the price some must pay to devote themselves to Davkul\./, "直到第二天早上，$1 被发现在他的额头上有一个新的伤口，流血的谈话和一些代价必须要付出才能皈依达库尔。");
	text = text.replace("When you ask how he is doing, he only says a few words.", "你问他感觉如何，他只说了几句话。");
	text = text.replace("Davkul is coming.", "达库尔就要来了。");
	text = text.replace("Shaking your head, you correct him.", "摇着头，你纠正他。");
	text = text.replace("Davkul is not coming.", "达库尔不是就要来了。");
	text = text.replace("Davkul AWAITS us all.", "达库尔即将降临到我们。");
	
	text = text.replace(/You separate the two men, telling (.*?) to go count some inventory\./, "你把这两个人分开，让 $1 去清点一些存货。");
	text = text.replace(/When he leaves, (.*?) sneers at you\./, "当他离开时，$1 嘲笑你。");
	text = text.replace("Davkul awaits. You see him in your sleep.", "达库尔即将降临。你在睡梦中看到他了。");
	text = text.replace("You see him in the nights.", "你在夜晚看到他了。");
	text = text.replace("His darkness is coming.", "他的黑暗就要来了。");
	text = text.replace("No light burns forever.", "没有永远燃烧的光明。");
	text = text.replace("The man pauses and stares into your soul.", "异教徒停下来，凝视着你的灵魂。");
	text = text.replace("And you stare back from somewhere not of your body.", "你从回头盯着某个地方，而不是你的身体。");
	text = text.replace(/You can only see infinite blackness around you and a pip of light through which (.*?) is looking\./, "你只能看到周围无限的黑暗和一小束光，$1 正在瞅着呢。");
	text = text.replace("Slowly, you float back toward the light and find yourself blinking and staring at the man. He bows.", "慢慢地，你挪向那道光，发现自己在眨眼睛，并盯着那个男人。他鞠躬。");
	text = text.replace("Apologies, captain, I did not know that Davkul had such plans.", "抱歉，队长，我不知道达库尔还有这样的计划。");
	text = text.replace("Blinking again, you can only nod.", "又眨了眨眼睛，你只能点头。");

//deserter_origin_volunteer_event.nut
	text = text.replace("A pair of men looking disheveled and weary emerge from some bushes beside the road.", "两个看起来衣衫不整、疲倦的的人从路旁的一些树丛里冒了出来。");
	text = text.replace("They hold their hands up as if they\'d come to surrender themselves.", "他们举起了他们的手，好像他们是过来投降的。");
	text = text.replace(/Are ye the (.*?)\? We\'d heard you were a band of deserters\./, "你们是 $1？我们已经听说了，你们是逃兵们组成的战团。");
	text = text.replace("And I don\'t mean that as an insult.", "我这不是一种侮辱。");
	text = text.replace("We\'re runners, too, but we got nowhere else to go.", "我们也是逃兵，但是我们无路可走了。");
	text = text.replace("Everywhere we turn there are bounty hunters and executioners.", "我们去的每一处都是赏金猎人和行刑者。");
	text = text.replace("Let us fight for you.", "让我们为你而战吧。");
	text = text.replace("It ain\'t the fight that ever scared us, we swears by that.", "战斗从来就吓不倒我们。");
	
	text = text.replace("It would be almost satisfyingly ironic to string these men up and hang them for what they\'d done, but you are not about to set that tone for the company.", "如果把他们用绳子挂起来并且吊死他们，因他们所做的那些事，那一定会及其的讽刺，但是你不打算让战队保持在那种氛围中。");
	text = text.replace(/You welcome them to the band, sending them forth to the inventory\. (.*?) keeps an eye on them for a time, but he reports that the men are true to their word and will fight\./, "你欢迎他们加入团队，并让他们接近物资。$1 盯着他们看了好一会儿，然后他报告说那些人说的是实话，他们将会为你战斗。");
	
	text = text.replace("It would be almost satisfyingly ironic to string these men up and hang them for what they\'d done, but you are not about to set that tone for the company.", "如果把他们用绳子挂起来并且吊死他们，因他们所做的那些事，那一定会及其的讽刺，但是你不打算让战队保持在那种氛围中。");
	text = text.replace(/You welcome them to the band, sending them forth to the inventory with (.*?) keeping an eye on them\./, "你欢迎他们加入团队，并让他们接近物资，让 $1 盯着他们。");
	text = text.replace("Except you don\'t see your sellsword for a suspicious length of time.", "但你并没有保留一段用来怀疑的时间，并在这期间看住你的佣兵。");
	text = text.replace("When you go looking, he\'s found knocked out on the ground and the inventory ransacked.", "当你去看的时候，他被发现打昏在地上，物资都被洗劫了。");
	text = text.replace("The two men are nowhere to be seen!", "那两个人不知道去了哪里！");

//drunk_nobleman_event.nut
	text = text.replace("While on the march, you find a drunken nobleman tottering side to side on the path.", "当在行军的时候，你发现一个喝醉了的贵族在路上摇摇晃晃。");
	text = text.replace("Mussy is the name of his hair, leaves and grass and what looks like birdshit swept up in it like someone stirred the ingredients to a prank.", "他的头发乱糟糟的，叶子和草还有看起来像鸟粪的东西卷在里面，就好像有人故意搅动这些材料来做恶作剧。");
	text = text.replace("But his clothes sweep about with the finest of silks and his fingers glisten with jewelry.", "但是他的衣服是用上好的丝绸做的，他手指上的宝石在闪闪发光。");
	text = text.replace("He has a bottle in each hand and he swings them around as he sings gibberish pub songs.", "他的两手各拿一个瓶子，他一边把它们摆来摆去，一边唱着令人费解的酒吧歌曲。");
	text = text.replace(/He is in all regards the greatest magnet for a mugging you\'ve ever seen\. (.*?) purses his lips and he looks like a wolf staring at a fat sheep\./, "他像一块你从未见过的巨大的磁石一样吸引着所有人的注意来抢劫他。$1 撅了撅他的嘴，他看起来就像是一头盯着肥羊的狼一样。");
	text = text.replace("I\'m not saying nothing, sir, I\'m just.", "我啥也没说，先生，我只是。");
	text = text.replace("I\'m just seeing it.", "我只是看看。");
	text = text.replace("That\'s a lot of juice.", "那有很多好处。");
	text = text.replace("A lot of juice limping down the road.", "有很多好处就在路上慢慢行走着。");
	text = text.replace("But again I ain\'t saying nothing.", "但是，再强调一遍，我什么也没有说。");
	text = text.replace("You know what he\'s talking about.", "你知道他在说什么。");
	
	text = text.replace("You walk up to the man and help him sit down.", "你走近了那个人，帮助他坐了下来。");
	text = text.replace("He grins as one of his bottles clanks off the path and rolls away.", "当他的一个瓶子叮当一声掉在地上，滚到一边去的时候，他咧嘴笑了出来。");
	text = text.replace("Thankiicup, sir, jast, no, well, ya.", "谢谢，先生，只是，不，好吧，你。");
	text = text.replace("Nodding, you hold his hand out and spit on his fingers, then roll the jewelry off and pocket them.", "点着头，你把他的手张开，并朝他的手指上吐了口口水，然后把那些珠宝首饰扒拉了下来，装进包里。");
	text = text.replace("He merely watches as though you were a physician treating a malady.", "他只是看着，就好像你是一个医生，在治疗疾病而已。");
	text = text.replace("The rest of your mercenaries strip him down and throw a goatskin tarp over him and then leave him there.", "你剩下的佣兵把他扒光，扔给他一块羊皮布，然后就不管他了。");
	text = text.replace("As you walk away he asks if you know about the drink.", "当你离开的时候他问你懂不懂喝酒。");
	text = text.replace("Not, not sayin\' away the secret, but, sirs, drinks are good.", "这不，这不是什么秘密，但是，先生，酒是个好东西。");
	text = text.replace("Yes, are they ever.", "是的，它是。");
	text = text.replace(/Unfortunately, as you rejoin the company (.*?) reports that a kid saw everything and scampered off\./, "不幸的是，当你重新回到战队的时候 $1 报告，有个孩子看到了整个过程，并且迅速地跑开了。");
	text = text.replace("You ask why he didn\'t chase after him.", "你问他为什么不追上他。");
	text = text.replace("He looks at you shrewdly.", "他机智地看着你。");
	text = text.replace("I\'m not the scampering sort, sir.", "我不是那种速度型的，先生。");
	
	text = text.replace("You walk up to the man and, startled, he reels back with a hiccup.", "你走近了那个人，在一阵连续不断的嗝声中，他摇晃着后退，明显是被吓了一大跳。");
	text = text.replace("Oy, who are ye?", "唔，你是谁？");
	text = text.replace("Telling him you\'re a good friend, you approach to rob him of everything, but as you take another step his eyes clear and he drops both bottles and suddenly reaches into his coat and pulls out a crossbow.", "一边告诉他你是个好朋友，你一边接近了他，准备抢走他的所有东西，但是当你走出下一步的同时他的眼睛马上清晰了起来，他扔掉了两个瓶子，并且马上把手伸进他的大衣里取出了一把弩。");
	text = text.replace("Not another step you lout.", "别再靠近了，白痴。");
	text = text.replace("I got men yonder who are watching.", "我有一帮兄弟就在那边看着呢。");
	text = text.replace("I don\'t want no trouble.", "我不想惹上麻烦。");
	text = text.replace("We ain\'t keen on getting squirrely with sellswords.", "我们不想让一帮佣兵感到不安。");
	text = text.replace("We\'re here to rob travelers, no good travelers at that, choosing to rob a drunk!", "我们是来这里抢劫旅行者的，没有正常的旅行者会那样，选择去抢劫一个醉汉！");
	text = text.replace("Now why dontcha just get on down the road and we all leave without impasse upon our purposes.", "现在为什么我们不打破僵局，然后继续走我们的路，为了我们各自的目的。");
	text = text.replace("The crossbow crickets as its wood shakes in his loose grip.", "当弩的木头在他的轻握下晃了晃的时候，它响了。");
	
	//text = text.replace("You nod.", "你点头。");
	text = text.replace("Quite alright. I\'m assuming all that you got is counterfeit, aye?", "当然可以。我猜你的那些东西都是仿制品，对吧？");
	//text = text.replace("The man nods.", "这个人点头。");
	text = text.replace(/Of course\. The finest fitting counterfeit this side of (.*?) this is!/, "当然了。这是在 $1 这里最好的合身的仿制品！");
	text = text.replace("But enough chin wagging shenanigans.", "但是这种无聊的恶作剧已经够多了。");
	text = text.replace("Appreciate ya keeping this square, but we got work to do.", "感谢你能够保持克制，但是我们还有工作要做。");
	text = text.replace("Nodding again, you wish him luck in them doings.", "再次点了点头，你祝他们工作顺利。");
	
	text = text.replace("You look back at the company, then unsheathe your sword as you turn around.", "你回头看了看战队，然后在你转回来的时候一并拔出了剑。");
	text = text.replace("You swing it up and clip the crossbow and the man shoots it just over your shoulder.", "你把它举了起来，然后砍在了弩上，那人射击了，弩箭擦着你的肩膀飞了过去。");
	text = text.replace("You drive the blade down the slat of wood and cut the cords of the weapon and stab the steel into the man\'s chest.", "你把锋刃压了下来，绕过了板条直接砍断了弩弦，然后直接把剑刺入了男人的胸膛。");
	text = text.replace("He goes down easy and you hear men shout in the distance, but they\'re scared and scampering away.", "他顺理成章地倒下了，而你听见了不远处有一帮人在叫喊，但是他们是在尖叫，逃走。");
	text = text.replace("Thieves like this know not to fight with sellswords.", "像这样子的盗贼不知道该怎么和佣兵战斗。");
	text = text.replace("You collect whatever goods the man had already stolen up to this point.", "你拿走了那个人到目前为止偷走的所有的东西。");
	
	text = text.replace("You look back at the company, then unsheathe your sword as you turn around.", "你回头看了看战队，然后在你转回来的时候一并拔出了剑。");
	text = text.replace("You swing it up and clip the crossbow and the man shoots it just over your shoulder.", "你把它举了起来，然后砍在了弩上，那人射击了，弩箭擦着你的肩膀飞了过去。");
	text = text.replace("You drive the blade down the slat of wood and cut the cords of the weapon and stab the steel into the man\'s chest.", "你把锋刃压了下来，绕过了板条直接砍断了弩弦，然后直接把剑刺入了男人的胸膛。");
	text = text.replace("He goes down easy and you hear men shout in the distance, but they\'re scared and scampering away.", "他顺理成章地倒下了，而你听见了不远处有一帮人在叫喊，但是他们是在尖叫，逃走。");
	text = text.replace("Thieves like this know not to fight with sellswords.", "像这样子的盗贼不知道该怎么和佣兵战斗。");
	text = text.replace(/Unfortunately, the crossbow bolt that went over your shoulder struck (.*?)\. He\'ll survive, but it is a garish wound\./, "不幸的是，越过你肩膀的弩箭击中了 $1。他会活下来的，但是那是很严重的伤。");
	
	text = text.replace(/As you near the nobleman, his eyes go wide and he points at (.*?) the servant\./, "当你接近那个贵族的时候，他睁大了他的眼睛，他指着仆人 $1。");
	text = text.replace("Jast wait a sssec, I know youuu.", "只是等一下下，我认识你。");
	text = text.replace("You look back. He does?", "你看了看身后。他真的认识吗？");
	text = text.replace("The nobleman stumbles forward with his legs scissoring side to side.", "那个贵族用他那像剪刀一样岔开在两边的双腿摇摇晃晃的向前走着。");
	text = text.replace(/You were servant to my cousin in (.*?) one fine evening\./, "你是在 $1 的那个愉快夜晚，我表弟的一个仆人。");
	text = text.replace("You were great! The greatest. Greeaaatest. S-servant. Hargh.", "你做的很棒！你是最棒的。最棒的。仆人。哈。");
	text = text.replace("Well -hic- I dare say you can have all this shite cause I don\'t think -hic- we explained yee, sorry, paid ya.", "好吧-嗝-我觉得你可以把这些玩意都拿走因为我不觉得-嗝-我们给哩服了报酬，啊不是，我们给你付过了报酬。");
	text = text.replace("The man takes anything of value and throws it over.", "贵族卸下了所有值钱的东西，把它们都扔了过来。");
	text = text.replace("He seems happy just to be relieved of the weight of it all.", "他看起来很高兴，因为他从那些东西的重压下解放了出来。");
	text = text.replace("If ye see my c-cousin again, let, let him know that I killed his brother, with the, the, mantlepiece.", "如果你再一次遇见了我的-表弟，让，让他知道，我用，用，壁炉架，杀了他兄弟。");
	text = text.replace("No harsh -hic- feelings.", "一点也没觉得-残酷。");
	text = text.replace("Well alright then.", "就这些。");
	
	text = text.replace("As you approach the drunkard, a sharp whistle cracks across the path.", "当你接近那个醉汉的时候，一声尖锐的口哨声突然打破了路上的寂静。");
	text = text.replace(/You and the drunkard both look to see (.*?) the thief standing there with a weapon to the back of another man\./, "你和那个醉汉都看向了 $1，小偷站着，拿着一把武器对着后面的另一个人。");
	text = text.replace("That feller\'s no nobleman, and probably aint no drunk neither.", "那家伙不是贵族，甚至可能都没有喝醉。");
	text = text.replace("They\'re working together to either ambush travelers or threaten them with blackmail. They\'re robbers, sir.", "他们是在一起工作的，就是袭击旅人或者敲诈他们。他们是强盗，先生。");
	text = text.replace("You look back to see the man smiling nervously.", "你看了回来，却看到那个男人紧张地笑了。");
	text = text.replace("He explains with suddenly sharpened clarity.", "他用一种简明扼要的说法解释道。");
	text = text.replace("We\'d no interest in robbing sellswords, sir, I-I-I swear I was about to explain myself soon as I sawr yer swords.", "我们不想抢劫佣兵，先生，我-我-我发誓我正要向你解释，在我康到了你的剑之后。");
	text = text.replace(/(.*?) yells out, asking where the cache is\./, "$1 叫了出来，他问那些赃物都在哪里。");
	text = text.replace("You look back at the man and tell him to hand over everything he\'s stolen.", "你看回了那个人，告诉他让他把偷的所有东西都交出来。");
	text = text.replace("He nods and asks if you\'ll gut him if he refuses.", "他点了点头，并且问你如果他拒绝的话你会不会把他开膛破肚。");
	text = text.replace("You nod and tell him the gutting will come last, and by that point it\'ll be a relief.", "你点了点头，告诉他开膛破肚的整个过程会很漫长，而那时很让人放松。");
	text = text.replace("The man puts a little pep in his step.", "那家伙被吓得晃了晃。");
	text = text.replace("Yessir gotcha sir, right this way.", "好的先生明白了先生，都在这了。");

//horse_race_event.nut
	text = text.replace("You come across a man holding the reins of a lanky horse whose mangy mane has seen better days.", "你遇到了一个牵着一匹高瘦的马的缰绳的男人，那匹马的鬃毛污秽不堪，已经光彩不再。");
	text = text.replace("The horse has a grey beard forming and its got dry caliche lips smacking desperately for water.", "那马有着灰白色的胡子，它干裂，布满了白色钙质层的嘴唇使劲抽动着想要喝点水。");
	text = text.replace("Seeing you, its owner waves.", "看见了你，它的主人招了招手。");
	text = text.replace("Come, come! I\'ve a bet to make for those brave and fast enough to think they\'ll win it!", "来，来！我有个为那些足够勇敢、足够快，认为自己能够获胜的人的赌要打！");
	text = text.replace("Curious, you ask what the bet is.", "对此感到好奇，你问了他那个赌是什么。");
	text = text.replace("The man pats the horse, a plume of dust lifting on the pat and you can see his handprint on the shoulder.", "男人轻轻拍了拍那匹马，一片尘土因为这一拍飞了起来，并且你能够看到，他留下了一个掌印在马的肩膀上。");
	text = text.replace("Race m\'horse! Not with another horse, mind, but your humanly legs!", "和我的马赛跑！不是用别的马，忘了它吧，是用你人类的腿！");
	text = text.replace(/If you lose, you give me (.*?) crowns\./, "如果你输了，你就给我 $1 克朗。");
	text = text.replace("If you win, I\'ll pay you triple.", "如果你赢了，我给你双倍。");
	text = text.replace("You up for it?", "你准备好了吗？");
	
	text = text.replace(/You nominate (.*?) to try and see if he can best the beast\./, "你选了 $1 去试试，看看他能不能胜过那牲口。");
	text = text.replace("The race\'s rules are first to the apple tree and before you can even begin to root for the sellsword the horse smokes him completely.", "比赛的规则看谁第一个到一颗苹果树那儿去，但在你能为你的佣兵开始喝彩之前，马就完全打败了他。");
	text = text.replace("It gets to the finish line and begins fishing the branches for apples.", "它到了终点线，并且开始为了吃苹果而摆弄树枝。");
	text = text.replace(/The company is sitting completely silent, but when (.*?) crosses the finish line in a distant last place they roar with delight as though he just won the keys to the kingdom\'s finest whorehouse\./, "战队都沉默地坐着，但当 $1 以隔得很远的最后一名的身份冲过终点线的时候，他们都高兴地放声大笑，就好像他赢下了王国最好的妓院的钥匙。");
	text = text.replace("The horse\'s owner laughs.", "马的主人笑了。");
	text = text.replace("Don\'t be hard on yerself, kind sir.", "别为难自己，好心的先生。");
	text = text.replace("The fun is in the chance.", "快乐是偶然的。");
	text = text.replace("Indeed it seems the spectacle of the man\'s efforts entertained the company.", "看起来的确是那个人在精彩比赛中的努力使你的团队感到快乐。");
	
	text = text.replace(/(.*?) steps forward\. His calves bulge from his socks and he shoulder rolls to loosen up\./, "$1 走上前去。他的小腿将他的袜子顶的鼓了起来，他将肩膀转了转来放松。");
	text = text.replace("Yeah I\'ll race that sorry horse.", "好啊，我将会和那匹不咋样的马赛跑。");
	text = text.replace("The wager is made and the horse\'s owner directs you to a path.", "赌注已经下好了，马的主人把你领向了一条路。");
	text = text.replace("With the race set up, he holds up a pair of wooden tongs held apart, and backwards, by some tine.", "赛道已经准备好了，他拿着一双分开的木钳子，并且将其往后拉，通过一些尖头。");
	text = text.replace("When he cuts the rope, the tongs snap clap together and start the race.", "钳子咔嚓一声合上了，当他把绳子切断的时候，比赛开始了。");
	text = text.replace("Despite being looking like a wart left in the rain, the horse instantly gets a step on the nimble sellsword.", "尽管那匹马没精神得看起来就像个落汤鸡一样，但是它却立即领先了敏捷的佣兵一步。");
	text = text.replace("It\'s only halfway down the track does the mercenary\'s stamina seem to put him back in the race, but he ultimately fails at the finish line.", "只有在半路，佣兵的耐力才看起来让他占据了优势，只是他最终还是在重点线输掉了比赛。");
	text = text.replace("The owner claps his hands.", "马的主人拍了拍他的手。");
	text = text.replace("Oh, that was a close one!", "噢，这可真是很接近的一次比赛！");
	text = text.replace("The closest I\'ve seen!", "是我见过的最接近的一次！");
	text = text.replace(/You nod and pay the man what he is owed\. (.*?) was beaten, but despite that it seems the loss has bettered him in some regard and the company certainly enjoyed the spectacle\./, "你点了点头，并且给了他他应得的东西。$1 被打败了，但是尽管如此，看起来这次失败在某些方面上锻炼了他，并且战队也真的挺享受这场精彩的比赛的。");
	
	text = text.replace(/Feeling rather courageous, you nominate the fattest man in the company to handle the race\. (.*?) steps forward with an eyebrow raised, asking if you\'re sure about taking him as your horseracing champion\./, "感到相当的勇敢，你指派战团里最胖的人来解决这场比赛。$1 向前走了一步，挑了挑眉毛，问你是否真的确定把他选作你的赛马勇士。");
	text = text.replace("You hold your hand on his shoulder and say he\'s the fattest fark you\'ve ever seen being a sellsword, but that you believe in him.", "你把你的手放在他的肩上，并且说，他是你所见过的成为佣兵的人里最胖的，但是你相信他。");
	text = text.replace("You also believe the horse is a haggard draught animal that\'s on its last legs, but you keep that part to yourself.", "你还相信，那匹马是虚弱的只剩下一口气的动物，它的生命即将到头了，但是这句话你只在心里说了。");
	text = text.replace("The man and horse are put next to each other.", "人和马站到了一起。");
	text = text.replace("An apple tree stands in the distance and the first to it is the winner.", "一棵苹果树离得不远，第一个到达那里的将成为获胜者。");
	text = text.replace("With the rules laid out, the race is started.", "规则敲定了以后，比赛开始了。");
	text = text.replace(/It\'s not an especially close one\. (.*?) falls behind almost instantly and trundles down the track with his face beet red and huffing breath and the men nearly die laughing at the sight\./, "那不是一场很接近的比赛。$1 几乎是立即被拉在了后面，他缓慢而沉重的沿着赛道移动着，他的脸红的像甜菜根一样，气喘吁吁，大家几乎要因眼前的景象笑死。");
	text = text.replace("The fat sellsword and dire horse meet back up at the apple tree and there share the fruits of their labors.", "胖胖的佣兵和虚弱的马匹在苹果树后碰面了，在那儿他们分享了他们劳动的果实。");
	text = text.replace("You pay the horse\'s owner what he is owed.", "你付给了马匹主人他应得的。");
	text = text.replace("He smiles as he counts the coin.", "他一边数硬币一边微笑。");
	text = text.replace("Don\'t usually get a show with the race, sir.", "不要经常用这种赛跑来当节目，先生。");
	
	text = text.replace(/You elect (.*?), the company\'s biggest idiot, to be your horse racing champion\./, "你选择了 $1，战队里最大的白痴来当你的赛马勇士。");
	text = text.replace("The horse\'s owner takes one look at the man and raises an eyebrow.", "马的主人看了一眼那个人，随后便挑了挑眉毛。");
	text = text.replace("Well. Alright.", "好吧。好的。");
	text = text.replace("Rules of the race are clear: first to a distant apple tree is the winner.", "比赛的规则很清楚：第一个到达不远处的一棵苹果树的，就是胜利者。");
	text = text.replace("The man and animal line up on the track.", "人和马在赛道上站成了一线。");
	text = text.replace(/Pretending that he knows what he\'s doing, (.*?) crouches in a tri-pointed stance\./, "假装知道他自己在干嘛，$1 蹲出了一个三尖式。");
	text = text.replace(/The horse owner yells and slaps his beast on the buttocks\. (.*?) releases into a nice stride and shockingly gets ahead of the horse, but he\'s unable to handle his speed and tilts into the second lane and collides with the beast\./, "马的主人喊了一声，在他的牲口的臀部猛地拍了拍。$1 以一个漂亮的大跨步起跑，并且令人惊讶地跑在了马的前面，但是他在跑第二圈的时候不能很好地控制住自己的速度和倾斜角度，结果撞上了马匹。");
	text = text.replace(/The horse buckles at the knees and flips head over hind and (.*?) somehow ends up in the curve of its loins and on the flip around is catapulted through the air\./, "马双腿一软失了前蹄，而 $1 不知怎地撞进了它腰部的曲线中，在翻转中被抛上了天空。");
	text = text.replace("It\'s a damned sight and one you\'ll surely never see again.", "这一幕逊爆了，你确定以后再也不会再见到了。");
	text = text.replace(/The horse gets back to its feet and stares around confused while (.*?)\'s unconscious body flies over the finish line\./, "马匹重新站了起来，在 $1 无意识的身体飞过终点线的时候疑惑地四处看了看。");
	text = text.replace("You turn your palms to the horse owner whose hands are gripping his head.", "你把你的手掌伸向正在用手紧紧抱住自己头的马匹主人。");
	text = text.replace("By the old gods, man, are you not concerned for your sellsword?", "旧神啊，老兄，你不为自己的佣兵考虑考虑吗？");

//ijirok_1_event.nut
	text = text.replace(/(.*?) hails you down and says that there\'s something you should come take a look at\./, "$1 把你叫下来，说有些东西你应该来看一眼。");
	text = text.replace("Surely something that\'s out in all this ice and nothingness is worth seeing.", "毫无疑问，在这片冰天雪地中所隐藏的一些东西是值得一看的。");
	text = text.replace("The sellsword brings you to a cavernous hole in the ground.", "佣兵把你带到一个地底的洞穴。");
	text = text.replace("He lights a torch and steps into and you follow.", "他点燃火把，走了进去，你跟了进去。");
	text = text.replace("There at the bottom you find a few more of your men.", "在底下你发现了几个你的队员。");
	text = text.replace("They\'re standing around what looks like a sarcophagus made of ice, except there\'s no lid.", "他们站在一个看起来像冰做的石棺的周围，只是没有盖子。");
	text = text.replace("A frozen blackness cakes the edges of the container.", "黑色的冰冻物质在石棺边缘结成硬块。");
	text = text.replace("In the corner of the room is an icy corpse stuck to the wall.", "房间的角落的墙上贴着一具冰冷的尸体。");
	text = text.replace("His hands are at his sides and icicles of blood run from his wrists.", "他的双手垂在身体两侧，冰冷的血液从手腕流出。");
	text = text.replace("Adjacent to it is a pair of clothes hanging from icehooks, but there is no body attached.", "旁边是挂在冰钩上的一件衣服，但没有身体。");
	text = text.replace("A trail of blood leads from the clothes to the other man, then back out the cave.", "衣服上淌出一些其他人的血迹吸引了其他队员，然后引导他们走出了洞穴。");
	text = text.replace("I don\'t know what to make of this sir.", "我不知道这该怎么解释，先生。");
	text = text.replace("One mercenary says. You ask the men if they\'ve seen anything in their scouting, and you mean damn near anything.", "一个雇佣兵说道。你问他们是否在侦察中看到了什么，你指的是附近他妈的任何东西。");
	text = text.replace("But they all shake their heads no.", "但他们都摇头说不。");
	text = text.replace("If something was in that box then it is surely out now.", "如果石棺里有什么东西，那它肯定是出来了。");
	text = text.replace("You tell the men to get on out of the cave and back to camp.", "你告诉他们离开洞穴，回到营地去。");

//ijirok_2_event.nut
	text = text.replace("A blotch in the snowy wastes catches your eye.", "雪原上的斑点吸引了你的眼睛。");
	text = text.replace("With a couple of scouts you go out to see what it is, suspecting little more than perhaps an animal carcass or abandoned camp.", "你和几个侦察兵一起出去看它是什么，怀疑可能只是一具动物尸体或废弃的营地。");
	text = text.replace("Instead, you find a party of naked corpses with their bodies crouched as though they were sitting upon chairs.", "恰恰相反，你发现了一些赤身裸体的尸体，他们蜷缩着身体，就像坐在椅子上一样。");
	text = text.replace("They\'re in a close-knit circle, all facing inward, some with their hands out as if warming them at a fire.", "他们密密麻麻围成一个圈，个个脸朝内，有的伸出手来，仿佛在火炉旁取暖。");
	text = text.replace("You push one of the corpses.", "你推一具尸体。");
	text = text.replace(/As it tips back, the body sitting opposite raises up\. (.*?) jumps away\./, "当身体向后倾斜时，坐在对面的身体就会站起来。$1 向后跳去。");
	text = text.replace("By the old gods!", "旧神啊！");
	text = text.replace("A rim of flesh runs just beneath the powdered snow, and the ring connects one corpse to the other, a shared desecration beyond your understanding.", "粉末状的雪下刚好有一圈肉，一个环把一具尸体和另一具尸体连接起来，这是一种你无法理解的群体性亵渎行为。");
	text = text.replace("The skin runs inward, meeting at a fleshen fulcrum which rises out of the snow shaped like some macabre flower pot.", "他们的皮肤向内延伸，在一个从雪地里冒出来的像是一个可怕的花盆在血肉支点上汇合。");
	text = text.replace("Nothing is inside. One of the scouts demands a return to the safety of the company and you very much agree with him.", "里面什么都没有。其中一名侦察兵要求安全的返回战队，你非常同意他的意见。");

//ijirok_3_event.nut
	text = text.replace("While camping in the northern wastes, a silhouette approaches, a flat black whose appearance was seemingly cut out of the thin air itself.", "当我们在北部荒原宿营的时候，一个轮廓出现了，一个扁平的黑色物体，它的外形似乎是从稀薄的空气中切割出来的。");
	text = text.replace("As it nears, an orange glow blossoms from a horn of fire.", "当它接近时，橙色的光芒从一个火焰之角中绽放。");
	text = text.replace("The company draw their weapons for what shadowy figure could possibly be out here in all this nothing?", "战队拔出他们的武器，为应对可能出现的黑影或者虚惊一场？");
	text = text.replace("What \'something\' crosses such a wretched land?", "什么“东西”穿越了这么荒凉的土地？");
	text = text.replace("But you find it is just elderly man with a bald pate and bulbous, red nose.", "但你发现他只是一个秃头红鼻子的老人。");
	text = text.replace("If the snow could carve man from granite, this would be the look of its creation.", "如果能用雪把人从花岗岩上雕刻出来，那就是他的模样。");
	text = text.replace("The stranger passes through the camp with the company turning to him and yelling out, but not one sellsword goes near him.", "那个陌生人穿过营地，同伙们都转向他大喊大叫，但没有一个佣兵靠近他。");
	text = text.replace("He finally leans down and puts the horn to the ground and the snow extinguishes its fire.", "他终于俯下身，把号角放在地上，雪熄灭了它的火焰。");
	text = text.replace("Then he gets up and keeps going and soon disappears into the fog of night.", "然后他起身继续走，很快就消失在夜色中。");
	text = text.replace(/(.*?) picks up the horn and tips it over\./, "$1 捡起号角，把它翻转过来。");
	text = text.replace("A rose falls out and its clear even in the dark that the petals are soft, but already curling to the brutal cold.", "一朵玫瑰凋谢了，即使在黑暗中，它的花瓣也是透明的，柔软的，但已经在严寒中卷曲。");
	text = text.replace("You look around for the old man and see his tracks still fresh in the powder.", "你四处寻找那位老人，发现他的足迹仍未消失。");

//kings_guard_1_event.nut
	text = text.replace("The snowy wastes are home to not much of anything, so to find a man half-naked in its frigid geography is rather unusual.", "在这片白雪皑皑的荒原上什么东西也没有，所以在这片严寒的土地上发现一个半裸的人是很不寻常的。");
	text = text.replace("That he is actually alive even more so.", "他甚至还活着。");
	text = text.replace("You crouch beside him.", "你蹲在他旁边。");
	text = text.replace("His eyes are hollow and rime frosts make blinking them a struggle.", "他的眼睛是空洞的，寒霜使他眨眼睛变成一种挣扎。");
	text = text.replace("His lips are jagged and purple.", "他的嘴唇褶皱着，冻成了紫色。");
	text = text.replace("His nose a deep red bordering on black.", "他的鼻子是深红色的，近乎黑色。");
	text = text.replace("You ask if he can speak. He nods.", "你问他是否会说话。他点头。");
	text = text.replace("Barbarians. Took. Me.", "野蛮人。带上。我。");
	text = text.replace("You ask where his kidnappers are.", "你询问绑架他的人在哪里。");
	text = text.replace("He shrugs and continues his cold cadence.", "他耸耸肩，继续他那冷冰冰的调子。");
	text = text.replace("They. Got. Bored. And. Left.", "他们。觉得。烦了。然后。走了。");
	text = text.replace("It does seem in tune with the primitives to up and leave a prisoner in the ice.", "把一个俘虏留在冰天雪地里，这似乎禽兽不如。");
	text = text.replace("He explains that he was once a sturdy swordfighter.", "他解释说他曾经是一个强壮的剑士。");
	text = text.replace("A smile squeezes  through the pain.", "他在痛苦中挤出一丝微笑。");
	text = text.replace("A. King\'s. Guard. In. The. Kingless. Land. Things. Could. Be. Worse?", "一个国王的。卫士。在。这个。没有国王的。土地。事情。会。更糟吧？");
	
	text = text.replace("You pat the man on his head, but tell him it\'s already over. He nods.", "你拍了拍他的头，但告诉他一切都结束了。他点头。");
	text = text.replace("Speak. For. Yourself. Mercenary.", "说给。你自己吧。雇佣兵。");
	text = text.replace("He smiles again, but this time it does release.", "他又笑了，但这次是一种释放。");
	text = text.replace("It sticks. Literally. And he leans forward and his eyes are open and do not blink and in this state he is gone.", "他挺立起来。铿锵有力。身体前倾，眼睛睁着，不眨眼，就这样死了。");
	text = text.replace("You get the men back on the road, or what one can make of a road in these snowed stretches.", "你让士兵们回到道路上，或者说是雪原上的道路。");
	
	text = text.replace("The nearly frozen man joins the company.", "那个几乎冻僵的人加入了战队。");
	text = text.replace("He\'s a ragged wreck, but if what he said is true maybe he will someday become the fighter he could barely speak of.", "他是一个衣衫褴褛的废物，但如果他说的是真的，说不定有一天他会成为一个战士，就像他之前说的那样。");

//kings_guard_2_event.nut
	text = text.replace(/You find (.*?) stretching about with surprising limberness\./, "你发现 $1 展示了不可思议的灵巧程度。");
	text = text.replace("He looks nothing at all like the freezing, frigid man you found abandoned in the ice by those barbarians.", "他看起来一点也不像那个被野蛮人遗弃在冰天雪地里的冻僵的人。");
	text = text.replace("Spotting you, he nods and comes over with a quiet voice.", "看到你，他点头走过来，低声说。");
	text = text.replace("I\'m glad you trusted in me, captain.", "我很高兴你信任我，队长。");
	text = text.replace("Perhaps you did it out of the kindness of your heart, but I need to show you something.", "也许你是出于好心，但我需要给你看样东西。");
	text = text.replace("He flashes an emblem you have heard referenced many times, but have never seen: it carries the sigil of the King\'s Guard and its pristineness is such that there is no way it could have been a farce.", "他拿出一个你已经听过很多次，但从未见过的徽章：它是国王的护卫的徽章，它是如此的真实以至于这不可能是一场闹剧。");
	text = text.replace("The man smiles at you.", "这个人对你微笑。");
	text = text.replace("I think I am in good health and ready to serve you as I did my liege.", "我想我很健康，准备像侍奉我的君主一样侍奉你。");
	text = text.replace("The kings of these lands have long since fallen, replaced by squabbling lords and nobles.", "这些土地上的国王早已倒台，取而代之的是争吵不休的领主和贵族。");
	text = text.replace(/If this man can fight for you as he did for the kings, then the (.*?) has brighter days ahead surely\./, "如果这个人能像为国王那样为你而战，那么 $1 一定会前途光明。");

//lone_wolf_origin_depressing_lady_event.nut
	text = text.replace("You come across an old woman outside of the home of a nobleman.", "你在一个贵族的房子外面碰到一个老妇人。");
	text = text.replace("She sizes you up as though she were looking into her own past.", "她对你的评价就好像她在回顾自己的过去。");
	text = text.replace("Amused, you ask her what it is she wants. The lady smiles.", "有趣的是，你问她想要什么。这位女士微笑。");
	text = text.replace("What is it you think you\'re doing, exactly?", "你真的知道你在做什么吗？");
	text = text.replace("Wandering the land as a hedge knight, killing and slaying and farkin\' the ladies now and again?", "像个雇佣骑士一样在这片土地上游荡，一次次地杀戮、屠杀、强奸女人们？");
	text = text.replace("Politely, you inform her that you are in fact not just some tournament hopper, but a bonafide sellsword.", "你礼貌地告诉她，你实际上不只是一个经常找乐子的人，而是一个真正的佣兵。");
	text = text.replace("She shrugs and throws her hand to a nobleman\'s house.", "她耸肩，把手伸向一位贵族的房子。");
	text = text.replace("And what of it?", "那又怎么样呢？");
	text = text.replace("They\'ll never accept you.", "他们永远不会接纳你。");
	text = text.replace("You\'ll be a fighter.", "你会成为一名战士。");
	text = text.replace("You\'re out here, forever.", "你不属于这里。");
	text = text.replace("You only go inside when they let you.", "你只有在他们允许的情况下才能进去。");
	text = text.replace("This is not a world you can improve yourself in.", "这不是一个你可以自我升华的世界。");
	text = text.replace("You are what you are born as.", "。");

//lone_wolf_origin_squire_event.nut
	text = text.replace("The pub is full of drunk denizens sloshing about, cheering, singing, carousing with the womenfolk of either wench or wife or whore.", "酒吧里到处都是醉醺醺的人，他们在那里晃荡，欢呼唱歌，与女人们狂欢作乐，其中包括女仆、太太、妓女等等。");
	text = text.replace("A man with a lute dances and plays and another with metal cymbals crashes overhead while a fat man booms with songs of battles or love, and whether a tale of victory or defeat they provoke rounds of ale and more merriment all the same.", "一个拿着琵琶的人在跳舞和演奏，另一个拿着金属钹的人在头顶轰鸣，而一个胖子则高唱着战争或爱情的歌曲，无论胜利还是失败的故事都能激起一轮又一轮的共饮啤酒和更多的欢乐。");
	text = text.replace("You leave the pub and enter the next building over.", "你离开酒吧，进入另一栋建筑。");
	text = text.replace("The wind whistles down a pew filled nave as you stand at the door.", "当你站在门口时，风呼啸着吹过满是长凳的教堂中殿。");
	text = text.replace("A man sweeping the stone floor looks up for a time then continues with his work.", "一个人扫着石头地板，抬头看了一会儿，然后继续工作。");
	text = text.replace("Another man cheerfully crosses the room and asks if you\'d like to pray.", "另一个男人高高兴兴地穿过房间，问你是否愿意祈祷。");
	text = text.replace("You decline and he purses his lips and crosses his arms.", "你拒绝了，他噘起嘴唇，交叉双臂。");
	text = text.replace("The crowd next door roars with drunken delight as though to make a mockery of you both and then he moves on.", "隔壁的人群醉醺醺地欢声笑语，好像在嘲笑你们俩，然后那人走了。");
	text = text.replace("You stay for a moment longer and then leave and go back out to the town center and squat on a series of steps.", "你再多呆一会儿，然后离开，回到城镇中心，蹲在一系列的台阶上。");
	text = text.replace("It seems there used to be a statue at the top of those steps, but vandals and raiders alike have made short work of another\'s artisanry.", "那些台阶的顶端似乎曾经有过一座雕像，但破坏者和掠夺者等人很快就攫取了别人的手艺。");
	text = text.replace("You fall asleep there at the foot of impermanence.", "徘徊了一会儿，你就在那儿睡着了。");
	text = text.replace("Waking from a nap, you find a young man at the bottom of the steps.", "中午你才醒来，你发现一个年轻人站在台阶的底部。");
	text = text.replace("He says he knows you\'re a knight and he\'s come to offer his services as a squire.", "他说他知道你是个骑士，他是来当扈从的。");
	
	text = text.replace("The man shakes his head no.", "那人摇了摇头不。");
	text = text.replace("Ain\'t never killed no one, sir.", "我没有杀过任何人，先生。");
	
	text = text.replace("The man stands up straight.", "这个男人站直了。");
	text = text.replace("I know how to sharpen steel and mend leather.", "我知道怎样打磨钢铁和修补皮革。");
	text = text.replace("I can disassemble and reassemble heavy and light armors both, no matter how complex or simple, and I can do it fast.", "我可以拆装重甲和轻甲，无论多复杂或多简单，我都可以快速完成。");
	text = text.replace("If we have a horse.", "如果我们有一匹马。");
	text = text.replace("You interrupt.", "你打断他。");
	text = text.replace("I walk.", "我走了。");
	text = text.replace("Shifting uneasily on his feet, the man continues.", "不安地站了起来，他继续说下去。");
	text = text.replace("Alright. Well I can cook.", "好的。我可以做饭。");
	text = text.replace("I can cook a fine meal whether I got the ingredients or not.", "我厨艺不错，不管我有没有配料。");
	text = text.replace("I make do. And. And. That\'s. That\'s about it.", "我行的。而且。而且。就。就这些了。");
	text = text.replace("But I\'m willing to learn!", "但是我愿意学习！");
	
	text = text.replace("You ask the man his name. He swallows nervously.", "你问那个人他的名字。他紧张地吞吞吐吐。");
	//text = text.replace(/(.*?), sir\./, "$1，先生。");
	//text = text.replace("You nod.", "你点头。");
	text = text.replace("Well alright then. I\'ll take ya with me.", "还不错。以后你跟我。");
	//text = text.replace("He smiles.", "他笑了。");
	text = text.replace("That\'s. That\'s it?", "真的。真的么？");
	//text = text.replace("You nod.", "你点头。");
	text = text.replace("Yeah. That\'s it.", "是的，就这样。");
	text = text.replace(/(.*?) looks around\./, "$1 环视四周。");
	text = text.replace("Well. Alright. What now?", "好吧。好的。现在该做什么？");
	text = text.replace("You lean back against the stone steps.", "你靠在石阶上。");
	text = text.replace("You follow me. Right now I\'m gonna take another nap.", "你跟我来。现在我要再睡一会儿。");
	text = text.replace("If yer still around when I wake, well, then you\'ve passed your first test. Defeating boredom.", "如果我醒来时你还在我身边，那么，你已经通过了你的第一次测试。战胜无聊。");
	text = text.replace("The squire is grinning ear to ear.", "扈从笑得合不拢嘴。");
	text = text.replace("He\'s still there when you wake.", "当你醒来时，他还在那里。");
	
	text = text.replace("You look at the would-be squire long and hard and then tell him no. He shrugs.", "你久久地注视着那个想要成为扈从的人，然后对他说不。他耸耸肩。");
	text = text.replace("Just so you know, you ain\'t gotta be alone in this world.", "我想让你知道，你在这个世界上并不孤单。");
	text = text.replace("Loneliness has no presence. It is not a place. It is not a being. It is action!", "孤独从未存在，它无处可寻，它无形无影，而是一种人生方式！");
	text = text.replace("Spitting, you wipe your face and laugh.", "你吐了口唾沫，擦了把脸，然后大笑。");
	text = text.replace("Is that what you tell yourself every morning?", "你每天早上都是这么对自己说的吗？");
	text = text.replace("Get out of here.", "离开这里。");

//raiders_origin_redemption_event.nut
	text = text.replace(/(.*?) is a monk who, by this point, is very, very far from his home\./, "$1 是一个僧侣，在这一点上，已经非常、非常远离了他在家时的样子了。");
	text = text.replace("The days on the road alone are hard enough, and the days off it being filled with violence and pillaging even worse so.", "独自漂泊的日子已经够苦了，而在路上的日子充满了暴力和掠夺，甚至更糟。");
	text = text.replace("It\'s no surprise that he has come to you with an offer.", "他主动来找你提出要求，这并不奇怪。");
	text = text.replace("Despite being with your company for some time now, it is clear that he is still a man of civilization.", "尽管在战队已经有一段时间了，但很明显，他仍然是一个文明人。");
	text = text.replace("He explains an old law: as a raider you are persona non grata, but as a raider with a lot of money there is a chance you can buy your way back into dealing with the nobles of this land.", "他解释了一条古老的法律：作为一名掠夺者，你是不受欢迎的人，但作为一名拥有大量金钱的掠夺者，你仍有机会以自己的方式重新与这片土地上的贵族打交道。");
	text = text.replace("The monk says he knows whose palms to cross.", "僧侣说他知道谁掌权。");
	text = text.replace(/Apparently, (.*?) is interested in \'opening channels\', and they would just appreciate (.*?) crowns to settle into new affairs. Civilized indeed\./, "显然，$1 对“开辟新渠道”很感兴趣，他们想要 $2 克朗来适应新事物。确切说是文明。");
	
	text = text.replace("You agree to the monk\'s notions.", "你同意僧侣的意见。");
	text = text.replace("Together, you meet with an intermediary and one of the nobles himself.", "你遇到一个中间人和一个贵族，聚在一起。");
	text = text.replace("The meeting takes place in secret and at first there is a lot of dramatic cloak and dagger nonsense.", "会议是秘密进行的，一开始有很多戏剧性的唇枪舌剑的废话。");
	text = text.replace("Men wearing black and keeping their hands to their weapons, nobles whispering to one another, but after it\'s all said and done... you have a good long drink together.", "男人穿着黑衣服，双手拿着武器，贵族们互相窃窃私语，但当一切尘埃落定之后…你们一起喝了个痛快。");
	text = text.replace(/In the future, (.*?) will be more open to dealings\./, "在未来，$1 将会开放更多贸易。");

//rangers_origin_hunt_food_event.nut
	text = text.replace(/Being the collection of hunters that you are, it becomes readily apparent that you\'ve entered some fine hunting grounds. (.*?) suggests the company go for a hunt, though he warns the group should be mindful of just how much they pluck from these bountiful stretches\./, "作为猎人圈子中的一员，很明显你已经进入了一个良好的狩猎场。$1 建议战队去狩猎，但他警告说，团队应该重视适度猎杀这些丰富的猎物。");
	
	text = text.replace("The men are ordered to go on a hunt and they take an inch a mile!", "这些人奉命去打猎，他们得寸进尺！");
	text = text.replace("They shoot and strip and slaughter just about everything breathing animal in range.", "他们射杀，掠夺和屠戮几乎所有能呼吸的动物。");
	text = text.replace("You\'re wary of this leading to the attention of local nobles, but they are none the wiser.", "你担心这会引起当地贵族的注意，但他们一点也不知道。");
	text = text.replace("Inventory stores will be brimming!", "商店的库存马上就会爆满的！");
	
	text = text.replace("A few of the men depart on the hunt and return with a couple of kills.", "几个人出发去打猎，回来的时候带回几个猎物。");
	text = text.replace("You ask if they ran into any trouble and they shake their heads no.", "你问他们有没有遇到什么麻烦，他们摇摇头说没有。");
	text = text.replace("Looks like the inventory will see some tasty additions and no nobleman will be any wiser!", "看起来存货中会补充一些美味，贵族也没那么聪明！");
	
	text = text.replace("An hour or so after sending the men off on a hunt, they return.", "大约一个小时后，这些人出去打猎，他们回来了。");
	text = text.replace(/Except they\'re dragging a bloodied and shredded (.*?) back into camp\./, "只是他们拖着一个血肉模糊的 $1 回到营地。");
	text = text.replace("They report the group had crossed paths with a momma brown bear.", "他们报告说，这群人遇到了一只母棕熊。");
	text = text.replace("Her fight was tremendous, and she only stopped mauling the wounded poacher because one of the men threatened her babies with a torch.", "她的战斗非常激烈，之所以她停止殴打受伤的偷猎者，是因为一个队员用火把威胁她的孩子。");
	text = text.replace(/You\'re happy the men are all alive, albeit (.*?) is going to require a long time to recover\./, "你很高兴那些人都还活着，尽管 $1 需要很长一段时间才能恢复。");

//sled_race_event.nut
	text = text.replace("As the snow and stiff winds beat down upon your face, it seems almost miraculous that there\'s someone on this mountain waving you down.", "当凌冽的寒风夹裹着雪花拍打在你脸上时，似乎有人在山上向你招手示意，这简直难以置信。");
	text = text.replace("But there he is, a bearded fella with two sleds in hand.", "但就在那，手里拿着雪橇留着胡子的家伙。");
	text = text.replace("He yells out if you\'re interested in a race.", "他大声问你是否对比赛感兴趣。");
	text = text.replace("First one to split them two rocks shaped like cocks is the winner!", "谁先到那个鸡头型断崖的石头那谁就赢！");
	text = text.replace("You ask what it is that\'s on the line.", "你问玩这危险游戏干嘛。");
	text = text.replace("When he looks at you like a dog spoken to in the wrong language, you ask what you\'re betting. He laughs.", "他像说错话的狗一样看着你，随后你问他赌什么。他笑着说。");
	text = text.replace("Ain\'t no bet! Just a matter of fun!", "不赌什么！只是为了好玩！");
	text = text.replace(/Fair enough\. Maybe one of the (.*?) would like to try\?/, "足够好了。也许 $1 想试试？");
	
	text = text.replace(/(.*?) takes the sled from the mountain man\./, "$1 从山地人那拿过雪橇。");
	text = text.replace("I\'ll beat ya to them rock dicks in proper time.", "我会在适当的时候把你打败。");
	text = text.replace("Everyone raises an eyebrow as he sets the sled down.", "当他固定好雪橇时，大家都纷纷挑了挑眉毛。");
	text = text.replace("He jacks his boots against its front and tips it toward the edge of the hillside.", "他把雪橇前头翘起来身子向着坡道倾斜。");
	text = text.replace("Ready when you are.", "准备好了。");
	text = text.replace("The mountain man gives a signal to start the race and the two zip down the snow in an instant.", "山地人发出信号，两人立即开始了比赛。");
	text = text.replace(/You\'re not sure if your sellsword played cheap, but the mountain man suddenly turns sideways and flips his sled and he goes rolling through the powder in a flail of beard and limbs\. (.*?) meanwhile coasts to an easy victory\./, "你不确定你的人是否做了手脚，但是山地人突然偏离了赛道人仰马翻地摔了出去，雪沾了一身。与此同时 $1 轻松取得了胜利。");
	text = text.replace("The company roars to the victory and carry him up the mountain on their shoulders.", "你的人欢呼着胜利并把他高举过头顶。");
	text = text.replace("If the mercenary did cheat it doesn\'t show on the mountain man\'s face, he is just happy to have had raced at all.", "但如果你的人真作弊了，那在山地人的脸上是看不出来的，他只是很高兴他参加了比赛。");
	
	text = text.replace(/(.*?) takes the sled from the mountain man\./, "$1 从山地人那拿过雪橇。");
	text = text.replace("I\'ll beat ya to them rock dicks in proper time.", "我会在适当的时候把你打败。");
	text = text.replace("Everyone raises an eyebrow as he sets the sled down.", "当他固定好雪橇时，大家都纷纷挑了挑眉毛。");
	text = text.replace("He jacks his boots against its front and tips it toward the edge of the hillside.", "他把雪橇前头翘起来身子向着坡道倾斜。");
	text = text.replace("Ready when you are.", "准备好了。");
	text = text.replace("The mountain man gives a signal to start the race and the two zip down the snow in an instant.", "山地人发出信号，两人立即开始了比赛。");
	text = text.replace(/Rooster tails of powder shower in their wake and it seems like (.*?) is going to win until he angles incorrectly and smashes right into one of the rock cocks\./, "快到鸡尾型断崖末端的时候比赛仍十分胶着，眼看 $1 就要获胜的时候，因滑行角度失误直接撞上了那石头。");
	text = text.replace("The sled shatters to pieces and the sellsword goes flying over the stone and lands limply into the snow.", "雪橇撞成了碎片，这家伙从石头上飞了过去，幸好落在了松软的雪堆里。");
	text = text.replace("Laughing, the company rushes to his aide and brings him back to his feet.", "你的人大笑着跑过去帮他重新站起来。");
	text = text.replace("He\'s got some raspberries and something is clicking, but he\'ll live.", "他喘着粗气可能什么地方摔断了身上咔嗒作响，但他还活着。");
	text = text.replace("The mountain man cheers.", "山地人欢呼雀跃。");
	text = text.replace("Ye almost had me, but yer s\'posed to split the dicks, not ride up them!", "你差点就干翻我了，但你的目标应该是停在鸡尾型断崖的石头那，而不是干上去。");
	text = text.replace("This brings your men to their knees in crying laughter.", "这让你的人哭笑不得。");
	
	text = text.replace(/(.*?), the fattest man in the company, elects to give it a try\./, "$1 这是战队手里最胖的人，他决定试试。");
	text = text.replace("You like his chances - given his weight it\'s likely he\'ll blow right down the mountainside.", "你觉得不错－考虑到他的体重他可能会直接冲到终点。");
	text = text.replace("The mountain man readily accepts the challenge, sets the ground rules, and starts the race proper.", "山地人欣然接受比赛，制定好规则后比赛正式开始。");
	text = text.replace("The two rip through the snow with ease and, just as you thought, the fat man roars through the powder like lightning through a cloud.", "两人轻松地在雪地穿梭，正如你想的一样，胖子在溅起的雪花中咆哮，就像闪电穿云一样壮观。");
	text = text.replace("But he doesn\'t seem to slow.", "他速度惊人。");
	text = text.replace("He plows right between the two cock rocks, signaling his win, but he\'s unable to seize the reins or slow down.", "胖子乘风破浪越战越勇，但没法刹车减速了。");
	text = text.replace("He barrels over an escarpment and that\'s about the last of you see of him.", "他从悬崖上疾驰而过，人就这么没了。");
	text = text.replace("The mountain man grimaces and runs toward the hillside.", "山地人跑过来做个鬼脸。");
	text = text.replace("He\'s alive! Little busted up, but alive!", "他还活着！身体可能缺了点什么，但还活着！");
	text = text.replace("Though you\'re mightily concerned, you look back to see that the company whole is doubled over or on their knees choking with laughter.", "虽然你非常担心，但当你回头的时候，你发现你的人要么笑趴在地要么哭笑不得。");
	
	text = text.replace(/(.*?) volunteers to race the mountain man\./, "$1 愿意跟山地人比比。");
	text = text.replace("You are reluctant to allows that, given the sellsword\'s poor eyesight, but he is pretty diligent about the matter.", "考虑到他是个近视眼，你不太愿意让他参加，但他在这事儿上表现的挺积极的。");
	text = text.replace("As he squats on the sled and takes up the reins you can\'t help but notice that he is already squinting downhill as though he wouldn\'t tell a mountainside from a red barn.", "当他坐在雪橇上开始绑绳子，不断向山下瞥的时候，你不由得担心起来他能不能分清楚石头和雪堆的区别。");
	text = text.replace("Ready!", "准备！");
	text = text.replace("The mountain man sets the rules and starts the race.", "山地人定完规则比赛就开始了。");
	text = text.replace("Almost immediately the shortsighted sellsword veers off course.", "近视眼几乎一开始就偏离了赛道。");
	text = text.replace("Thankfully he\'s not even full speed when he slams head first into a rock formation.", "他的头一下子就撞上了一块石头，但谢天谢地，他还没起速。");
	text = text.replace("The sled shatters like a tomato against a pillory and the man himself pancakes against the stone.", "雪橇就像砸在墙上的西红柿一样摔碎了，近视眼就像馅饼一样撞在石头上。");
	text = text.replace("You rush to his aide and get him to his feet, but there you find your foot stepping on something metallic.", "你跑过去帮他站起来，但你突然觉得你的脚下好像踩着什么很硬的玩意。");
	text = text.replace("A treasure chest! You tell the company to get the man some proper help while you dig out what you can.", "一个宝箱！你叫你的人来照顾他然后你拼命的开始挖。");

//traveler_north_event.nut
	text = text.replace("You come across a man beside a hole in the ice.", "你在冰窟旁边遇见一个人。");
	text = text.replace("He\'s got a fishing pole next to him and, despite the environment, welcomes you warmly.", "他身旁有一根钓竿，尽管环境恶劣，他对你还是很热情。");
	text = text.replace("Care to have a chat, traveler?", "想聊聊吗，旅行者？");
	text = text.replace("You don\'t seem to be from these parts.", "你看起来不像本地人。");
	text = text.replace("A man wearing bear fur is cutting a hole in the ice.", "一个披着熊皮的人正在凿冰。");
	text = text.replace("He looks at you just as the rim of his cuts drops and he punches it into the water.", "他凿的冰块掉恶狠狠地掉在水面上，就像他看你的眼神一样。");
	text = text.replace("Come traveler, take ease beside me for a time. I\'m harmless.", "来吧，别紧张聊一会。我没恶意。");
	
	text = text.replace("You ask the man if the North has seen any devastating wars. He shrugs.", "你问他北方是否经历过毁灭性战争。他耸耸肩。");
	text = text.replace("Aye, we\'ve our differences.", "嗯，我们之间有分歧。");
	text = text.replace("This spat and that.", "又是这样又是那样。");
	text = text.replace("But a century ago a collective of warriors was formed to defeat a horde of undead.", "但一个世纪以前，由勇士组织起来的一支战队打败了一群亡灵。");
	text = text.replace("Ohh ya, see it in yer eyes that ye didn\'t know that one.", "噢呀，你的眼神告诉了我你的无知。");
	text = text.replace("It is likely that if they were defeated the walking corpses would have flooded south and killed you all.", "如果他们被打败了，很有可能那些亡灵就会涌向南方杀光你们。");
	text = text.replace("You\'re welcome. Bet they don\'t teach that in your fancy southern scripts.", "不用客气。我敢打赌僵尸不是去教你读南方花哨故事的。");
	text = text.replace("The man snorts and nods at the fishing pole.", "这人对着钓竿哼了一声点头。");
	text = text.replace("They say there\'s large fish down under there.", "别人说这下面有一条大鱼。");
	text = text.replace("Harmless ones, but big enough to spur the imagination.", "没攻击性，但是大的超乎想象。");
	text = text.replace("I can\'t say I\'ve seen them in the flesh, but there was a time when a large shadow passed beneath my feet, passed right there through the waters, and it passed and passed, felt like forever.", "我不敢说我亲眼见过，但是有一次，一个巨大的影子从我脚下穿过，就在那边，它游来游去，感觉时间停止了。");
	text = text.replace("And then it was gone.", "然后它就消失了。");
	text = text.replace("You ask how he thinks it a harmless beast. He shrugs.", "你问他是怎么知道它没攻击性呢。他耸耸肩。");
	text = text.replace("Cause it didn\'t do nothing but go from there to there and onward still.", "因为它什么也没做，只是从这到那然后继续游。");
	text = text.replace("The man tests a fishing pole then crouches on his haunches.", "这个人试了试钓竿，接着他蹲下来。");
	text = text.replace("He nods across the ice.", "他在冰上点头示意。");
	text = text.replace("Ol\' white bears will cross these stretches.", "白熊会穿过那些地方。");
	text = text.replace("Gotta keep your mind out for \'em.", "你要小心点。");
	text = text.replace("A bit of fire will fend them off, that or you dump your fish and make a run for it.", "一点火星子就能把熊挡开，不然你就把鱼扔掉，撒腿开溜。");
	text = text.replace("I\'d known a man who got eaten by a white bear.", "我认识一个被白熊吃掉的人。");
	text = text.replace("They said it ate him from legs up, giving no shits about his screaming and hollering.", "听说熊从他的腿开始吃，对他的抓喊尖叫毫不在乎。");
	text = text.replace("I\'d sooner slit my own throat than let one of them beasts get a hold of me.", "我宁愿割破自己的喉咙，也不愿让那些畜生抓住我。");
	text = text.replace("A friendly enough fellow, the man rests beside his fishing poles and speaks to the nature of his own people.", "这个人很友好，坐在钓竿旁很放松地跟大家伙说话聊天。");
	text = text.replace("I\'d been close enough south to know you think us savages.", "我离南方很近，知道你们觉得我们是野蛮人。");
	text = text.replace("That\'s quite alright, but there\'s more to it than that, or less I suppose.", "这很好，但很重要的一点是，我们的资源很少。");
	text = text.replace("We got less. Far less.", "非常少。少的可怜。");
	text = text.replace("And make do with it anyhow.", "不管怎样都要凑合活下去。");
	text = text.replace("You remark that northerners frequent the south only to rape and pillage what it has. The man shrugs.", "你说北方人频繁来南方只是为了抢劫。那人耸耸肩。");
	text = text.replace("And you send war parties north to treat us to a sense of southern justice.", "你们把战争送到北方，让我们感受来自南方的正义。");
	text = text.replace("Seems fair enough. Nobody\'s doing nothing that don\'t have a bit of retribution hanging there clear as day to see.", "看起来不错。没人可以为所欲为而不受惩罚。");
	text = text.replace("We\'re all on level.", "万物守恒。");
	text = text.replace("As you set beside the man he catches a fish and yanks it onto the ice.", "当你坐在这家伙旁边时，他抓住一条鱼并把它拉上来。");
	text = text.replace("He grasps it with a fur-gloved hand and smashes its head to stop its flopping.", "他用带着皮手套的手抓住它，然后猛击鱼的头，直到鱼停止扑腾。");
	text = text.replace("He talks as he guts and salts it.", "他边说边把鱼的内脏掏掉然后撒上盐。");
	text = text.replace("Some of the northerners figured out a way to tame them giants, the unholds I think you call them.", "一些北方人想出一个办法来驯服这些巨人，我想你们称呼他们为释放者。");
	text = text.replace("Don\'t ask me how.", "别问我怎么做的。");
	text = text.replace("Anytime I\'d heard of a giant going anywhere all it did was kill anyone in its path and eat all the livestock.", "每当我听到一个巨人去什么地方，它所做的就只是杀掉或吃掉路上的任何牲畜。");
	text = text.replace("The man snorts and tests his fishing rods and sighs when there\'s no pull.", "这个人哼了一声，看了看他的钓竿，没有鱼上钩他又叹了口气。");
	text = text.replace("I went south a few years back.", "我几年前去过南方。");
	text = text.replace("Stayed there a few years just as well.", "我也在那待了几年。");
	text = text.replace("That\'s how I know your tongue so well.", "这就是我了解你口味的原因。");
	text = text.replace("When I was down that way, I tasted what you call vegetables.", "我在那的时候尝了你们称之为蔬菜的东西。");
	text = text.replace("Disgusting things, truly, and the south wonders how we grow so big and strong up there in these wastes?", "真够恶心的，你们想知道我们是怎么长得这么壮的？");
	text = text.replace("I\'ll tell ya, we can\'t grow no fucking vegetables.", "我告诉你，我们不能种那该死的蔬菜。");
	text = text.replace("Only thing we eat has to die and nothing with a heartbeat is willing to die easy.", "我们只有把活着的东西杀死吃掉，才能让我们的心脏强壮地成长。");
	text = text.replace("The friendly northern fisherman tells you stories of how the tribes come and go.", "友好的北方渔民给你讲述了部落的三三两两。");
	text = text.replace("I\'ll say this much, we\'re only run by the strong, but a strong man is only as good as his health and constitution.", "我想说的是，我们只由强者统治，但强者的健康和体质决定了一切。");
	text = text.replace("When he gets old, he loses both.", "当他老了，他就失去了一切。");
	text = text.replace("When he gets old, he therefore loses.", "当他老了，他就输了。");
	text = text.replace("And so the new strong man comes to power, and with it a shattering of the tribe\'s history and successes.", "于是，新的强者掌权，部落的成功与历史随之改写。");
	text = text.replace("I do in part envy the southerner\'s sense of greater purpose, and the southerner\'s ability to hide his power, to stock it at arm\'s length so that others must do more than just swing a sword to get it from him.", "我的确有点羡慕南方人有更大的使命感，也羡慕你们有能力隐藏自己的权力，使自己与他人保持一定距离，这样其他人除了挥剑还需要做的更多才能夺走他的权力。");
	text = text.replace("I tell you this in truth, and only here, as far away from my countrymen as I can be.", "说句实话，就在这，离我的同胞越远越好。");
	text = text.replace("You\'ll never hear me say any of this around no ordinary campfire, understand?", "一般情况下我绝不会说这些，你明白吗？");

//wild_dog_sounds_event.nut
	text = text.replace(/As the company camps, (.*?) stops stropping a blade and looks up\./, "营地里 $1 停下了手里的活并仔细聆听着什么。");
	text = text.replace("Y\'all hear that?", "都听到那东西了吗？");
	text = text.replace("You do. Wild dogs are yipping and howling.", "是的。野狗在歇斯底里的狂吠。");
	text = text.replace("You shrug and say it\'s nothing, but in that moment there\'s a yelp and the yips turn into snarling and you hear the distinct sound of animalistic struggle.", "你耸耸肩说没什么，但接下来那叫声变成了咆哮声你能感觉出这是只有战斗才能发出歇斯底里般的声音。");
	text = text.replace("The snarls turn to whines.", "咆哮声逐渐变成了呜咽声。");
	text = text.replace(/Something is losing the fight\. (.*?) turns to you\./, "一定有什么东西输了这场战斗。$1 转向你。");
	text = text.replace("Sounds close, should we check it out?", "声音听起来很近，我们应该检查一下吗？");
	text = text.replace("I don\'t wanna sleep with that around.", "我可不想在这儿睡觉。");
	
	text = text.replace("You tell the company to ignore the sounds.", "你告诉战队不要去理会这些声音。");
	text = text.replace("That\'s a hard task to oblige as the cries of the wild dogs only grow louder and louder until, just like that, they stop.", "这是个艰巨的任务，因为野狗的叫声越来越大，就这样直到它们停下来为止。");
	text = text.replace("Your men stand still as though making any noise could bring the hell of whatever horror it is that\'s out there.", "你的人神情呆滞，好像随便弄点声音出来就能让人感到该死的恐怖。");
	text = text.replace("Nothing comes to pass, but a number of the men have a hard time sleeping through the night.", "最后什么也没发生，但有几个人整夜难以入睡。");
	
	text = text.replace("You tell the company to plug their ears if it bothers them so much.", "你告诉大伙如果这声音让他们感到担忧，就把耳朵堵上。");
	text = text.replace("As the cries of the wild dogs grow louder the men turn to impromptu ear candling to keep the sounds at bay.", "大伙随即用蜡球堵上耳朵来应对野狗的狂吠声越来越大。");
	text = text.replace("Eventually, the sense deprived sellswords are awkwardly walking around like animatronics.", "最终，他们又恢复到了往常傻不拉几的样子。");
	text = text.replace("You look to join the muted, plugging a waxball into your ear, but before you can get the second ear a loud crash sends inventory flowing and a tent billows as it collapses.", "你也想缓解下，就拿了个蜡球堵上了一只耳朵，还没来得及堵另一只耳朵的时候仓库那边传来了巨大的碰撞声紧接着仓库帐篷坍塌了冒出大量的烟雾。");
	text = text.replace("You drain your ear and bark orders to the mercenaries who are scattered all over the camp.", "你清空了耳朵并且快速指挥着雇佣兵们分散开来。");
	
	text = text.replace(/It does appear the men will not be assuaged by telling them to grow a pair\. (.*?) elects to go seek out the noise, as he\'s sure it\'s nothing more than the wild dogs squabbling over primacy over the pack\./, "加强警备似乎不会缓解这些人的情绪。$1 决定去探明一下声音的问题，因为他觉得那不过是野狗为了争夺族群里的狗王才发出的声音。");
	text = text.replace("You send him on his way, the man venturing into the dark all by his lonesome.", "你同意了，他冒险独自一人走进黑暗。");
	text = text.replace("Just as soon as he\'s gone the canines cease their crying and you hear a growl that seems as though it came from a much higher ground.", "他一走进去那些狗就停止了叫声，紧接着你听到了类似低吼的声音从更高的地方传来。");
	text = text.replace("The whole camp is dead silent, daring not to even move.", "整个营地甚至动都不敢动，一片死寂。");
	text = text.replace("An hour later and the hunter walks into camp, nobody having heard him come in.", "一个小时后他走进营地了，但没人听到他回来的动静。");
	text = text.replace("He\'s camouflaged himself in mud slaked with twigs and leaves.", "他用泥巴和树叶把自己伪装起来。");
	text = text.replace("He\'s grafted stems into a hood which he wears like some arboreal abbess.", "帽子里插着树枝，看起来就像树林修女院院长。");
	text = text.replace("With hushed tones, the sellswords ask what he saw. He shrugs.", "大伙压低声音问他看到了什么。他耸耸肩。");
	text = text.replace("Well. I seen about a dozen dead dogs.", "额。我看到了十几只死狗。");
	text = text.replace("Some ripped apart. Found a few in the pit of very large footprints and they\'d not found the print but had been stomped there, you know.", "一些被撕碎了。一些在几个巨大的脚印坑里找到了，它们被踩死了，你懂的。");
	text = text.replace("And I saw something move along in the shadows between the tree tops and it went the other way and I did not follow.", "我还看见一些东西在树梢的阴影里移动，往另一个方向去了，我没跟着。");
	text = text.replace("I found a deer dead on its feet leaning against a tree.", "我发现有一只鹿撞在树上死了。");
	text = text.replace("Heart faltered by whatever it saw, I suppose.", "我想，管我看见的是什么我的心都害怕地发抖。");
	text = text.replace("I harvested everything I could.", "我已经竭尽所能。");
	text = text.replace("The man turns and slings forward a rack of meat strung to a paneling of wood and leaves.", "他转过身来，掏出一吊子肉上面沾着树叶。");
	text = text.replace("Anyone hungry?", "有人饿了吗？");
	
	text = text.replace(/Fear comes over the camp, but you fetch (.*?) to your side\./, "恐惧笼罩着营地，但是你把 $1 叫到身边。");
	text = text.replace("The wildman snorts and runs his hand along his nose as though you\'ve inconvenienced whatever inexplicable notion he has of his own time.", "野人哼的一声揉揉鼻子，你的做法让他摸不着头脑。");
	text = text.replace("He raises an eyebrow as you suggest, to the best of your pantomiming abilities, that he go and seek out the noise.", "他挑了挑眉毛看着你，你手舞足蹈的比划表明想让他去找到噪音。");
	text = text.replace("With little further suggestion, the man grunts and takes off into the woods.", "你掏空心思表明清楚后，这家伙才嘟囔着跑进了树林。");
	text = text.replace("You swear he\'s a good hundred meters off but you can still hear him barreling through the bushes making all the goddam noise in the world.", "你发誓他离你已经有一百多米远，但你还是能听到他在灌木丛中发出奔驰的声音，发出这世上最该死的噪音。");
	text = text.replace("The wild dogs quit their baying and in their place you hear a loud growl and the hoots of a smaller one.", "野狗停止了吠叫，但接着那地方传来了一声大的咆哮和狗的一小声惨叫。");
	text = text.replace("They bandy back and forth and you notice you can feel the ground tremoring beneath your feet.", "你的人佛口蛇心的讨论着，你能感到大地在颤动。");
	text = text.replace("The vibrations falter and fade and the screaming halts altogether.", "之后颤动减弱了和叫声一起直到消失。");
	text = text.replace("Just as you begin to worry, the wildman walks back into camp.", "你开始担心起来，这时候野人回来了。");
	text = text.replace("He sits beside the campfire, yawns, turns over, and falls asleep.", "他做在营火旁打了个哈欠，一翻身就睡着了。");
	text = text.replace("It is as though he\'d never left at all.", "好像他就没出去过一样。");
	
	text = text.replace("You look about the company.", "你环顾了一下战队。");
	text = text.replace(/A young (.*?) looks back\./, "一个年轻的 $1 向后看。");
	text = text.replace("He looks down, as though to look within himself, and then hurriedly gets to his feet.", "他低下头避开你的眼神，好像他和自己内心争斗了一番，然后赶紧站起来。");
	text = text.replace("Say no more, captain.", "不用说了，队长。");
	text = text.replace("I will find out what this disturbance is.", "我会找出这骚乱是什么的。");
	text = text.replace("The fresh recruit gathers his things and then stands at the edge of the camp\'s light, a very dark forest looking back at him.", "他收拾好，站在营火的光亮边缘，漆黑的森林在那头正望着他。");
	text = text.replace("The man stares down again and clenches and unclenches his hands.", "他再次低下头，拳头握了又松。");
	text = text.replace("Alright. Alright.", "好吧。好吧。");
	text = text.replace("He looks up.", "他抬头看看。");
	text = text.replace("Let\'s do this.", "就这么做吧。");
	text = text.replace("The man is never seen again.", "他去了后你就再没见过这个人。");
	
	text = text.replace("You look about the company.", "你环顾了一下战队。");
	text = text.replace(/A young (.*?) looks back\./, "一个年轻的 $1 向后看。");
	text = text.replace("He looks down, as though to look within himself, and then hurriedly gets to his feet.", "他低下头避开你的眼神，好像他和自己内心争斗了一番，然后赶紧站起来。");
	text = text.replace("Say no more, captain.", "不用说了，队长。");
	text = text.replace("I will find out what this disturbance is.", "我会找出这骚乱是什么的。");
	text = text.replace("The fresh recruit gathers his things and then stands at the edge of the camp\'s light, a very dark forest looking back at him.", "他收拾好，站在营火的光亮边缘，漆黑的森林在那头正望着他。");
	text = text.replace("The man stares down again and clenches and unclenches his hands.", "他再次低下头，拳头握了又松。");
	text = text.replace("He huffs and then steps forth, immediately slipping into the shadows.", "他愤愤地迈步向前随即消失在阴影里。");
	text = text.replace("Hours pass. Finally, he returns.", "过了段时间。他最终回来了。");
	text = text.replace("His clothes are in tatters.", "他的衣服破烂不堪。");
	text = text.replace("His weapons are gone.", "武器也不见了。");
	text = text.replace("He spits forth story after story.", "他唾沫横飞的讲了一个又一个故事。");
	text = text.replace("Magic rings, volcanoes, giant eagles, absolute nonsense.", "什么魔戒，火山，巨鹰，满嘴疯言疯语。");
	text = text.replace("Whatever he saw, it\'s clear the blubbering sellsword needs to clear his head with some well earned beauty sleep.", "不管他看到了什么，这家伙需要好好睡一觉了。");
	text = text.replace("Which he\'ll get since all that awful noise has ceased.", "自从可怕的声音停下来后，他真得睡个好觉。");

//crisis
//undead_boy_who_cried_event.nut
	text = text.replace(/While visiting (.*?), you are called on by a young boy who comes crying that undead are coming to eat his family\./, "当你们拜访 $1 时，一个小男孩叫你，他哭着说亡灵要来吃他的家人。");
	text = text.replace("You ask how many and he says just one, but that it\'s of deadly stock.", "你问他有多少只，他说只有一只，但那是致命的畜生。");
	text = text.replace("I think it\'s my old babysitter.", "我想它是我以前的保姆。");
	text = text.replace("She was never keen on me. Please, help!", "她从不疼爱我。请，帮个忙！");
	text = text.replace("If it\'s just one wiederganger it should not be that much trouble and you can probably handle it yourself.", "如果只是一只亡灵，应该不会太麻烦，你可以自己解决。");
	
	text = text.replace("You rush to the boy\'s home and rush through the door.", "你冲进男孩的家，又冲出门去。");
	text = text.replace("You find his family setting up the dinner table.", "你发现他的家人正在布置餐桌。");
	text = text.replace("They look at you as though you were a madman and one asks if they can help you.", "他们看着你，好像你是一个疯子，有个人问你他们是否可以帮忙。");
	text = text.replace("The boy starts laughing so hard he clenches his stomach and rolls around on the ground.", "男孩笑得很厉害，他紧紧捂着肚子在地上打滚。");
	text = text.replace("The mother grabs him by the ear.", "母亲揪着他的耳朵。");
	text = text.replace("She apologizes as she hands him off to his father for a good whipping.", "她道歉，并把他孩子推给他的父亲一顿暴揍。");
	text = text.replace("Sorry, sellsword, we mean no trouble but this boy, well he does as he pleases sometimes.", "对不起，佣兵，我们不是有意找麻烦，但这孩子，他有时候真是任性。");
	text = text.replace("Can\'t really fault a boy for being a boy, though this one is definitely a little shite if you\'ve ever seen one.", "不能跟孩子一般见识，虽然他确实是个你刚遇到的屎孩子。");
	text = text.replace("You head back to the markets.", "你掉头返回了集市。");
	
	text = text.replace("As you peruse a merchant\'s goods, a little voice yells out for you.", "当你仔细考察一个商人的货物时，一个小声音在对你大声喊叫。");
	text = text.replace("Turning, you see it\'s that damned kid again.", "转过身来，你又看到那个该死的孩子。");
	text = text.replace("He\'s pointing homeward once more.", "他又一次指向家。");
	text = text.replace("Sellsword! One\'s there! I\'m serious! You have to help!", "佣兵！那里有一只！我是认真的！你得帮帮我！");
	text = text.replace("You ask why he doesn\'t bother one of the townguards and he says that none trust him.", "你问他为什么不去打扰一个城镇守卫，他说没有人信任他。");
	text = text.replace("Fetched them on too many lies I \'ave!", "我已经说过太多次谎话去骗他们！");
	text = text.replace("Please, help! My family is going to be slaughtered!", "请帮帮忙！我的家人要被屠杀了");
	
	text = text.replace("Sighing, you tell the boy to lead the way.", "一直叹气，你告诉这个男孩带路。");
	text = text.replace("Surprise surprise, you\'ve been made a fool of again.", "无比震惊的是，你又被愚弄了。");
	text = text.replace("The boy can\'t stop laughing even as his father whips him a good one.", "那个男孩忍不住哈哈大笑，尽管他父亲狠狠抽了他一顿。");
	text = text.replace("The mother, again, apologizes and hands you a small giftbag of goods for your trouble and \'looking out\' for them.", "那个母亲，再一次地，道歉并送上一小包礼物，为给你添麻烦和“看望”他们。");
	text = text.replace("You head back to the markets.", "你掉头返回了集市。");
	
	text = text.replace("While back in the market, you\'re already expecting that savage little liar to come by.", "当你回到集市的时候，你已经预料到那个野蛮的小骗子会来了。");
	text = text.replace("You feign shock when he\'s pulling on your hand.", "当他拉你的手时，你假装震惊。");
	text = text.replace("A moment comes by and you see yourself socking him right in the jaw.", "过了一会儿，你发现自己正好打在他的下巴上。");
	text = text.replace("Of course, that would not look good to those who know naught what is going on so you keep yourself steady.", "当然，这对那些不明真相的人来说是不好的，所以你要保持镇定。");
	
	text = text.replace("Warily, you return to the boy\'s home.", "小心翼翼地，你回到男孩的家。");
	text = text.replace("The second you open the door to see the family enjoying a game of cards you to turn around and grab the kid by his throat and slam him against the wall.", "当你打开门看到一家人正在玩纸牌的时候，你转身抓住孩子的喉咙把他往墙上猛撞。");
	text = text.replace("You kick the door closed so no one can see.", "你把门踢上，这样没人能看见。");
	text = text.replace("The father gets up and tells you that\'s his son you\'re manhandling.", "他父亲起身告诉你说，这是他儿子，你在粗暴对待他。");
	text = text.replace("You tell the father to give you the switch used to beat his boy.", "你告诉父亲把打他儿子的鞭子给你。");
	text = text.replace("Cautiously, he does as told.", "小心翼翼地，他照做了。");
	text = text.replace("This time, you punish the kid yourself and when you\'re finished he\'s a welted, weeping mess.", "这一次，你自己惩罚这个孩子，当你完成的时候，他浑身是伤，哭得一塌糊涂。");
	text = text.replace("You throw the switch at the crumpled child and tell the parents to pay you for your time, informing them that a \'sellsword never works for free.\'", "你把鞭子扔向那个蜷缩的孩子，告诉他的父母为你的时间付钱，告诉他们“佣兵从来都不是免费的。”");
	
	text = text.replace("Warily, you return to the boy\'s home.", "小心翼翼地，你回到男孩的家。");
	text = text.replace("Opening the door, you turn to the kid and tell him if he\'s lying once again you\'ll... before you can even finish the threat a scream draws your attention to the family.", "打开门，你转向那孩子，告诉他如果他再撒谎，你就…你还没来得及说完威胁的话，一声尖叫就把你的注意力吸引到这家人身上。");
	text = text.replace("A large, ghoulish figure is terrorizing the mother and the father is using a broom to try and beat it back.", "一个巨大的，食尸鬼的身影正恐吓着母亲，父亲正用扫帚试图把它击退。");
	text = text.replace("You draw your sword, step forward, and cut the wiederganger down.", "你拔出剑来，向前一步，砍倒僵尸。");
	text = text.replace("Its head rolls free and splashes into a crockpot while the body crumples and spews black sludge across the floorboards.", "它的头部自由翻滚，飞溅到一个锅里，而它的身体则变了形并在地板上喷出黑色的污物。");
	text = text.replace("You turn to the boy and tell him that you almost didn\'t come for a liar\'s truth will always remain a lie to all others.", "你转向那个男孩，告诉他你差点儿没来，因为一个说谎者的实话对所有人来说永远都是谎言。");
	text = text.replace("He nods and thanks you for believing him this time.", "他点了点头，感谢你这次相信他。");
	text = text.replace("The parents thank you, too, but with a little more care: a satchel of crowns and goods.", "他父母也感谢你，但要表示一点心意：一个装着克朗和物品的袋子。");
	
	text = text.replace("You distrust the little runt and tell him to stop playing games.", "你不信任那个小杂种，告诉他不要再玩游戏了。");
	text = text.replace("He spits and churns some rocks beneath a boot.", "他在靴子下吐着唾沫，用脚搅着一些石头。");
	text = text.replace("Hell, mister, I was trying to \'ave some fun.", "见鬼，先生，我就是想找点乐子。");
	text = text.replace("When he turns to leave, you give him a swift kick in the arse.", "他转身离开时，你狠狠地踹了他一脚。");
	
	text = text.replace("You tell the boy if he doesn\'t get out of sight you\'ll report him to the guards and have him thrown into the dungeons.", "你告诉那个男孩，如果他不离开你的视线，你就向守卫告状，把他扔进地牢。");
	text = text.replace("He huffs and spits.", "他气的吐唾沫。");
	text = text.replace("Shite, mister, just \'aving a bit of a laugh, that\'s all.", "我靠，先生，我就是开个玩笑，就这样。");
	
	text = text.replace("You crouch down low so you and the kid can see eye to eye.", "你蹲下，你用眼睛对视着这个孩子。");
	text = text.replace("You ask if he\'s lying. Slowly, he nods.", "你问他是不是在撒谎。慢慢地，他点头。");
	text = text.replace("A guard, overhearing this, comes over and grabs the child by his arm.", "一个守卫听到了，走过来抓住孩子的胳膊。");
	text = text.replace("Oy\', lying again are we?", "又在说谎了，是吗？");
	text = text.replace("What did I tell you about bothering the travelers, hm?", "我不是跟你说过别烦旅客的事儿么，嗯？");
	text = text.replace("I suppose your father hasn\'t been strong with his switch-hand if yer at it again.", "我想你父亲的手劲儿可能不够大，结果你还这么干。");
	text = text.replace("Now we\'ll see how you fare in the dungeons!", "现在我们来看看你在地牢里的表现！");
	text = text.replace("The boy is taken away, balling his eyes out as a couple of rusty shackles are slapped on him.", "男孩被带走了，当一对生锈的脚镣被甩在他身上时，他的眼睛被打肿了。");
	text = text.replace("This is one of the happiest moments of your life.", "这是你一生中最欢乐的时刻之一。");
	
	text = text.replace("You tell the boy to stuff it.", "你告诉那个男孩憋回去。");
	text = text.replace("He begs again and, for a moment, it\'s as though something real is behind his lying eyes.", "他又一次乞求，有那么一会儿，他撒谎的眼睛后面好像有什么真实的东西。");
	text = text.replace("But you\'re not buying it.", "但你不买账。");
	text = text.replace("The boy runs off, now asking the guards for help.", "男孩跑开了，现在正在向守卫寻求帮助。");
	text = text.replace("They also turn him down.", "他们也拒绝了他。");
	text = text.replace("A few merchants laugh.", "几个商人笑了。");
	text = text.replace("Nobody believes your lies, little runt.", "没人相信你的谎言，小杂种。");
	text = text.replace("But a shriek cuts the humor short.", "但是一声尖叫打破了戏谑。");
	text = text.replace("A man limps across the street, clutching his neck which is spraying blood between the fingers.", "一名男子一瘸一拐地穿过街道，抓着自己的脖子，脖子上的鲜血从指缝间喷涌而出。");
	text = text.replace("He collapses to the ground.", "他瘫倒在地。");
	text = text.replace("A sallow skinned woman chases after, falling to the man\'s body and biting into his leg.", "一个灰黄皮肤的女人在后面追赶，倒在男人的身上，咬着他的腿。");
	text = text.replace("Guards rush to the scene and slaughter the dead and dying while the newly orphaned by wails on.", "卫兵冲到现场，杀死死者和垂死的人，而那个刚刚成为孤儿的人还在哀嚎。");

//location
//icy_cave_destroyed_event.nut
	text = text.replace("You discover a cave in the ice with its maw shielded by a gate of thick icicles.", "你在漫天飞雪里发现了一个洞穴，它的入口被密集的冰柱挡住了。");
	text = text.replace("Looking through the icy bars, you find the cave quickly declines down a steep slope and toward what may be an underground riverbank that has long since frozen.", "穿过冰柱向内看去，你发现洞穴里面有一个很陡峭的斜坡，这个斜坡通向一个可能被冻结了很久的地下河河岸。");
	text = text.replace("Something is huddled beside it hitting the ice with a pickaxe over and over again.", "好像有人在河道边缩成一团，用鹤嘴锄反复敲打着冰块。");
	text = text.replace("The wind whistles as it grates against the teeth of the cave.", "风将冰柱吹得呼呼作响。");
	text = text.replace("You call out to the huddled man, but there is no response.", "你对那个缩成一团的人喊叫，但没有得到任何响应。");
	text = text.replace("It will take some time to chop through this thick ice and get in there.", "将冰柱打碎并且进入里面需要一段时间。");
	text = text.replace("Fortunately, one of the sellswords reports that there may be a rear entrance.", "幸运的是，一个佣兵说有其他的入口。");
	text = text.replace("It is blocked just as well, but a strong enough man just might be able to squeeze through and face any dangers within.", "虽然这个入口也被堵住了，但可以让一个足够强的人挤过去，他要面对的是里面的任何危险。");
	text = text.replace("You followed the mysterious messenger\'s footsteps to a cave in the ice.", "你跟着一个神秘人的脚印找到了这个冰洞。");
	text = text.replace("This time it has not been recently trespassed as a thick gate of icicles keep your entrance well stayed.", "因为一扇厚厚的冰柱门恰如其分地阻挡你进入，所以这里最近应该没有人侵入。");
	text = text.replace("To the side of the cavern\'s maw is the old man face down in the snow, dead as can be, and with one arm stretched out pointing into the cave.", "洞穴的另一边，有个老人面朝下倒在雪地里，死气沉沉，一只胳膊伸向洞口。");
	text = text.replace("Looking through the icy bars, you find the cave quickly declines down a steep slope and toward what may be an underground riverbank that has long since frozen.", "穿过冰柱向内看去，你发现洞穴里面有一个很陡峭的斜坡，这个斜坡通向一个可能被冻结了很久的地下河河岸。");
	text = text.replace("Something is huddled beside it hitting the ice with a pickaxe over and over again.", "好像有人在河道边缩成一团，用鹤嘴锄反复敲打着冰块。");
	text = text.replace("The wind whistles as it grates against the teeth of the cave.", "风将冰柱吹得呼呼作响。");
	text = text.replace("You call out to the huddled man, but there is no response.", "你对那个缩成一团的人喊叫，但没有得到任何响应。");
	text = text.replace("It will take some time to chop through this thick ice and get in there.", "将冰柱打碎并且进入里面需要一段时间。");
	text = text.replace("Fortunately, one of the sellswords reports that there may be a rear entrance.", "幸运的是，一个佣兵说有其他的入口。");
	text = text.replace("It is blocked just as well, but a strong enough man just might be able to squeeze through and face any dangers within.", "虽然这个入口也被堵住了，但可以让一个足够强的人挤过去，他要面对的是里面的任何危险。");
	text = text.replace(/(.*?) heads off while you and the rest work on the front of the cave\./, "$1 挤进了山洞，当你和其他人还在山洞前忙碌的时候。");
	text = text.replace("You knock a few of the thick icicles out letting you see into the cave with better eyes.", "你敲碎了几根冰柱以便更清楚得看清里面的情况。");
	text = text.replace(/Just as you do, (.*?) comes tumbling down an adjacent slope and lands right in the middle of the cave and slides across the frozen river and rides up its embankment\./, "正当你敲冰柱的时候，$1 从斜坡上滚了下去，正好落在山洞的中间，滑过冰冻的河流，坐在了河岸上。");
	text = text.replace("He hops to his feet and dusts himself off with a childish grin.", "他支撑着身子站了起来，用手掸去了身上的灰尘，并露出了孩子般的笑容。");
	text = text.replace("In a flash the huddled man slams the pickaxe into the ice with unhinted power and the shards splinter from one side of the embankment to the other.", "突然，蜷成一团的那个男人用鹤嘴锄猛击冰块，敲出的碎冰飞溅到另一边的河岸。");
	text = text.replace("The clank of the metal and shattered ice reverberates as though lightning itself had struck.", "在迅速的敲打下，金属和碎冰的声音回荡在山洞里。");
	text = text.replace("Now you can finally see the stranger: he is a barbarian shelled in broken armor that rattles as he moves.", "这时你终于可以看到那个人了：他是一个野蛮人，穿着破碎的盔甲，走起路来一直发出嘎嘎的声响。");
	text = text.replace("The icy walls mirror his steps, scattering his presence all around the cave in transient sheens.", "冰墙映照出他的脚步，短暂得将他的身影散落在山洞的四周。");
	text = text.replace("Jittery and jutting, his walk is seemingly going backwards despite his advance as though his shadow were his true self and his flesh the afterimage.", "他步履蹒跚得走着，他的影子像是他的真实自我，而肉体是他的映象。");
	text = text.replace("Despite being in a cave, his loud voice echoes not at all.", "身在山洞里，他的声音却丝毫没有发出任何响声。");
	text = text.replace("An interloper in my midst, a mere moment from the mist, these things I shall not miss.", "一个闯入者在我中间，离迷团只差了一瞬间，我不会错过这些事的。");
	text = text.replace("He approaches the sellsword like a cold spider unfurling from its trapdoor.", "他像一只蜘蛛一样走向那个佣兵。");
	text = text.replace("You see that his face is half-frozen, and a wry smile squeezes across the half that could still be called flesh.", "你看到他被冻得半死的脸上露出了一个扭曲的微笑。");
	text = text.replace("I long to leave this body, my dear fighter.", "亲爱的战士，我想要离开这副身体。");
	text = text.replace("Will you help guide me out and to something higher?", "你能带我出去找更高级一点的身体么？");
	text = text.replace(/(.*?) cuts the madman down\./, "$1 砍倒了这个疯子。");
	text = text.replace("His chest armor shatters and flies off his body, chunks of plate spinning and warbling into the air and yet tethered together by some strange blue tendrils.", "他的胸甲碎裂，飞离了他的身体，大块的钢板在空中旋转和鸣叫，但却被一些奇怪的蓝色卷须绑在一起。");
	text = text.replace(/Your men finally break through the icy cavern\'s entrance and slide down the declination\. (.*?) is quite alright, nodding smugly as he sheathes his weapon\./, "你的人终于击碎了冰柱进入山洞，从斜坡滑了下去。$1 没有受伤，他得意得点了点头，把武器收了起来。");
	text = text.replace("Just a crazy fuck, captain.", "只是个疯狂的混蛋，队长。");
	text = text.replace("You crouch beside the body.", "你蹲在尸体旁。");
	text = text.replace("Ice contorts half the flesh, twisting it into nubs of black, and what isn\'t frozen is flaked by strangely sparkling rime.", "冰将他冻得体无完肤，没有冻伤的部分被一些闪闪发光的冰霜覆盖着，十分奇怪。");
	text = text.replace("Despite his grisly state, the mad man died with a wild grin still on his face.", "尽管他死的时候身体状况很差，但是他的脸上仍然带着笑容。");
	text = text.replace("The eyes are a bright blue and you see yourself in their gaze, a faceless silhouette.", "他的眼睛是蓝色的，很明亮，你甚至能在他的凝视中看到自己一个模糊的身影。");
	text = text.replace("And then the color slowly slips away, not like you\'ve seen before, but as though someone were dragging a curtain through a window, slowly sucking all color right into the sockets.", "过了一会，暗淡了下来，不像之前的那般明亮，就像有人关上窗帘，将所有的亮光都锁在里面。");
	text = text.replace("The corpse grins at you, but you refuse to believe that is what you saw.", "尸体仍然诡异得对着你笑着，但是你无法相信看到的这一切。");
	text = text.replace("One of the mercenaries picks up the mad man\'s bizarre armor and holds it at length.", "一个佣兵捡起疯子的盔甲并一直拿着它。");
	text = text.replace("What do you figure this is?", "你觉得这是什么形状？");
	text = text.replace("The plates dangle from one another by some strange blue gelatin, and the insides of the metal slats are coated in bubbling, twirling blues as though it were the work of some celestial blacksmith.", "这些碎金属被一些奇怪的蓝色黏液黏在一起，金属上有着一些气泡模样的图案，这些蓝色的圆圈看起来像是某个东方工匠的作品。");
	text = text.replace("It is cool to the touch and gives beneath the slightest push of your finger.", "你用手指推了它一下，这些金属让你感到寒冷。");
	text = text.replace("You\'ve never seen or felt anything like it, but the armor itself is currently in an unusable state.", "你从来没有见过类似的东西，但这副盔甲又没办法穿上。");
	text = text.replace("You have the goop and armor put into inventory, scour the cave for more goods which there are none.", "你将黏液和盔甲放进了仓库，在洞穴里找有没有其他一些有用的东西。");
	text = text.replace("Before you leave the cave, you glance at the corpse one last time.", "你离开洞穴的时候，最后看了一眼尸体。");
	text = text.replace("You think you saw it move again, but surely it is the cold of the frozen north that is playing tricks on you.", "你觉得你看到尸体又移动了位置，但你坚信这是寒冷的北方在捉弄你。");
	text = text.replace(/Through the icicles you can see the madman cutting down (.*?)\. Even as he lies dead on the ground, the stranger continues to hack away at him, and each time a muffled thump echoes through the cave\./, "隔着冰柱，你看见这个疯子砍倒了 $1。即使他已经倒地死亡，这个疯子仍然不停地对着他的尸体进行挥砍，每一次的挥砍产生的闷响都回荡在山洞里。");
	text = text.replace("What will you do now?", "现在你要怎么做？");
	text = text.replace("As you depart the cave, a local northerner covered in bear furs stands across the company.", "当你离开山洞时，一个穿着熊皮的北方人站在了战队的面前。");
	text = text.replace("He looks at you and then the cave entrance. He asks.", "他看了看你，又看了一眼洞口。他问。");
	text = text.replace("Do you speak the southern or native tongue?", "你会讲南方话或者这里的语言吗？");
	text = text.replace("Keeping your guard, you confirm the former. He nods.", "你保持着警惕，确定了他的身份。他点头。");
	text = text.replace("And what did you see in that cave?", "你在洞穴里看什么？");
	text = text.replace("Did you see it?", "你看到它了？");
	text = text.replace("You tell him you found nothing, only a madman. The stranger smirks.", "你告诉他你除了一个疯子外什么都没看到。这个陌生人笑了起来。");
	text = text.replace("A madman. A madman, that is what you think you saw.", "一个疯子，一个疯子，这是你以为你看到的东西。");
	text = text.replace("It is within us all to speak warily of the unnatural, but not within us to recognize when nature herself takes a step back.", "我们所有人的内心在谈论不自然的事物时都会变得小心翼翼，而不是在自然让步的时候去了解他们。");
	text = text.replace("Horrors are easier said than seen.", "恐怖说起来容易，要看清楚却很难。");
	text = text.replace("That was no ordinary man, you fool, but the Ijirok, a transient spirit that shifts from one vessel to another.", "那不是普通人，傻瓜，他是伊吉罗克，是从一个身体转移到另外一个身体的短暂灵魂。");
	text = text.replace("No one really knows what it looks like, the whole world is simply a series of masks and it will happily go from one to the other, usually taking the shape of animals, sometimes a man if he is so weak.", "没有人真正知道它的模样，但可能整个世界都是它的面具，它很乐意从一个面具转移到另一个，它一般是以动物的形态出现，偶尔会是个虚弱的人类");
	text = text.replace("It is a being of absolute malice.", "它是一个邪恶的存在。");
	text = text.replace("It cannot be killed, no, it sees death, even its own, as entertainment.", "它不能被杀死，不对，应该说它把自己的死亡看做是一种娱乐。");
	text = text.replace("It remembers those who escape it, it remembers those it wishes to play with.", "它会记得谁逃离了它，而谁又希望跟它一起玩耍。");
	text = text.replace("I pray you\'ve a face worth forgetting.", "祝你有一张值得忘记的脸。");
	text = text.replace("You put your hand on the pommel of your sword and tell him that whatever mysticism and mythmaking he\'s got left he can keep to himself.", "你把你的手放在剑柄上，跟那个陌生人说，无论这是神秘学还是神话传说你都可以离开。");
	text = text.replace("You saw the madman in the cave, and that\'s all he was, a man.", "你在山洞里看到的疯子，他就是那个样子，一个普通的人类。");
	text = text.replace("The stranger nods again and backs off.", "陌生人又点了点头并向后退去。");
	text = text.replace("As you wish, and may you travel well.", "好吧，祝你旅途愉快。");

//icy_cave_enter_event.nut跟上面那个一样

//tundra_elk_destroyed_event.nut
	text = text.replace("With the killing blow well placed, the Ijirok clambers side to side gripping its final wound.", "当受到最后一击后，伊吉罗克捂着自己最后的那道伤口。");
	text = text.replace("It lets out a howl of pain and buckles at the knees and can only barely hold itself up with one hand as its body doubles over and vomits into the ground.", "发出了一声痛苦的嚎叫，双膝屈曲，他开始呕吐起来，并用一只手支撑着自己以防倒在地上。");
	text = text.replace("But the whole thing seems like a charade and the beast at times looks over as though to make sure you are watching.", "整件事情看起来就像是一个谜团，那只野兽时不时看向你为了确保你看着它。");
	text = text.replace("It is a drama. A poorly acted show put on by that which does not know death in any sense.", "这是一出戏剧，由一个对死亡都没有任何感觉的人出演的糟糕演出。");
	text = text.replace("The eyes lock with yours and that unsettling grin returns, then the monstrosity flashes a blinding strobe of blue and when the natural light of the world returns the corpse is frozen solid and flakes of snow drizzle from the sky.", "紧闭着眼睛，那令人不安的微笑又出现在了你的脑海，怪兽的尸体上闪烁着蓝色的闪光，当光线恢复正常的时候，尸体被冻成了冰块，雪花从天空中纷纷扬扬地飘落。");
	text = text.replace("That can\'t be it.", "不可能吧。");
	text = text.replace("You just know it.", "你知道的。");
	text = text.replace("You walk up to the iced remains and start chopping away.", "你走到结冰的尸体旁，开始凿冰。");
	text = text.replace("As you hew into the ice, a blue ooze drips from channels and gaps.", "当你切入冰块时，缝隙中流出了蓝色的液体。");
	text = text.replace("One final swing smashes the ice apart and a blob of goo runs every which way.", "当你敲碎最后一块冰时，黏液向四周飞溅而出。");
	text = text.replace("As the men looked on rather concerned, you grab the shattered armor from the cave and throw it into the Ijirok\'s blood.", "在佣兵们担心得看着你时，你抓起破碎的盔甲扔进了伊吉罗克的血液里。");
	text = text.replace("The strange tendrils which held its pieces together instantly brighten and you watch as they begin to twist taut and pull the plates together.", "奇怪的触手把它们的碎片粘在一起，盔甲的图案变得清楚，你看着它们开始扭紧，把护板拉在一起。");
	text = text.replace("Matted elk fur conjoins with the metal as though they were one being coming to heal old wounds.", "磨砂的麋鹿毛皮与金属结合在一起，好像他们能治愈旧伤一样。");
	text = text.replace("Blood snakes over the plates like moss twirling beneath a riverbed, curling to and fro before flattening out and painting the armor a slick red.", "血液在护板上像蛇一样盘旋，就像河床下旋转的苔藓，在消失前来回卷曲着将盔甲涂成光滑的红色。");
	text = text.replace("Picking it up, you feel a buzz on your fingertips.", "拿起盔甲的时候，你感到指尖嗡嗡作响。");
	text = text.replace("I hope you don\'t suggest I wear that, captain.", "我希望你不要让我穿那个，队长。");
	text = text.replace(/(.*?) says, shaking his head with a nervous smile\./, "$1 边说边摇着头，伴随着一个紧张的微笑。");
	text = text.replace("You\'re not yet sure what the armor is capable of, but no doubt have the mind to keep it in inventory to see.", "你无法确定盔甲的作用，但毫无疑问，你要留着它收入库存中以便观察。");
	text = text.replace("You\'re not yet sure what the armor is capable of, but no doubt have the mind to keep it inventory to see.", "你无法确定盔甲的作用，但毫无疑问，你要留着它收入库存以便观察。");
	text = text.replace("As for the Ijirok, you\'ve no doubt it is still out there somewhere.", "至于伊吉罗克，毫无疑问它还在世界的某个地方。");
	text = text.replace("Its corpse is already decaying rapidly and the bones which remain are not that of a giant beast but simply that of a poor elk.", "它的尸体已经在迅速腐烂，剩下的骨头不是一头巨兽的骨头，而是一只可怜的麋鹿的骨头。");
	
	text = text.replace("With the killing blow well placed, the Ijirok clambers side to side gripping its final wound.", "当受到最后一击后，伊吉罗克捂着自己最后的那道伤口。");
	text = text.replace("It lets out a howl of pain and buckles at the knees and can only barely hold itself up with one hand as its body doubles over and vomits into the ground.", "发出了一声痛苦的嚎叫，双膝屈曲，他开始呕吐起来，并用一只手支撑着自己以防倒在地上。");
	text = text.replace("But the whole thing seems like a charade and the beast at times looks over as though to make sure you are watching.", "整件事情看起来就像是一个谜团，那只野兽时不时看向你为了确保你看着它。");
	text = text.replace("It is a drama. A poorly acted show put on by that which does not know death in any sense.", "这是一出戏剧，由一个对死亡都没有任何感觉的人出演的糟糕演出。");
	text = text.replace("The eyes lock with yours and that unsettling grin returns, then the monstrosity flashes a blinding strobe of blue and when the natural light of the world returns the corpse is frozen solid and flakes of snow drizzle from the sky.", "紧闭着眼睛，那令人不安的微笑又出现在了你的脑海，怪兽的尸体上闪烁着蓝色的闪光，当光线恢复正常的时候，尸体被冻成了冰块，雪花从天空中纷纷扬扬地飘落。");
	text = text.replace("That can\'t be it.", "不可能吧。");
	text = text.replace("You just know it.", "你知道的。");
	text = text.replace("You walk up to the iced remains and start chopping away.", "你走到结冰的尸体旁，开始凿冰。");
	text = text.replace("As you hew into the ice, a blue ooze drips from channels and gaps.", "当你切入冰块时，缝隙中流出了蓝色的液体。");
	text = text.replace("One final swing smashes the ice apart and a blob of goo runs every which way.", "当你敲碎最后一块冰时，黏液向四周飞溅而出。");
	text = text.replace("You\'ve no doubt that this thing is still out there somewhere.", "毫无疑问这玩意还在世界的某个地方。");
	text = text.replace("Its corpse is already decaying rapidly and the bones which remain are not that of a giant beast but simply that of a poor elk.", "它的尸体已经在迅速腐烂，剩下的骨头不是一头巨兽的骨头，而是一只可怜的麋鹿的骨头。");

//tundra_elk_enter_event.nut
	text = text.replace("Within the barren tundra, you find a prime hunting ground around a small lake, and so you decide to go on a short one-day kill.", "在贫瘠的苔原里，你在一个小湖的周围找到了一个主要的狩猎场，所以你决定进行一次为期一天的短期捕杀。");
	text = text.replace("You quickly spot a sizeable elk cropping the scant tundra grass.", "你很快就发现一只相当大的麋鹿正在啃吃稀少的苔原草。");
	text = text.replace("Just as you ready a kill shot, the elk\'s neck seizes with its snout pointed straight out.", "就在你准备射杀的时候，麋鹿的脖子被抓住了，它的鼻子直接伸了出来。");
	text = text.replace("The bones crack and its limbs go bow legged as they are gripped by instant death, but it does not fall.", "它的骨头断裂，四肢弯曲，因为它们被瞬间的死亡抓住，但它没有倒下。");
	text = text.replace("The withers tremble and then bulb and shift as though fists rolled beneath its fur.", "它的肩胛骨颤抖着，然后鳞茎移动，好像有拳头在它的皮毛下滚动。");
	text = text.replace("Suddenly, the flesh tears asunder and you can see a slick blue mass bubbling between the wounds.", "突然，肉撕裂了，你可以看到一个光滑的蓝色肿块在伤口之间冒泡。");
	text = text.replace("Its legs burst apart and the torso rises high into the air as long stalks of thick bone clap to the ground and wormy, snakelike straps of muscle wrap about the shafts.", "它的腿突然分开，躯干高高地升到空中，长长的粗骨拍击地面，像蛇一样的肌肉带缠绕在躯干上。");
	text = text.replace("You believed the elk dead, but its maw groans wildly just as its face rips apart from crown to jaw like a blossoming flower.", "你相信麋鹿已经死了，但它的嘴却疯狂地呻吟着，就在它的脸从头顶到下颚像花朵一样裂开的时候。");
	text = text.replace("The face of something else entirely emerges, and it pushes forward as though generated by the very gore it was busy reaping.", "另一个东西的脸完全显露出来，它向前推进，好像是由它正忙着收割的血迹所产生的。");
	text = text.replace("As the new monster finds its strength, it seizes up on both hind legs and reaches his hands back to tear away the fur of the elk like a man would a cloak.", "当这个新怪物找到它的力量时，它用两条后腿抓住它，然后用它的手把麋鹿的皮毛撕下来，就像人撕下斗篷一样。");
	text = text.replace("Blood and bones splatter.", "血和骨头飞溅。");
	text = text.replace("A hideous beast three times the height of any man turns and feels out its limbs, tensing its hands, cracking its knees and shoulders, turning its head from side to side with its fat nostrils flaring like a bull.", "一个比任何人高三倍高的丑陋的野兽转过身来，摸着它的四肢，拉紧它的手，扭开它的膝盖和肩膀，把它的头从一边转到另一边，肥厚的鼻孔像公牛一样张着。");
	text = text.replace("The eye sockets are all bone and a blue haze pulses within them like crackling storms.", "眼窝都是骨头，蓝色的薄雾在眼窝里跳动，像是噼啪作响的暴风雨。");
	text = text.replace("The elk\'s beautiful antlers have been abrogated by horrible horns.", "麋鹿美丽的鹿角被可怕的犄角给磨掉了。");
	text = text.replace("A frosty air curls from its mouth and you can see the leaves of a nearby tree go cold and brittle.", "一股冷风从它的嘴里卷起，你可以看到附近一棵树的叶子变得又冷又脆。");
	text = text.replace("You have the uneasy feeling that this monster is not in fact a monster at all, but a transient spirit which manifests itself as it sees fit, carving itself into the world as an aspect of chaos and little else.", "你有一种不安的感觉，那就是这个怪物实际上根本不是一个怪物，而是一种短暂的灵魂，它以自己认为合适的方式显现出来，把自己作为混乱的一面雕刻在这个世界上，而不是别的什么。");
	text = text.replace("Just as you think this, the beast turns its head toward you and it hooks its long nails into the corners of its fanged mouth and stretches the lips so far out the corners could be its ears.", "正如你所想的，野兽把头转向你，把长长的指甲钩在尖牙的嘴角上，把嘴唇伸得很长，嘴角就是耳朵。");
	text = text.replace("Ahhh, this is the place to be, this is the place where I am happy.", "啊，这就是我要去的地方，这就是我快乐的地方。");
	text = text.replace("Why do you look with such fear, am I not but a simple deer?", "你为什么这么害怕，我不是一只普通的鹿吗？");
	text = text.replace("Its head cocks to a side with the drool slopping over its bottom lip and playful tears fill its eyes.", "它的头歪向一边，口水溢在下唇上，眼睛里满是顽皮的泪水。");
	text = text.replace("You\'ve heard stories of this creature, a cruel horror the northerners call the Ijirok or the Beast of Winter.", "你听说过这种生物的故事，北方人把它叫做伊吉罗克或冬天的野兽。");
	text = text.replace("You know it is not here to speak poetry and play games.", "你知道它不是来这里说诗和玩游戏的。");
	text = text.replace("You draw your sword, but then a hand claps your shoulder.", "你拔出剑来，却有一只手拍着你的肩膀。");
	text = text.replace("Here with you always, captain.", "永远和你在一起，队长。");
	text = text.replace("You turn to see the company at your side and ready to fight.", "你转身看到战队在你身边准备战斗。");

	return text;
}

var TranslateShiJian_WenBen_DLC6 = function(text)
{
//arena_tournament_event.nut
	text = text.replace("A couple of children dash across your path, one holding up a toy shield, the other staking into it with a very real pitchfork.", "几个孩子快速跑过你，其中一个举着一个玩具盾牌，另一个用着一个非常真实的草叉嘟着它。");
	text = text.replace("You grab the farm equipment and yank it away to which the child cries out that they\'re only having fun.", "你夺下这些农具并把孩子赶走，孩子哭喊着说他们只是在玩而已。");
	text = text.replace("The older of the two explains that they\'re merely excited for the coming gladiator tournament.", "其中更年长的一个解释道他们只是对于即将到来的竞技场角斗感到很兴奋。");
	text = text.replace(/They say that (.*?) is hosting a series of arena matches and the reward is something big\. Very interesting\./, "他们说 $1 在举办一系列的角斗比赛而且奖励很丰厚。非常有趣。");
	text = text.replace("Using the pitchfork, you scoot the children off the road and then hurl the tool to the other side.", "拿着草叉，你把孩子们赶下路并把草叉丢到了另一边。");
	text = text.replace("You find two boys trying to wrangle a dog into a net.", "你找到两个男孩在试图把一条狗赶到张网里。");
	text = text.replace("The dog playfully jukes left to right, but eventually they ensnare it.", "狗欢快的左蹦右跳，但是最终他们圈住了它。");
	text = text.replace("The mutt, almost immediately resigned to its fate, lays down.", "狗，好像承认了它的命运，趴下了。");
	text = text.replace("You think they\'ll butcher and eat the animal, but the boys merely let it go to start the game again.", "你想他们或许准备抓了吃掉它，但是男孩们只是把它放出来再次开始了游戏。");
	text = text.replace(/When asked, they explain that some gladiators in (.*?) use nets in combat\./, "询问下，他们解释道 $1 的角斗士会在战斗中使用网。");
	text = text.replace("But more interestingly, they also state a large series of gladiator games are going on and that apparently there\'s a big prize for the winner of it.", "但更有趣的是他们宣称一系列大型比赛要开始了而且有一份不菲的奖励等着胜利者。");
	text = text.replace("A messenger wearing buskin boots comes down the road and throws you a scroll and breathlessly sprints by all in the span of seconds.", "一个信使，穿着双厚底靴，几秒钟里从路上跑过时丢给你一张卷轴。");
	text = text.replace(/You unfurl the paper to find an announcement: (.*?) is hosting a tournament of gladiator games\./, "你解开羊皮纸发现这是一张布告：$1 正在举办大型角斗比赛。");
	text = text.replace("The winner of a series of combats will earn a prize, alongside adoration and fame, of course.", "挺过数轮的胜者将赢得一份奖励，当然还有赞美与名誉。");
	text = text.replace("You find a man squatting beside the road.", "你找到一个男人半蹲在路边。");
	text = text.replace("He\'s half-naked and, judging by the here-and-there state of his clothes, he did not undress himself.", "半裸，而且根据他衣服的状况，不是他自己脱的。");
	text = text.replace(/He explains that he was traveling to (.*?) to partake in the gladiator games, but a group of rogues robbed him\./, "他解释道他本来是要去 $1 参加角斗比赛，但是一群无赖抢劫了他。");
	text = text.replace("Not interested in his woes, you inquire about these games.", "对他的不幸没有兴趣，你询问他这些比赛的事情。");
	text = text.replace("He explains that it\'s a series of fights like a tournament and the winner gets a big prize.", "他解释道那是一系列像个斗技场一样的角斗，最终的胜利者会有一份丰厚的奖励。");
	//text = text.replace("The man shakes his head.", "那人摇了摇头。");
	text = text.replace("Suppose the only prize I got was getting my arse kicked.", "我想我拿到的唯一奖项就是我给人打了一顿。");
	text = text.replace("Hey, you look like you could use some help, what say I...", "嘿，你看起来需要帮手，你说我…");
	text = text.replace(/You walk off, mulling over whether or not to seek out (.*?) and its festive arena\./, "你走开了，思索着是否去寻找 $1 和它的节日竞技场。");

//belly_dancer_event.nut
	text = text.replace(/A belly dancer magnetizes (.*?)\'s center plaza\./, "一个肚皮舞者在 $1的中心广场吸引着人群。");
	text = text.replace("Rhythmic movements on their own can coerce a beggar to donating a crown, but with the stage of the whole plaza it is enough to draw crowds and with it heaps of gold.", "有节奏的运动本身能让一个乞丐献出一克朗，但是以一整个广场为舞台，这足够引来人群和成堆的金子。");
	text = text.replace("Masked by green silk, nearly see through, and clothe in thin silks with the whole mid rift exposed, the dancer is no doubt an expert in her field.", "面上罩着绿色的丝绸，几乎透明，薄丝绸制的衣服裸露着中间的腰腹，舞者显然是她领域中的专家。");
	text = text.replace("She whirls, hips hypnotic, elbows bowed, hands clapping little cymbals, her feet tiptoeing as she spins a spot so tight there very well may be an invisible god above holding her in place as she razzles and dazzles.", "她回转着，臀部的韵律好似安眠曲，肘部弯曲，手拍打着小钹，她的脚尖踮起着在一个点上旋转，如此稳定好似有一个隐形的神使她在眼花缭乱的运动中保持原地。");
	text = text.replace("Someone throws an apple through the air and the dancer spins around and shoots a tiny dagger through it, plugging it dead center and dropping the fruit to the ground.", "有人丢出一个苹果到半空中，而舞者旋转着，丢出一个细小的匕首刺穿了它，正中核心，苹果掉到了地上。");
	text = text.replace("Another apple soars in and this time a large saber is produced and slashes the stem off and she catches the rest and takes a bite.", "另一个苹果猛然投出，这次一把大弯刀出现削下茎叶后，她接住苹果小咬一口。");
	text = text.replace("The crowd claps gently to this.", "人群轻轻地鼓掌。");
	
	text = text.replace("You take out a crown and flip it to the dancer.", "你取出一克朗并掷向舞者。");
	text = text.replace("Her eyes catch its glint, but she doesn\'t break the dance.", "她的眼睛捕捉到了它的微光，但这没有影响到她的舞蹈。");
	text = text.replace("She drops her weapons and sashays over, cymbals clattering, hips gyrating, her knees hardly bending, her feet almost mystically carrying her across the ground.", "她放下她的武器神气的靠过来，钹碰撞着，她的膝盖微微弯曲，她的脚以一种神秘的方式让她掠过地面。");
	text = text.replace("She gets near. The face is narrow, but the jaw broad.", "她近了。脸窄而小，下颌宽。");
	text = text.replace("Her temples deep. She grins.", "她的额角深邃。她笑了。");
	text = text.replace("It\'s a man. She\'s a man.", "这是个男人。她是一个男人。");
	text = text.replace("He claps the cymbals in your face, then swings around, briefly gracing your groin with his ass, and starts to dance back to the middle.", "他在你面前拍响钹，然后摆过身去，他的屁股轻微的抚摸过你的腹股，并舞动着返回中央。");
	text = text.replace("He picks up your coin with a toe and flips it up and it lands in a clay pot. The crowd cheers.", "他用脚尖踮起了你的硬币，旋转着，硬币落入了一个陶罐。群众欢呼了起来。");
	
	text = text.replace("After the mannish belly dancer takes your crown you wait around for the show to end.", "在那个充满男人味的肚皮舞者拿走你的克朗后你等待着表演结束。");
	text = text.replace("You approach as he picks up his things.", "在他捡起他的东西时你靠近了他。");
	text = text.replace("He looks at you with a wry smile.", "他看到了你露出一个假笑。");
	text = text.replace("Ah, an admirer. Sorry, only one show tonight, good stranger.", "啊，一个崇拜者。很抱歉，今晚只有一场演出，亲爱的陌生人。");
	text = text.replace("You shake your head and ask if he knows anything about fighting. He nods.", "你摇了摇头并问他是否知道怎么战斗。他点头。");
	text = text.replace("Of course I do.", "我当然知道。");
	text = text.replace("The Gilded One\'s gleam is upon us all, but not at all hours or days.", "镀金者的辉光闪耀在我们所有人身上，但也不是每时每刻的。");
	text = text.replace("Sometimes we must find our own way through the dark.", "有时候我们必须自己找到走出黑暗的道路。");
	text = text.replace("I take it by your dress that you are a Crownling, putting that blade of yours where it does and sometimes does not belong.", "从你的着装来看你是个逐币者，把刀刃放在该去也有时候不该去的地方。");
	text = text.replace("You nod and ask him if he\'d be interested in joining.", "你点头并问他有没有兴趣加入。");
	text = text.replace("He goes bowlegged and sinks to the ground like a collapsing truss.", "弯下脚并像框架倒下般缩向地面。");
	text = text.replace("He counts his crowns.", "他数着他的克朗。");
	text = text.replace("I\'m not sure if you have a good eye for the wandering nature of men such as myself.", "我不清楚你是否有眼神来看透我自己这样人的游荡本性。");
	text = text.replace("Perhaps you saw a vocational tiredness not even I was aware of until this present moment.", "或许你看到了我自己到刚才为止都没有主要的职业疲劳。");
	text = text.replace("That said, you\'ll have to try harder to get me to go around killing for coin.", "话虽如此，要让我为了钱去杀戮你还得加把劲。");
	
	text = text.replace("You assuage his ego by saying he\'s one of the best with the blade you\'ve seen.", "你试图通过称赞他是你见过的最好的刀锋之一来缓和他的情绪。");
	text = text.replace("The dancer turns his hands to the dust, his fingers sliding beneath each coin and flipping it into his clay pot.", "舞者将他的头转向沙土，他的手指在每一个硬币下滑动着将他们弹到他的陶罐中。");
	text = text.replace("His left hand reaches across the ground, but as this catches your eye, his right hand snatches a blade that had been entirely buried beneath the sands.", "他的左手伸过地面，在这个动作吸引住你的眼神时，他的右手从沙土下取出了一把刀。");
	text = text.replace("He holds it toward your crotch.", "他将它抵在你的裤裆上。");
	text = text.replace("I\'m deadly with the blade, as I\'m sure you are with that stinger there.", "好我相信我的刀如同你那里的毒刺一样致命的。");
	text = text.replace("Now, I know you are merely petting things which shall make me purr, preying upon my pride as the hunter does the lions, and I will say this: it has worked.", "现在，我知道你只是在试图让我软下来，像猎手抚摸狮子一样捕食我的自尊，而我得说：它起效了。");
	text = text.replace("I will fight for you, captain of the Crownlings, and I will fight well.", "我会为你战斗，逐币者的首领，我会很好的战斗的。");
	text = text.replace("Nodding, you ask that he lower the blade.", "点头，你问他能不能把刀放下。");
	text = text.replace("He spins it in his hand and sheathes it in one swift motion.", "他把它旋转在手中快速的收到了刀鞘中。");
	text = text.replace("He gets to his feet, stripping himself down until he is buck naked.", "他站起身，脱下衣服直到全裸。");
	text = text.replace("This life I will leave behind in total, and to the Crownling\'s life I will be devoted in whole.", "我将把这种生活彻底抛在脑后，并将自己全身心的投入逐币者的生活中。");
	text = text.replace("You shake the man\'s hand.", "你与男人握手。");
	text = text.replace("A passerby glances over and scratches his head.", "一个路人瞥到了这一幕挠着头说道。");
	text = text.replace("Wait a minute, you\'ve a snake down there!", "等一下，你下面有条蛇！");
	text = text.replace("I thought you were a lady of the dance, but this...", "我以为你是个舞女，啊这…");
	text = text.replace("He dabs his forehead with a cloth and lowers his voice.", "他用衣服蹭了蹭额头并压低声音说道。");
	text = text.replace("This makes it even better.", "这不是更好了吗。");
	text = text.replace("The dancer looks at you and laughs.", "舞者看着你笑了出来。");
	text = text.replace("We\'ve all dangers to confront in our respective vocations, Crownling, and I look forward to seeing yours.", "我们的行业都有各种各样的危险，逐币者，现在我很期待看看你的。");
	
	text = text.replace("You tell the dancer that he is one of the best you\'ve seen with a blade. He laughs.", "你告诉舞者他是你见过的最好的刀锋之一。他笑了。");
	text = text.replace("A truly well intentioned attempt on your part, Crownling, to drag me to your ways of life.", "你努力的很好，逐币者，试图把我拖到你的生活方式上。");
	text = text.replace("But you know well that there is nothing you could say or do that would take me away from this life.", "但是你知道的，说或做，你无法将我从这种生活中剥离。");
	text = text.replace("Yes, the blade suits me well, but so does flittering about for the crowd, earning praise without spilling blood to do it.", "是的，刀很适合我，但为了群众起舞，不溅血的获得赞美。");
	text = text.replace("You go play gladiator on the sands and earn you coin, Crownling, and I will be here earning mine.", "你就在沙地上扮演角斗士挣你的硬币吧，逐币者，而我会在这里赚我的。");
	
	text = text.replace("You offer five hundred crowns to the dancer.", "你向舞者提出了这五百克朗。");
	text = text.replace("He keeps picking up coins - one at a time - and putting them in his clay pot.", "他继续捡着硬币－一次一个－并将它们放到他的陶罐子里。");
	text = text.replace("It is almost a silent affair, coins clapping loudly as they fall into a nearly empty barrel of clay.", "静悄悄的，只有硬币碰撞和掉入一个近乎空的陶罐中的声音。");
	text = text.replace("He looks up, looks down.", "他上下观望。");
	text = text.replace("He puts in one more crown then gets to his feet.", "他将又一个克朗放入并站了起来。");
	text = text.replace("He strips off his clothes and holds out his hand.", "他脱下他的衣服并伸出手。");
	text = text.replace("The Gilded One must be gleaming upon us both, for you to have earned such keep, and no doubt He has guided your purse here to bring it to me.", "镀金者一定照耀这我们两人，看你能赚取这么一笔财富，无疑他把你的钱袋领向这里是为了交给我。");
	text = text.replace("You nod and shake his hand.", "你点头并和他握手。");
	text = text.replace("A passerby glances over and scratches his head.", "一个路过的人瞥过来挠着他的头说。");
	text = text.replace("Wait a minute, you\'ve a snake down there!", "等一下，你下面有条蛇！");
	text = text.replace("I thought you were a lady of the dance, but this...", "我以为你是个舞女，啊这…");
	text = text.replace("He dabs his forehead and lowers his voice.", "他擦了擦额头并压低了声音。");
	text = text.replace("This makes it even better.", "这不是更好了吗。");
	text = text.replace("Sighing, the dancer asks that he take a look at your inventory.", "叹着气，舞者想看看你的库存。");
	text = text.replace("A body like mine, anything will fit, inside or out, I\'ll make it work.", "我这样的身体，什么装备都能穿上的，不论内层外层，都可以。");

//cannon_execution_event.nut
	text = text.replace("You come across a man in military garb with a pair of similarly dressed guards.", "你遇到一个军人穿着的男人和一对衣着相似的卫兵。");
	text = text.replace("Between them is a man with his arms and legs tied akimbo to a giant mortar, his torso facing into the barrel, his head resting atop its sights.", "在他们中间是一个手脚绑在巨大臼炮上的男人，他的躯干面向炮管，他的头靠在瞄具上。");
	text = text.replace("He looks up at you with a side eye.", "他抬头用侧眼看向你。");
	text = text.replace("Ah, traveler. I\'m in quite the predicament.", "啊，旅行者。我这儿陷入了个不小的麻烦。");
	text = text.replace("You see, these fine, muted gentlemen wish to splash me across the sands using the greatest technical marvel of our age.", "你看的出来，这些友善的，沉默绅士们想用这个我们时代的技术奇观来把我射出沙漠。");
	text = text.replace("Whilst I can see the benefit of avoiding the executioner\'s rusted sword, I must confess that to have my final moment be one of watching my own body parts bomb the desert creatures to be one of severe embarrassment.", "尽管这可以让我避开行刑者的锈剑，我必须坦白在最后时刻看着自己的身体轰炸沙漠生物是相当羞耻的。");
	text = text.replace("A fair penalty for some crimes, no doubt, but I am a mere thief.", "对于某些罪行而言固然是合理的，但我只不过偷了点东西而已。");
	text = text.replace("The military executioner glances at you, but just as the thief said, he appears to be a mute.", "士兵装束的行刑者瞥向你，但就像那个贼说的意义，他看起来是个哑巴。");
	text = text.replace("Or possibly deaf, as his role as mortarman might imply on its own.", "或者是聋子，如果去解读他臼炮手的工作是怎么来的。");
	
	text = text.replace("The executioner surprisingly answers, plugging one ear with a finger as he talks.", "行刑者出人意料的回答了，一边用根手指掏着耳朵说道。");
	text = text.replace("Crownling, this does not concern you. Move along.", "逐币者，这与你无关。走开。");
	text = text.replace("The thief tries to turn his head again.", "小偷再次试着扭动他的头。");
	text = text.replace("Ah, ah! He speaks! Wonderful.", "啊，啊！他会说话！太棒了。");
	text = text.replace("Let us hash this out like good gentlemen with sensibilities kind to but also ahead of our current era.", "让我们好好聊聊这件事，像或许有点超前我们时代的明事理的好先生们会做的那样。");
	text = text.replace("The executioner ignores the thief\'s articulate pleas.", "行刑者无视了小偷花言巧语的请求。");
	text = text.replace("I shall make a deal for your neutrality, Crownling.", "我会为你保持中立提出一个交易，逐币者。");
	text = text.replace("When this thief is splashed across the desert, you may have whatever is inside of him for, you see, it is said that he carries a heart of gold.", "当这个贼洒到沙漠上，你可以拿走他的任何东西，你懂得，他们说他有一颗金制的心。");
	text = text.replace("The thief nervously speaks.", "小偷紧张的说道。");
	text = text.replace("That means something else where I\'m from.", "这在我的家乡意味着别的含义。");
	text = text.replace("You ask the executioner to explain.", "你让行刑者解释。");
	text = text.replace("He states that the Gilder \'touches\' those who oppose Him, condemning and dooming the hated with insides made of gold.", "他声称镀金者会“触碰”那些叛逆者，通过让他们的内脏变成金子来惩罚他们。");
	text = text.replace("The condemnation is a level beyond being merely indebted.", "这样的惩罚比负债更高一层。");
	text = text.replace("It sounds rather fantastical, even for you.", "这挺起来很奇幻，就算对你而言。");
	
	text = text.replace("You\'re interested to see if what the executioner says is true and stand aside. The thief sighs.", "你对于行刑者的说法感兴趣，想看看他说的是真是假便站在了一边。小偷叹了口气。");
	text = text.replace("Well. Alright then. Just make sure that when they write about me, that this execution isn\'t canon.", "好。那么好吧。当他们记述我的时候，注明这不符合标准。");
	text = text.replace("That\'s \'canon\' spelled with one-", "那是“标准”的拼法－");
	text = text.replace("The explosion disintegrates the man and the pulverizing force shunts a wave of sand clear of the mortar itself, expelling a cloud of dust and gore, swirling through the air like some storm of viscera, and a few moments later the body parts begin to pitter-patter about the ground.", "爆炸粉碎性的力量将一波沙尘从迫击炮上弹开了，射出一股血与沙的烟，在空中旋转好似一个风暴，过一会东西开始噼里啪啦的掉到地上。");
	text = text.replace("None of these bits and pieces are golden.", "这些零碎的东西没有一块是金的。");
	text = text.replace("In fact, most are charred black or vibrantly red, freshly bared to the world to see.", "实际上，大部分要么焦黑要么亮红，暴露给这个世界。");
	text = text.replace("The executioner wipes the gunpowder from his face.", "行刑者从他脸上抹去火药。");
	text = text.replace("It appears we were wrong.", "看来我们错了。");
	text = text.replace("The thief shall be compensated by the Gilder Himself, oh to be that lucky.", "这个小偷会被镀金者亲自补偿的，哦，真幸运。");
	
	text = text.replace("You inform the guards and executioner that you\'ll be stopping the execution.", "你告诉卫兵和行刑者你要阻止这场行刑。");
	text = text.replace("They immediately stand back from the mortar.", "他们马上从臼炮边离开。");
	text = text.replace("The executioner plugs his ear again.", "行刑者又开始掏耳朵了。");
	text = text.replace("A stay of execution?", "暂缓执行？");
	text = text.replace("Or did you say to start it?", "又或者你来说开始？");
	text = text.replace("The thief nervously laughs.", "小偷紧张的笑道。");
	text = text.replace("Yes, Crownling, please clear that up for our friend here.", "是的，逐币者，帮我们这位朋友理清楚。");
	text = text.replace("The matter is settled slowly and for all to hear.", "事态缓慢的平和了下来。");
	text = text.replace("Surprisingly, the guards agree.", "意外的，守卫们同意了。");
	text = text.replace("They see you not as a random intervention, but as one sent from the Gilder Himself, for why else would you be there?", "他们并未将你视作一个随机干预者，而是镀金者的使徒，不然你怎么会在这里？");
	text = text.replace("The thief is cut free from the device and he is handed over to the company.", "小偷从装置上被解放出来并交给你的战队。");
	text = text.replace("He holds his hand out.", "他伸出他的手。");
	text = text.replace(/All funny business aside, I\'ll fight for you, uh, hmmm\.\.\. the (.*?)\. Quaint\./, "抛开所有有趣的事情，我会为你而战，呃，嗯… $1。奇特而有趣。");
	text = text.replace("But I\'m no ordinary thief, I\'m a man of pride, and a man with a sense of duty, and a man with a sense of crowns!", "但我不是个普通的小偷，我充满荣誉，使命感，当然还有对克朗的敏锐直觉！");

//cultish_arrangement_event.nut
	text = text.replace("You come over a sand dune to see a half dozen men.", "你翻过一个沙丘看到半打人。");
	text = text.replace("They are wearing black cloaks and have their sleeve-sheathed hands holding onto one another to form a complete circle.", "他们穿着黑色的斗篷，并且他们藏入袖子里的手连起来组成了一个完整的圆圈。");
	text = text.replace("Despite every one of their heads being down, they all seem to sense your presence and turn to stare.", "尽管他们中的一个低着头，他们看起来都注意到你并转过头来看。");
	text = text.replace("One man lets his hands go and steps forward.", "其中一个放开了他的手并走上前来。");
	text = text.replace("Davkul awaits us all, traveler, even the gilded path permits his patience.", "达库尔即将降临到我们，旅行者，即使镀金者的道路也在他的耐心之内。");
	
	text = text.replace("You draw your sword and order the company to make short work of the cultists.", "你拔出你的剑并命令队伍快速解决这些异教徒。");
	text = text.replace("They are set upon with ease, the cultists not even so much as raising a hand to resist their own demise.", "他们坦然的接受了，异教徒甚至不举手抵抗他们自己的死亡。");
	text = text.replace("A survivor coughs as he lets an open wound bleed.", "一个幸存者任由伤口流血咳嗽了起来。");
	text = text.replace("He holds his hand out as if to show you your handiwork.", "他伸出他的手好似要给你展示你的所作所为。");
	text = text.replace("With all your hard work you cannot buy time, sellsword.", "你的一切努力都不能争取更多时间，佣兵。");
	//text = text.replace("Davkul awaits us all.", "达库尔即将降临到我们。");
	text = text.replace("You take your dagger out and end the man.", "你拿出你的匕首了结了他。");
	text = text.replace("You kick his body over and loot it, as well as the other corpses, though not much is to be found.", "你踢开他的尸体并搜刮了一番，尽管没找到什么有用的东西。");
	
	text = text.replace(/(.*?) steps forward, brandishing his scarred pate for all the strangers to see\./, "$1 走上前来，向所有陌生人们展示他饱受伤痕的头顶。");
	text = text.replace("They nod and bow, and their leader speaks with his eyes to the sands.", "他们点着头伏下身，然后他们的头领看着沙子说道。");
	text = text.replace("Davkul has spoken.", "达库尔说了。");
	text = text.replace(/Nodding, (.*?) responds\./, "点着头，$1 回应道。");
	text = text.replace("And to every word I listen.", "还有我听到的每一个字。");
	text = text.replace("The leader retrieves a strange blade seemingly out of nowhere and runs it across his fingers.", "头领不知道从哪里拿出一把奇怪的刀并划过他的手指。");
	text = text.replace("He speaks again without looking up.", "他埋着头再次说道。");
	text = text.replace("Then do as he requests.", "那便遵从他。");
	text = text.replace(/(.*?) takes the blade and nods\./, "$1 拿走刀点了点头。");
	//text = text.replace("Davkul awaits us all.", "达库尔即将降临到我们。");
	text = text.replace("The strange men collapse to the ground and put their faces into the sand.", "奇怪的人们倒在地上，脸埋入沙子。");
	text = text.replace("Their chests rise and fall, tremor, and then they move no more.", "他们的胸口上和下，颤抖，然后停滞。");
	text = text.replace(/They have drowned themselves into the desert herself\. (.*?) returns carrying a bizarre dagger with him\./, "他们把自己淹死到了沙漠中。$1 转过身回来，身上带着一把诡异的匕首。");
	
	text = text.replace("You offer a modest hello and goodbye to the black cloaks, then move on.", "你低调的致敬并向这些黑袍人告别并继续前进。");
	text = text.replace("They do not resist you, nor call out to you in any manner.", "他们没有阻止你，也没有任何回应。");
	text = text.replace("The last you see of them they are holding hands again and have their heads crooned forward and staring into the sands.", "你最后看到他们，他们又一次把手牵在一起，头顶着沙地轻声哼唱着什么。");
	text = text.replace("There is not a single jug of water or basket of food anywhere to be seen.", "视线中没有任何水或食物。");
	text = text.replace("If they had not come here to die, what could possibly save them?", "如果他们不是来到这里找死，又有什么可以救他们？");

//cultural_conflagration_event.nut
	text = text.replace("Shouting and yelling drags you from counting inventory.", "吼叫声把你从整理库存中引开。");
	text = text.replace("You find a few of the men standing at opposite ends of the campfire pointing fingers and even a weapon or two.", "你看到几个人在篝火的另一边用手指或者武器指来指去。");
	text = text.replace("Seems there\'s a bit of a dustup over whose women are more beautiful: southerners or northerners.", "看起来是一场关于哪里的女人更漂亮的骚动：南方人或北方人。");
	text = text.replace("Ironically, the northerners are voting for the southerners and vice versa.", "讽刺的是，北方人投给南方女人，南方人投给北方女人。");
	text = text.replace("A couple of stern commands brings order back to the company, but the tensions remain.", "几声严厉的指令让队伍恢复了秩序，但是局势依旧紧张。");
	text = text.replace("There\'s been a bit of fisticuffs between some of the men.", "队伍里一些人有点拳脚摩擦。");
	text = text.replace("Apparently, there was a disagreement about the marriage rites between men and women.", "很显然，是关于男女婚礼的矛盾。");
	text = text.replace("The northerners believe it should be one and one, while the southerners prefer marrying as many women as one can get their hands on.", "北方人相信应该是一夫一妻制，而南方人倾向于越多女人越好。");
	text = text.replace("You tell the men to stop fighting like women and focus on the task at hand, which may or may not be to finish a job to get coin to then spend on a woman, but that\'s neither here nor there.", "你告诉他们停止像个娘们一样打架并集中注意力到工作上，这个工作后是否拿着报酬去花在一个还是很多个女人身上你一点都不关心。");
	text = text.replace("A couple of the men get into it over some religious differences.", "几个手下因为一些宗教差异发作了。");
	text = text.replace("Some conflict over the old gods and the Gilder, each man a little ambassador of his faith, diplomatically putting fists into the opposition\'s faces.", "旧神与镀金者的冲突，每一个人都好像个信仰大使似的，外交官风格的把拳头移到另一边的脸上。");
	text = text.replace("You tell them all to quit it and get their heads straight.", "你告诉他们停下清净会儿。");
	text = text.replace("If they want to argue over which gods are best, they can do it in the afterlife.", "如果他们想争论哪个神最好，他们可以到来生再去争论。");
	text = text.replace("A couple of the men get into it over matters of... sand?", "几个人在争吵，听起来是因为，额…沙子？");
	text = text.replace("It seems the northerners in the company are poking fun at the southerners, asking how stupid one would have to be to settle in a land with nothing but sand.", "看起来队伍里的北方人在开南方人的玩笑，问他们人得有多蠢才会住在一片只有沙子的土地上。");
	text = text.replace("Who looks around in a hot arse sandy dune and thinks, aye, this\'ll be my home.", "谁会环顾着一片烫屁屁的沙丘时向着，啊，我要在这安家。");
	text = text.replace("Bet you wish yer forefathers had a proper mind to realize there\'s more to the world than a gods damned forever sunburn.", "我怀疑你们儿的祖先有足够清晰的意识来认识到这个世界不止有没完没了的日照。");
	text = text.replace("This garners the first punch thrown.", "这引来了第一拳。");
	text = text.replace("The scuffle has a few injured, but you get the men back to order, commanding them to keep their geographic opinions to themselves.", "扭打让几个人受了点伤，但你让手下恢复了秩序，命令他们有什么地理意见都憋着。");
	text = text.replace("An argument breaks out when southerners in the company start poking fun at their northern brothers\' lack of articulation.", "一场争论因战队中的南方人嘲笑他们的北方兄弟缺少谈吐教养爆发了。");
	text = text.replace("One mimics with his hands splayed out at his ears.", "其中一个用他的双手在他的耳边展开。");
	text = text.replace("We\'s all talks like this, aye, yessir, ain\'t y\'all ready to come on to somesuch sumbitch thing, aye? Ain\'t ain\'t ain-", "我们都是这样说话的，是的，是先生，俺们伙计们一起整点婊子活？俺俺俺们－");
	text = text.replace("Fisticuffs end the jestering.", "拳脚中断了玩笑。");
	text = text.replace("A few are bruised in the exchange, but you manage to break it up before it gets more serious.", "几个人在交手中有点擦伤，但你在事态更严重之前制止了他们。");
	text = text.replace("Though normally dismissive of their overlords, the northerners and the southerners take to defending the lords and Viziers of their lands respectively.", "尽管通常对他们的领主不屑一顾，北方人和南方人开始捍卫他们各自的领主和大臣们。");
	text = text.replace("It seems the foil of having some cultural opposition has spurred heretofore unseen fealties.", "看起来文化对立激起了一些从前没见过的忠诚感。");
	text = text.replace("The arguments unwind into an actual fist fight, with not a lord around to be impressed, mind.", "争论发展成一场实际的拳击，当然边上没有什么可以让他们给留下好印象的领主。");
	text = text.replace("You break it up, telling them the only one they should look to impress is either you or each other as brothers in battle.", "你分开他们，告诉他们应该多给你和身边的战友留点好印象。");

//desert_bugbite_event.nut
	text = text.replace(/While standing around looking at maps and taking inventory, (.*?) suddenly yells out and falls over in the sand\./, "你在地图边转着检查仓库，突然 $1 喊叫着摔倒在沙地上。");
	text = text.replace("He slaps at his legs and a black scorpion goes soaring.", "他拍打他的腿把一只黑色的蝎子拍上半空。");
	text = text.replace(/Another sellsword screams and chops the bug in half with the sort of ferocity you\'ve never even seen him use on the battlefield\. (.*?) clenches his teeth as he takes off his boots\./, "另一个佣兵尖叫着把那虫子切成两半，力道比你在战场上看到他用过的任何攻击都大。$1 咬着牙拿下他的靴子。");
	text = text.replace("It looks like someone jammed a nail into his ankle.", "看起来像给人钉了一钉子在脚踝上似的。");
	text = text.replace("He says he\'s feeling woozy, but it\'s not too serious.", "他说他有点恍惚，但不是很严重。");

//desert_fall_event.nut
	text = text.replace(/As you tread down the slope of a dune, (.*?) loses his footing and starts to slide down\./, "随着你走下一个沙丘的斜坡，$1 脚滑了一下开始向下滑动。");
	text = text.replace("He yells out for help, flailing as he tumbles downward.", "他叫着求助，手舞足蹈的往下滚着。");
	text = text.replace("Each tumble gains speed and air, every roll of the limbs seemingly arcing him higher into the air than the last.", "每一次颠簸都在加速，每一次滚动肢体都好像把他比上一次弹的更高了。");
	text = text.replace("Despite the silky, slipperiness of the dune\'s slope, the bottom of its valley is a hard firmament and the sellsword grinds across it until he comes to a complete stop.", "尽管沙丘的斜坡如丝顺滑，谷地的底下则充满了硬物，而那个佣兵一路剐蹭过去直到完全停下来。");
	text = text.replace("He\'s not dead but comes away a little banged up, with scrapes, bruises, burns, and a hint of embarrassment.", "他没死，但是受了点冲击，划伤，淤青，灼伤还有点羞耻。");

//desert_feet_event.nut
	text = text.replace("Marching through sand dunes for days has built up a lot of grit in the boots of the men.", "在沙丘间行军数日让手下们的靴子里钻进了不少砂砾。");
	text = text.replace("A few take pause, emptying out their shoes, while others reveal that their feet have been ground raw.", "几个人停下，清理他们的靴子，其他人显示出他们已经被磨得像地面一样粗糙的脚。");
	text = text.replace("This is a hellish landscape, it seems, no matter if it\'s the sun above or the sands below, it\'s all out to get you.", "这看来可真是个地狱般的地形，不论是上面的太阳还是下面的沙地，都在给你带来麻烦。");

//desert_heat_event.nut
	text = text.replace(/(.*?) sags into the sands, one knee buckling, and as soon as it straightens back up the other buckles in turn\./, "$1 倒向沙地上，一只腿发软，刚挺直另一只腿就发软了。");
	text = text.replace("You look back just in time to watch as his eyes roll back in his head and he crumples.", "你回头看他时正好看到他翻白眼瘫倒下去。");
	text = text.replace("The company rushes to his help, getting him water and shade.", "战队赶来帮他，给他水和遮蔽。");
	text = text.replace("He hacks and thrashes back to life, but the withering heat has already done its damage.", "他又抡手又扭腰的恢复过来，但是炎热已经造成了伤害。");

//desert_sand_event.nut
	text = text.replace("A desert is unfriendly land to interlopers.", "沙漠对于入侵者可不友好。");
	text = text.replace("Even if your equipment bears the weight of this natural hostility: some of the gear has been worn down by the sands themselves.", "就连你的装备都承受了这种自然的敌视：一些装备被沙子本身给侵蚀了。");
	text = text.replace(/Cleaning and sharpening will be needed to maintain to the quality of the (.*?)\'s equipment\./, "要维护 $1的装备会需要好好的清理和打磨一番。");

//desert_well_event.nut
	text = text.replace("You come to a watering hole.", "你遇到一个水井。");
	text = text.replace("The well\'s walled exterior is embroidered with animal skulls and similarly stitched with their ribs.", "井的外墙布置着动物头骨还有同样挂上去的动物肋骨。");
	text = text.replace("As you draw near, there\'s a faint hiss from the depths.", "随着你靠近，深处传来微弱的嘶嘶声。");
	text = text.replace("Staring in, you see a tiny orange glow snaking left to right.", "向里面望去，你看到一个细小的橘色光点左到右蜿蜒而过。");
	text = text.replace("You might want to try not looking down there.", "你最好不要多往下看。");
	text = text.replace("You turn around to see a man dressed in rags.", "你转身看到一个穿着破布的人。");
	text = text.replace("His hair is spiked backwards in black chevrons.", "他的头发丫字形的向后突出。");
	text = text.replace("Dark splotches pepper his face and he\'s got bruises on every fingernail and a tarred smile.", "脸上满是黑色的斑点以及每个手指上都一样的淤青还有一个黑漆漆的笑容。");
	text = text.replace("It\'s about to blow.", "要喷发了。");
	
	//text = text.replace("The man nods.", "这个人点头。");
	text = text.replace("That ain\'t no watering hole, that\'s a cannon.", "那不是什么水井，那是个大炮。");
	text = text.replace("I got a pile of fire powder in the bottom.", "我在底下堆了许多火药。");
	text = text.replace("The chute is armed with buckets, and fishing rods, all manner of cutlery, some soldier\'s metal boots, a broken sword, couple of scabbards, I think a few animals fell in but they no doubt dead now, if not they\'re going for a ride.", "滑道上装着水桶和钓鱼竿还有各种各样的餐具，某些士兵的铁靴子，一把短剑，几个剑鞘，我想有几个动物掉下去现在他们应该都死了，如果没有他们有好戏看了。");
	
	text = text.replace("The man grins.", "那人咧嘴一笑。");
	text = text.replace("You don\'t know a damn thing about me, stranger.", "你根本不了解我，陌生人。");
	text = text.replace("Maybe I aim to kill myself cause I done a terrible crime.", "也许我的目的是自杀，因为我犯了一个可怕的罪行。");
	text = text.replace("I mean, I haven\'t, but what\'re you doing going off about \'don\'t do it\'?", "我的意思是，我没有，但是你为什么要说“不要做”呢？");
	text = text.replace("You\'ve seen my preparation, were I of the mind to pause wouldn\'t I have done it at any prior moment?", "你已经看到了我的准备，如果我想停下来，我以前不会做吗？");
	text = text.replace("Now you set back there and watch this.", "现在，你退下看好了。");
	text = text.replace("He turns and leaps into the hole.", "他转身跃入了洞。");
	text = text.replace("There\'s a clatter of his crashing, some murmuring about how there\'s more debris than he remembers.", "他坠落的响声传出来，还有些咕哝说他不记得有这么多碎片在下面。");
	text = text.replace("When you look down he yells at you to clear out and the orange glow zips into a hole. The man bows.", "当你往下看他叫你闪开然后橘黄色的光点进入了一个洞。那个人鞠躬。");
	text = text.replace("I bid you good stranger, a strange farewe-", "祝你好运陌生人，一个奇怪的告别－");
	text = text.replace("The explosion blows out your ears and puts you on the ground.", "爆炸令你耳鸣并把你震到地上。");
	text = text.replace("The earth rolls beneath you in tremble that can be felt through the deafness which you are now submerged.", "你身下的土地颤抖的翻滚着你甚至在这种被震聋的状态下都能感受到。");
	text = text.replace("A pluming cloud of fire spears into the sky and growls with the clinking and clanking of metals and the dull plops of leather and other goods, and you roll to your belly and cover your head as it all comes down like the scraps of some god\'s hellstorm.", "一股烟火刺入天空伴随着金属金属的叮叮当当还有更平钝的皮革和其他物资落地的扑通声，而你蜷起身子护住头保护自己免于下雨一样的各种废品，就好像什么神的地狱风暴似的。");
	text = text.replace("Absolutely none of the debris is of any use.", "这一些残渣绝对毫无任何用处。");
	text = text.replace("As for the man himself, well, he got his wish.", "至于那个人，好吧，他得到了他想要的。");
	text = text.replace("He no doubt died in the blink of an eye, all that remains are charred chunks here and there and broiled lungs and seared strips of sinews and more.", "毫无疑问，他在眨眼间就死了，剩下的只是到处烧焦的大块，烤过的肺和烧焦的肌腱等等。");
	text = text.replace("You check to make sure your eyebrows are still there and, satisfied, prepare to move on.", "你检查了一下来确认你的眉毛是否还在，有些欣慰，你准备继续赶路。");
	
	text = text.replace(/(.*?) the monk steps forward\./, "$1 这个僧侣走上前去。");
	text = text.replace("That\'s a lotta work to end yourself, friend.", "为了了结自己可花了不少功夫啊，朋友。");
	//text = text.replace("The man shrugs.", "那人耸了耸肩。");
	text = text.replace("I\'m not really your friend.", "我并不真的是你的朋友。");
	text = text.replace("The monk nods.", "僧侣点了点头。");
	text = text.replace("Turn of phrase, nothing more.", "语言习惯，仅此而已。");
	text = text.replace("In truth I know nothing about you.", "说实话我不知道你的任何事情。");
	text = text.replace("In truth you likely have a good reason to be doing this.", "说实话你很可能有一个很好的理由来做这些事。");
	text = text.replace("How much time have you spent putting this together?", "你花了多长时间把这些东西堆起来？");
	text = text.replace(/The strange man thinks for a time, then says he thinks it\'s been months\. (.*?) smiles\./, "奇怪的男人思考了一会，之后说他想可能用了几个月。$1 笑道。");
	text = text.replace("Now that\'s good, hard work.", "做得很好，这是很艰苦的工作。");
	text = text.replace("The man says.", "那人说。");
	text = text.replace("You trying to coddle me?", "你在试图哄我？");
	text = text.replace("The monk shakes his head.", "僧侣摇了摇头。");
	//text = text.replace("No Sir.", "不，先生。");
	text = text.replace("The man slims his eyes and stares incredulously.", "男人咪起了他的眼难以置信的说。");
	text = text.replace("Sounds to me like motherly talk.", "我听起来你好像在把我当小孩子哄。");
	text = text.replace("Like you\'re trying to sweet talk me into not killing myself.", "想说服我不要杀了自己。");
	text = text.replace("Well I won\'t have it!", "不我不接受！");
	//text = text.replace(/(.*?) shrugs\./, "$1 耸了耸肩。");
	text = text.replace("Again, no sir. You go on and end yourself if that\'s what you wish.", "再一次错了先生。如果你想，继续了结自己吧。");
	text = text.replace("Today or later, the old gods will be waiting.", "今天或者以后，旧神们都会等着你的。");
	text = text.replace("The man turns and spits.", "那人转过身吐了一口唾沫。");
	text = text.replace("No old gods down here.", "这下面可没有旧神。");
	text = text.replace("Only the Gilder\'s gleam and glow.", "只有镀金者的闪耀与光辉。");
	text = text.replace(/(.*?) nods then turns to look at you\./, "$1 点头然后转身面向你。");
	text = text.replace("To be frank, captain, I really only got one thing left to say.", "老实说，队长，我真的只剩一句话可以说了。");
	text = text.replace("Can I say it?", "我能说吗？");
	text = text.replace("I just wanna tell it to the stranger, tell it to him straight.", "我想跟这个陌生人说出来，直接的说出来。");
	
	text = text.replace("The monk nods with your approval then suddenly swings around and cold cocks the stranger.", "僧侣在你的肯定下点头，然后突然给了陌生人一拳。");
	text = text.replace("He falls off the well wall and collapses into the dirt, staring up with his eyes wonked.", "他从井壁上摔下来，倒在泥土里，眼睛发抖地盯着看。");
	text = text.replace("What\'d you go and do that for?", "你干啥子？");
	text = text.replace(/He asks, touching his lip\. (.*?) crouches down\./, "他问道，摸着他的嘴唇。$1 蹲下。");
	text = text.replace("How\'s that feel?", "感觉怎么样？");
	text = text.replace("The stranger sneers and spits blood.", "陌生人讥笑着吐了一口血沫。");
	text = text.replace("He says it hurts. The monk nods.", "他说很疼。僧人点了点头。");
	text = text.replace("Feel alive?", "感觉活着吗？");
	text = text.replace("The stranger gets to his feet and dusts himself off. He nods.", "陌生人站起来拍了拍灰。他点头。");
	text = text.replace("A little, yeah.", "有点，确实。");
	text = text.replace("The two talk for a time and when it is over the man is willing to join the company free of charge.", "两个人聊了一会，当他们完事时那个人愿意免费加入战队。");
	text = text.replace("He also says that there are a number of goods in the well if they want to be used, though to be mindful to not drop any fire in there cause it\'ll blow sky high.", "他还说井里有不少东西你可以用上，尽管注意不要丢任何火下去因为会被炸到天上去。");
	
	text = text.replace("You tell the monk to stand down.", "你告诉僧侣退下。");
	text = text.replace("He shrugs and returns to your side.", "他耸耸肩便回到你身边。");
	text = text.replace("When you look back at the man you realize he\'s lit a fire and watch just as he leaps into the well.", "当你回头看向那个男人你看到他点了把火跳下了井。");
	text = text.replace("The explosion blows out your ears and puts you on the ground.", "爆炸令你耳鸣并把你震到地上。");
	text = text.replace("The earth rolls beneath you in tremble that can be felt through the deafness which you are now submerged.", "你身下的土地颤抖的翻滚着你甚至在这种被震聋的状态下都能感受到。");
	text = text.replace("A pluming cloud of fire spears into the sky and growls with the clinking and clanking of metals and the dull plops of leather and other goods, and you roll to your belly and cover your head as it all comes down like the scraps of some god\'s hellstorm.", "一股烟火刺入天空伴随着金属金属的叮叮当当还有更平钝的皮革和其他物资落地的扑通声，而你蜷起身子护住头保护自己免于下雨一样的各种废品，就好像什么神的地狱风暴似的。");
	text = text.replace("Absolutely none of the debris is of any use.", "这一些残渣绝对毫无任何用处。");
	text = text.replace("As for the man himself, well, he got his wish.", "至于那个人，好吧，他得到了他想要的。");
	text = text.replace("He no doubt died in the blink of an eye, all that remains are charred chunks here and there and broiled lungs and seared strips of sinews and more.", "毫无疑问，他在眨眼间就死了，剩下的只是到处烧焦的大块，烤过的肺和烧焦的肌腱等等。");
	text = text.replace("You check to make sure your eyebrows are still there and, satisfied, prepare to move on.", "你检查了一下来确认你的眉毛是否还在，有些欣慰，你准备继续赶路。");

//dried_oasis_event.nut
	text = text.replace("The desert is so awash in similarity that seeing a bit of greenery immediately draws the eye.", "沙漠里的景象是如此的一致以至于绿色非常惹眼。");
	text = text.replace("Such is the magnetism of an oasis.", "这就是绿洲的吸引力。");
	text = text.replace("You spot it at great distance, and upon approach you realize the green is not a tree at all, but a banner flying from the catch of a dead, dried tree.", "你很远就看到了它，而随着你靠近你意识到这个绿东西不是树，而是枯树上飘荡的旗帜。");
	text = text.replace("Around it are more dead trees, some having crumpled into the sands which eat at them from every side.", "在边上有更多枯树，有的陷入了沙漠，沙子从四面八方侵蚀着它。");
	text = text.replace("And in the midst of this passed oasis sets a skeleton with its face down in a small bowl of earth where, perhaps, water once was.", "在这个曾经的绿洲中央有一具面朝一片碗状土地的骷髅，或许这里曾经有过水。");
	text = text.replace("To the skeleton\'s side is a pile of treasures.", "骷髅边上是一堆宝藏。");
	text = text.replace("All the crowns in the world, but not a single drop of water with which to spend it on.", "满是克朗，但没有一滴水可以买。");
	text = text.replace("You move to get the gold, but the coins move with you, sliding apart as a black snake rises up and hisses at you.", "你拿起金子，但硬币随你移动，滑开变成一条黑蛇，挺起身向你发出嘶嘶声。");
	text = text.replace("Green poisons slickly drip from its fangs.", "绿色的毒液从它的獠牙上滴下。");
	
	text = text.replace(/(.*?) walks forward with his weapon in hand\./, "$1 拿着他的武器走上前。");
	text = text.replace("The snake rears up and the man stabs it clean through, instantly killing the creature.", "蛇弓起身然后他干净利落的捅过了它，瞬间杀死了这个生物。");
	text = text.replace("He holds it up at the end of his steel, wriggling its flesh before tossing it aside.", "他用剑的末端举起它，扭了一下后将它丢到一旁。");
	text = text.replace("Easiest pay I\'ve ever had.", "我接过最轻松的活。");
	text = text.replace("He says as the treasure is taken into the company\'s inventory.", "他说着这笔财富便被收入战队的仓库。");
	
	text = text.replace(/(.*?) walks forward with his weapon in hand\./, "$1 拿着他的武器走上前。");
	text = text.replace("The snake rears up and the man laughs and stabs down with his weapon.", "蛇弓起身，他笑着用他的武器捅下去。");
	text = text.replace("The snake deftly sidewinders around the steel and strikes up the shaft and nicks the man across his knuckles.", "蛇蛇灵地侧爬上剑并咬向他抓着柄的指关节。");
	text = text.replace("Screaming, he falls backwards, and the men collect him and drag him off.", "尖叫着，他往后退，人们接住他并把他拖开了。");
	text = text.replace("Soon he is convulsing and frothing and his entire hand bulbs and spews pus.", "很快他就开始抽搐口吐白沫还有他的手肿胀和化脓。");
	text = text.replace("You believe he\'ll survive, but it will be a great deal of time until he is ready to fight again.", "你相信他会活下来的，只是会花很长时间才能再次战斗。");
	text = text.replace("As for the treasure, it shifts in the sands and you can only watch as it slowly slips into the dune itself like a boat sinking into water.", "至于宝藏，它在沙中漂着而你只能看着它慢慢的像入水一样滑入沙丘。");
	text = text.replace("When you lean to see the last of it go, more black snakes emerge as if to warn you just who it belongs to: it\'s the desert\'s treasure now and forever.", "当你探身来看最后一点都消失，更多的黑蛇出现，好似要告诫你这些宝藏的所属者：它现在而且永远的是沙漠的宝藏了。");
	
	text = text.replace(/(.*?) looks down at the snake\./, "$1 俯视着蛇。");
	text = text.replace("He nods as though recollecting an old lesson.", "他点着头仿佛在回想起以前的课程。");
	text = text.replace("You only see these in the dunes. Highly venomous.", "你只会在沙丘中找到这些。剧毒。");
	text = text.replace("The serpent hisses at him.", "大蛇向他嘶嘶作响。");
	text = text.replace("The man nods back before shooting a hand out and snatching the snake by its head.", "他点着头突然将手伸出抓住蛇的头。");
	text = text.replace("Your venom begin and ends in your mouth, little one, but I can use it everywhere.", "你的毒只会在你的嘴中，小家伙，但我可以在任何地方运用它。");
	text = text.replace("I trust that you will be understanding of the trade.", "我想你会理解这种交易的。");
	text = text.replace("The man cracks the snake\'s head before cutting it clean off with a small blade and he pinches his finger over the reptile\'s stringy corpse. He nods again.", "他打碎了蛇头后用小刀切下并用他的手指按住蛇的长条尸体。他再次点头。");
	text = text.replace("I\'ll make use of the snake, and I trust you captain to make use of the treasure.", "我会用好这条蛇的，而我相信队长你会用好这些宝藏。");
	
	text = text.replace("You\'ve heard of such snakes killing men outright.", "你听说过这种蛇可以让人当场毙命。");
	text = text.replace("With that threat on the table, you do not feel it worth the trouble and leave the treasure behind.", "意识到这种威胁，你觉得这不值得并把宝藏留在原地。");

//fire_juggler_event.nut
	text = text.replace(/A fire juggler has the eyes of everyone in a plaza of (.*?)\. He\'s got a trip-set of torches with bronze handles\./, "一个玩火杂耍者吸引着 $1 的广场中所有人的目光。他有三套青铜把手的火把。");
	text = text.replace("His routine goes fairly well, but he does drop a torch at one point which raises some jeers in return.", "他的计划进行的不错，但他有一次掉了个火炬引来了些嘲讽。");
	text = text.replace("The next act he is to place a board over an open barrel of oil and then juggle the torches, arms out at his sides, except now with five torches instead of three.", "下一幕他要在一个打开的油桶上摆上一个板子，双手两侧展开，除了这样要同时耍五个火把。");
	text = text.replace("In summary, his next act seems to be one of suicide and he unsurprisingly looks reluctant to follow through with it.", "总结一下，他的下一幕表演看起像自杀而且他毫不意外的看来有点畏惧。");
	text = text.replace("But the crowed continues to cheer and jeer, no doubt snorting and huffing like a wolf pressing a deer to the cliffside, and the juggler, wide-eyed looks around for some form of escape.", "但是人群继续着欢呼和讥讽，无疑就像条狼将一只鹿赶到了山崖边，而那个杂耍者，眼睛张开环视四周寻找着某种出路。");
	
	text = text.replace("You sigh and step forward, yelling loudly at the juggler, feigning as though you are his manager, telling him he is not to give away the big show quite yet.", "你叹气着走上前，大声向杂耍者叫着，假装你是他的经理，告诉他他还做到这样的表演。");
	text = text.replace("The crowd quiets down, confused, then jeers at you.", "人群安静下来，困惑，然后向你讥讽起来。");
	text = text.replace("A draw of half your sword quiets them, and others murmur word of \'Crownling\', manifesting a series of hisses and boos.", "你半拔的剑使他们安静了下来，然后其他人嘟囔道“逐币者”，引起一系列的嘘声。");
	text = text.replace("But they ultimately disperse.", "但他们最终散开了。");
	text = text.replace("The fire juggler steps down from his theater piece and thanks you repeatedly.", "玩火杂耍者走下他的舞台来反复感谢你。");
	text = text.replace("I am not ready, I am not ready, and this you see with an eagle\'s eye, kind stranger!", "我没准备好，我没准备好，而你用你鹰一般的眼看出来了，友好的陌生人！");
	text = text.replace("Here, my day\'s earnings, have all of it, for none of it would have meant a crown to me were I to step up there and die!", "这儿，我今天的所得，都收下吧，毕竟如果我走上去死了这些克朗就都没意义了！");
	
	text = text.replace("You cross your arms and await the show.", "你将手叉在胸前等着表演。");
	text = text.replace("The fire juggler swallows hard and gets up on the barrel.", "玩火杂耍者深深咽下一口气并走上了桶。");
	text = text.replace("He lowers a torch down and one of the villagers lights it, but when the jester pulls the torch up the villager pretends to throw their own fire into the vat of oil.", "他放下火把并让一个村民点燃它，但是当他收回火把村民假装把他们自己的火丢进油桶。");
	text = text.replace("The juggler jerks away momentarily and the crowd laughs as the bemused jester laughs.", "杂耍者被短暂的吓到了，人群嘲笑他的同时他露出了小丑的笑容。");
	text = text.replace("But the jester nails the act.", "但是小丑做到了。");
	text = text.replace("All five torches whirl and twirl and a couple of times an ember sputters down and hits the rim of the oil barrel, but he is in control, and the crowd\'s jeers turn to cheers and when he is done they clap and then slowly disperse, going on to the next form of entertainment.", "五个火把转啊转，几次有一点余烬掉到油桶的边缘，但他掌控这情况，而人群的讥讽变成欢呼并在他表演完了后给予他掌声之后就慢慢的散开，前往下一个娱乐项目。");
	text = text.replace("One man drops a few crowns in the juggler\'s hands and that\'s that.", "其中一个人给杂耍者的手中放下几枚克朗，就这样。");
	
	text = text.replace("You cross your arms and await the show.", "你将手叉在胸前等着表演。");
	text = text.replace("The fire juggler swallows hard and gets up on the barrel.", "玩火杂耍者深深咽下一口气并走上了桶。");
	text = text.replace("He lowers a torch down and one of the villagers lights it, but when the jester pulls the torch up the villager pretends to throw their own fire into the vat of oil.", "他放下火把并让一个村民点燃它，但是当他收回火把村民假装把他们自己的火丢进油桶。");
	text = text.replace("The juggler jerks away momentarily and the crowd laughs as the bemused jester laughs.", "杂耍者被短暂的吓到了，人群嘲笑他的同时他露出了小丑的笑容。");
	text = text.replace("When the jester starts his act, he begins with setting himself on fire.", "当玩火杂耍者开始他的表演时，他把自己点着了。");
	text = text.replace("Literally the first torch slips his hand and goes right into the vat which launches a plume of flame from which there is no discerning between man and fire aside from the hellish screams.", "确实的，第一根火把就从他手上滑落直接掉到罐中引起一束火焰，其中无法分辨人与火除了尖叫。");
	text = text.replace("He scrambles off the \'stage\' and the crowd only rears back to point and laugh.", "他爬下“舞台”，群众们只是后退指着他笑。");
	text = text.replace("When he is dead, his crowns are taken by one of the residents.", "当他死去，他的克朗都被一个居民拿走了。");
	text = text.replace("They lift the gold to the sky, make a passing mention of the Gilded one, then dump the crowns into the flames.", "他们将金子举向天，顺便提到镀金者，然后就把克朗丢进了火里。");
	text = text.replace("His body is left for the dogs.", "他的遗体被留给狗。");
	text = text.replace("After all is said and done, you kick around in the ashes and find a plate of melted gold.", "在这一切之后，你在灰烬中踢来踢去找到一块融化了的金子。");
	text = text.replace("Not exactly of much value, but it\'s gotta be worth something and you take it when no one - not even the dogs - are looking.", "没有多少价值，但是总得值点钱，你在没人－连狗都没－看着的时候拿走了它。");
	
	text = text.replace(/(.*?), the company\'s own former juggler, steps forward\./, "$1，战队里的前杂耍者，走上前。");
	text = text.replace("He walks up on the \'stage\' which precariously hangs over the vat of oil.", "他走到危险的悬在油罐上的“舞台”。");
	text = text.replace(/The two exchange words, then (.*?) is the one left standing\./, "两个人交谈了几具，然后 $1 留在了上面。");
	text = text.replace("He performs the act - one he has neither practiced nor seen before - and completes it without issue.", "他开始了表演－一个他从没练习或看过的－并完美的完成了它。");
	text = text.replace("The crowd is silent, though.", "尽管，人群很安静。");
	text = text.replace("They merely watch, only occasionally glancing at you and the company.", "他们只是看着，时不时的瞟两眼你和你的战队。");
	text = text.replace(/When (.*?) finishes he opens his arms wide, but there is no applause\./, "当 $1 结束表演他张开他的手臂，但是没有欢呼。");
	text = text.replace("The Gilded spits on Crownlings, interloper, you dance for no one.", "镀金者只会向逐币者吐唾沫，入侵者，你不为任何人跳舞。");
	text = text.replace("And you, fire juggler, what do you have to say for yourself?", "还有你，玩火杂耍者，你有什么要为你说的吗？");
	text = text.replace(/(.*?)\'s fire juggler thinks, then turns to you\./, "$1的玩火杂耍者思考了一会然后转向你。");
	text = text.replace("I say I am tired of this nonsense, and if the Gilded one so despises us, then I\'ll have him despise me between the ranks of this here company.", "我说我厌倦这些了，如果镀金者如此厌恶我们，我就加入这个战队里让他鄙视。");
	text = text.replace("What say you, captain of the Crownlings, will you take me aboard?", "你说呢，逐币者的队长，你会带上我吗？");
	
	//text = text.replace("You nod.", "你点头。");
	text = text.replace(/Fireling, Crownling, whatever\. You\'re with the (.*?)\./, "玩火者，逐币者，随便什么。现在一起在 $1。");
	text = text.replace(/The crowd hisses again, but you tell them to fuck off, peppering the threat with a flash of your sword just in case they had any problems understanding\. (.*?), the fire juggler, thanks you profusely and quickly goes to your ranks where the company welcomes him about as begrudgingly as they do any new recruit\./, "人群再次发出嘘声，但你告诉他们滚远点，用你剑的反光给恐吓加点料以防他们没有明白。$1，玩火杂耍者，郑重的感谢你并快速的走到队伍中，那里伙计们像欢迎所有新兵一样不情愿的欢迎他。");
	text = text.replace(/As for (.*?)\'s people, they quickly tire of the drama and move on with their lives\./, "至于 $1的居民，他们很快厌倦了这点戏剧性回到日常生活中去了。");
	
	text = text.replace("You shake your head.", "你摇了摇头。");
	text = text.replace("The fire juggler lowers his.", "玩火杂耍者放低了他的声音。");
	text = text.replace("Oh. I thought we had a thing here.", "噢，我以为我们可以做到点什么。");
	text = text.replace("Pursing your lips, you shake your head again.", "咬住嘴唇，你再次摇了摇头。");
	text = text.replace("No...there is no \'thing\' here.", "不...这里没有什么可以“做到”的。");
	text = text.replace("I just don\'t want you in my company, no hard feelings.", "我只是不想你加入我的战队，与你个人无关。");
	text = text.replace("Keep, uh, practicing. You know, with the fire, and the sticks, you\'ll get it someday I\'m sure.", "继续，呃，练习。你懂得，耍火什么的，还有棍子，你总有天会做到的我相信你。");
	text = text.replace("The fire juggler nods.", "玩火杂耍者点头。");
	text = text.replace("Of course. And though you have rejected me, I believe the Gilder has us both just where we are meant to be, and that His intention was not for our paths to cross fruitlessly.", "当然。以及尽管你拒绝了我，我相信镀金者会让我们都到达我们应到的位置的，而他的目的不会让我们的交错毫无意义。");
	text = text.replace("I will be sure to speak highly of your company wherever I go!", "无论我走到哪里，我一定会高度评价你的战队的！");

//gladiators_food_event.nut
	text = text.replace("The Gladiators demand better food.", "角斗士们在要求更好的食物。");
	text = text.replace("I\'m sorry, \'captain\', but what would you have me do with this?", "抱歉，“队长”，但是你让我拿这东西怎么办？");
	text = text.replace(/(.*?) holds up a loaf of bread\./, "$1 举起一片面包。");
	text = text.replace("Where\'s the meat? Look at it. LOOK. At it.", "肉呢？看看它。看。着它。");
	text = text.replace("Who made this? A baker?", "谁做的这个？面包师？");
	text = text.replace("You want me to a baker\'s loaf?", "你想让我吃面包师烤出来的软玩意？");
	text = text.replace("I want to eat that which fights back.", "我想吃些会反抗的东西。");
	text = text.replace("Does bread fight back?", "面包会反抗吗？");
	text = text.replace("I don\'t think so.", "我不这么认为。");
	text = text.replace("It seems the Gladiators might be far from the arena, but not far from the coddled treatment the chefs there gave day in and day out.", "看起来角斗士或许离竞技场很远但是并没有忘记那里的厨师每天提供的美食。");
	text = text.replace("Perhaps you should seek a variety of high quality food to keep them quelled.", "或许你应该找点更高档的食物来平息他们。");
	text = text.replace("Where is the good stuff, huh?", "好东西在哪，哏？");
	text = text.replace(/(.*?) holds up a piece of a meal\./, "$1 举起一份食物。");
	text = text.replace("It is stringy and flops around in his hand.", "它被卷成一条从他的手中垂下。");
	text = text.replace("This is not the food of gladiators, it is the food of wimps!", "这不是角斗士该有的食物，这是软蛋的食物！");
	text = text.replace("He turns and throws the food and it slaps against the side of the company wagon where it unsticks and then curls over like an upside down hook.", "他转过身来，把食物扔了出去，食物拍打在战队载重货车的侧面，没有粘住然后便像个倒挂的钩子般软了下来。");
	text = text.replace("We demand good food, captain!", "我们要求更好的食物，队长！");
	text = text.replace("None of this gamey shit.", "不是这些变质的玩意。");
	text = text.replace("You should probably look into getting the gladiators food that is more to their standards.", "你或许应该试着给角斗士安排点符合他们标准的食物。");
	text = text.replace("Where\'s the wine? Where are the delicatessens!", "酒呢？美食呢！");
	text = text.replace(/(.*?) takes his plate of food and throws it like a disc\./, "$1 拿着他的一盘食物并把它像飞盘一样扔出去。");
	text = text.replace("It goes impressively far, bits of food spraying off in a cone of caloric debris.", "它飞的还挺远，食物洒呈一个锥形。");
	text = text.replace("I demand delicatessens, captain!", "我要求美食，队长！");
	text = text.replace("Where are my delicatessens?", "我的美食在哪里？");
	text = text.replace("It seems the gladiators require food of finer qualities.", "看起来角斗士需要更高质量的食物。");

//gladiators_vibes_event.nut
	text = text.replace(/(.*?) watches (.*?) pluck at his eyebrows, using the sheen of his weapons blade for a mirror\./, "$1 看着 $2 拔着他的眼睫毛，用它武器刀刃的反光当镜子。");
	text = text.replace(/Your back is looking thick and tight, (.*?)\. Das it, mane\./, "你的背看起来又厚又结实，$1。就是那样，伙计。");
	text = text.replace("The gladiator turns around and nods.", "角斗士转身点头。");
	text = text.replace("Thanks, I use it to carry this company.", "谢谢，我用它来撑起这个战队。");
	text = text.replace("Form check! Form check!", "准备好！准备好！");
	text = text.replace(/(.*?) is in mid-squat as he yells out\. (.*?) rushes over and palms the gladiator\'s buttocks and yells \'go!\'\./, "$1 半蹲着喊道。$2 赶上来拍了拍他的屁股喊道“走！”。");
	text = text.replace("The man dips the squat far past ninety degrees.", "他深蹲远超过九十度角。");
	text = text.replace("It\'s tight!", "很紧！");
	text = text.replace(/(.*?) confirms\./, "$1 确认。");
	text = text.replace("How tight?", "多紧？");
	text = text.replace(/(.*?) takes a hand back, balls into a fist, and punches the man\'s ass\./, "$1 将一只手收回，缩成拳头，然后揍了他屁股一拳。");
	text = text.replace("He then flails his hand back and forth like it touched a hot pan.", "然后他来回挥动他的手，就像碰到了热锅一样。");
	text = text.replace("Tighter than a Vizier\'s purse!", "比维齐尔的钱包还紧！");
	text = text.replace(/(.*?) finishes his squat and stands up and they chest bump\./, "$1 结束了他的深蹲站起来，然后他们胸肌撞胸肌。");
	text = text.replace("Your turn, man! Let\'s gooo!", "到你了，伙计！我们走！");
	text = text.replace("Hey. Look at this.", "嘿，看看这个。");
	text = text.replace(/(.*?)\'s chest bounces, one boob at a time\./, "$1的胸部弹跳着，一次一边的弹着。");
	text = text.replace("You tell him \'nice boobs\' and move on, but he grabs you.", "你跟他说“好胸”准备继续走，但他抓住了你。");
	text = text.replace("They\'re not boobs, they\'re pecs.", "他们不是胸部，是胸肌。");
	text = text.replace("And they\'re beautiful. Hey. Say they\'re beautiful.", "而且他们很美。嘿。说他们很美。");
	text = text.replace("One tit bumps, and then the other, back and forth.", "一个乳头弹起，然后是另一个，前后来回。");
	text = text.replace(/Sighing, you say they\'re beautiful\. (.*?) nods and wipes something from his eye\./, "叹气，你说了他们很美。$1 点头并从眼中抹走了点什么。");
	text = text.replace("Thanks, captain.", "谢谢，队长。");
	text = text.replace(/You find (.*?) bench pressing (.*?), the latter reading from a scroll as he goes up and down\./, "你发现 $1 和 $2 一起做卧推，后者随着他上上下下读着一张卷轴。");
	text = text.replace(/(.*?) is said to have beautiful women\./, "$1 传说有美女。");
	text = text.replace(/He looks back at the man lifting him\. (.*?) glances at you, then back to his workout\./, "他回头看向那个举着他的人。$1 瞥了你一眼然后回到他的锻炼中去。");
	text = text.replace("Ninety-eight. Ninety-nine. One hundred! Alright, flip over.", "九十八。九十九。一百！好，反过来。");
	text = text.replace(/(.*?) rolls over, (.*?)\'s hands puttying into his chest and belly\./, "$1 翻过身，$2的手拍打他的胸脯和腹部。");
	text = text.replace("Alright, one-hundred more reps.", "好，再重复一百遍。");
	text = text.replace(/(.*?) holds up four fingers\. (.*?) holds up six\./, "$1 举起四只手指。$2 举起六只。");
	text = text.replace(/Cocking his head, (.*?) laughs\./, "翘起头，$1 笑了。");
	text = text.replace("In one night?", "一晚上？");
	text = text.replace("The other gladiator nods.", "另一个角斗士点头。");
	text = text.replace("Yessir. In one night.", "是的先生，一晚上。");
	text = text.replace(/(.*?) laughs and asks if they were all women\. (.*?) hesitates\./, "$1 笑着问他们是不是都是女人。$2 迟疑了一下。");
	text = text.replace("Well, there were a couple men there.", "好吧，那时有几个男人在那。");
	text = text.replace("But we didn\'t like, you know, touch or anything.", "但我们没有，你懂得，碰啊什么的。");
	text = text.replace("We got close though, cause at one point he was down there, and I was positioned like this behind-", "我们很亲近就是了，因为有一次他在下面，然后我以这个姿势在他身后－");
	text = text.replace("You walk over clapping, not in applause but to tell the gladiators to stay focused.", "你走过来鼓了个掌，不是在轻喝，而是告诉角斗士保持专注。");
	text = text.replace("You understand the roads can be long and boring, but this is getting ridiculous.", "你理解路上可能又长又无聊，但这有点过了。")
	text = text.replace(/(.*?) flexes his biceps\./, "$1 活动起他的肱二头肌。");
	text = text.replace("I could snap a mule\'s neck with one arm.", "我能用一个手臂扭断一头驴的脖子。");
	text = text.replace(/Shaking his head, (.*?) asks why he\'s flexing both arms then\. (.*?) cocks his head in return\./, "摇着头，$1 问他那么他在同时活动两支手臂。$2 翘起头作为回应。");
	text = text.replace("Well obviously I plan to kill two mules at the same time, man.", "很显然我计划一次同时干掉两只驴，伙计。");
	text = text.replace(/You interrupt, telling the gladiators they won\'t be killing any animals until they complete the (.*?)\'s primary tasks which is only sometimes to kill animals\./, "你打断他们，告诉他们不会在完成 $1的主要工作前杀什么动物，而这些任务只是有时是关于杀动物。");
	text = text.replace(/(.*?) sits beside (.*?) and turns away\. He says\./, "$1 坐在 $2 旁转向一边。他说。");
	text = text.replace("Put your hand on my spine.", "把你的手放我背上。");
	text = text.replace("Right between the shoulders.", "肩膀正中间那里。");
	text = text.replace("The other gladiator obliges without question or curiosity.", "另一个角斗士没有疑问或好奇就这么照做了。");
	text = text.replace(/In turn, (.*?) flexes, trapping the man\'s hand between two masses of muscle\./, "相对的，$1 伸展着，把他的手夹在两块巨大的肌肉中间。");
	text = text.replace("How do you like that power?", "你喜欢这种力量吗？");
	text = text.replace(/Again, without a hint of irony or incredulity, (.*?) obliges a response\./, "再一次，没有任何讽刺或难以置信，$1 给与回应。");
	text = text.replace("It is awesome, man!", "这太棒了，伙计！");
	text = text.replace("I can hear my hand bones cracking!", "我能听到我的手骨在咔嗒作响！");
	text = text.replace("You think to interrupt, but technically nobody is hurt... yet.", "你想管一下，但是技术性的说没有人受伤…目前为止。");
	text = text.replace("You leave the gladiators to their, eh, proclivities.", "你让两个角斗士继续他们的，嗯，兴趣爱好。");
	text = text.replace("So I got her over the fruit cart like this and we\'re just having a grand old time when her father walks in.", "就这么我把她从水果车牵过来然后我们享受着美好时光的时候她父亲走了进来。");
	text = text.replace("He stands all slackjawed and can hardly get a word out.", "他下巴脱臼似的说不出话。");
	//text = text.replace(/(.*?) nods\./, "$1 点头。");
	text = text.replace("So I says to him, watch this.", "所以我跟他说，看着这个。");
	text = text.replace("And I stand back and flex with both arms and slowly, ever so slowly, she lifts up off the ground.", "然后我后退并慢慢的展示我的双臂，慢悠悠的，她从地上被抬起。");
	text = text.replace(/(.*?) slaps the other gladiator in his glistening chest\./, "$1 拍响另一个角斗士泛油光的胸肌。");
	text = text.replace("You lie! That\'s a buncha lies!", "你撒谎！那是一派胡言！");
	text = text.replace("The gladiator holds his hand up.", "角斗士举起它的手。");
	text = text.replace("By the light of the Gilder, and whatever other gods may deem to gawk at my body, it is the truth.", "以镀金者的光之名，还有其他什么呆呆地盯着我身体的神，这是真的。");
	text = text.replace("My pole has power.", "我的擎天柱充满力量。");
	
	text = text.replace(/(.*?) bursts into your tent\./, "$1 冲进你的帐篷。");
	text = text.replace(/Captain! Quick, (.*?) needs help!/, "队长！快，$1 需要帮助！");
	text = text.replace(/You rush out of the tent and find (.*?) sitting before the campfire\./, "你冲出帐篷找到 $1 坐在篝火前。");
	text = text.replace(/He\'s practically shaking\. (.*?) tells you the man had a nightmare\./, "他在颤抖。$1 告诉你他做了个噩梦。");
	text = text.replace("He dreamt that he was a man so scrawny he could hardly lift a basket of apples.", "他梦到他瘦到难以举起一篮子苹果。");
	text = text.replace("Women spat at him.", "女人对他吐痰。");
	text = text.replace("Children ran from him in fear.", "孩子恐惧着远离他。");
	text = text.replace("And he went to the arenas, except he had to sit in the stands!", "而且他去了竞技场，只是他得坐在座位上！");
	text = text.replace(/(.*?) looks up sorrowfully\./, "$1 悲伤的向上看。");
	text = text.replace("They weren\'t even good seats, captain.", "它们甚至不是什么好座位，队长。");
	text = text.replace("They weren\'t even good seats.", "甚至都不是好座位。");

//gunpowder_wagon_event.nut
	text = text.replace("A series of camels come into view.", "一串骆驼进入视野。");
	text = text.replace("They\'ve dozens of satchels and knapsacks bobbing at their sides, and large umbrellas hoisted above.", "它们身上载着几十个袋子和小背包，上面还有大伞。");
	text = text.replace("The camels are guided by a singular jockey riding the lead mount: an old man seated side-saddle with one foot in a stirrup and the other balancing a plate.", "骆驼们被一个孤独的骑手领着：一个侧坐在马鞍上一条腿踩马镫着另一条平衡着一个盘子。");
	text = text.replace("He\'s eating nuts and berries and enjoying a cool beverage.", "他在吃坚果和浆果并享受着清凉的饮料。");
	text = text.replace("He is nonplussed at the sight of you.", "他没有对于你的出现感到惊讶。");
	text = text.replace("Crownlings, yes? I can tell by your swagger, the braggadocio alchemists, transmuting raw gold in the copper of his fellow man\'s blood.", "逐币者，是吧？我可以从你张扬的步伐看出来，自负的炼金术士，从他同伴的血液中的铜中转化粗金。");
	text = text.replace("I do not look down upon you, Crownling, and you shan\'t look upon me as prety to the brigandage that I know pulses whimsically in your heart.", "我不歧视你，逐币者，而你也不该把我当做你抢劫的猎物，我知道你心中异想天开的鼓动着这些想法。");
	text = text.replace("He holds up a stick with a black mark at the top, his thumbnail pressed into it.", "他拿起一根顶端有黑色印记的木棍，他的大拇指按在上面。");
	text = text.replace("I carry saltpeter for the Viziers\' various war machines.", "我为维齐尔的各种战争器械运输硝石。");
	text = text.replace("You see, the great cast iron shots do not travel high and far without my ingredient, this here gentle dust which fills my camels\' every bag.", "你懂得，大铸钢弹丸如果没有我的材料飞不了多高多远，这些温和的粉尘装满了我骆驼的每个包裹。");
	text = text.replace("Were you to think yourself a brave robber I will set alight my wares and make us all together shine so bright the Gilder Himself shall shade His very eyes.", "你要是觉得自己是个勇敢的强盗我会点亮我的货物来让我们闪亮到镀金者他本人都要遮住眼。");
	
	text = text.replace("The merchant grins.", "商人咧嘴一笑。");
	text = text.replace("I\'m glad you have asked for I do at times tire of dealing with the Viziers\' feathery liveries.", "我很高兴你问这个问题，因为我确实有时候对跟维齐尔羽毛插满的制服打交道。");
	text = text.replace("The blackguards and blaggards.", "那些黑卫兵和马屁精。");
	text = text.replace("He snaps his fingers and points at you with fatherly sincerity.", "他打了个响指用父亲般的诚意指向你。");
	text = text.replace("Conversation quickly becomes confabulation.", "对话会很快变成闲谈。");
	text = text.replace("As my father used to say, business is balladry.", "像我父亲过去说的，做生意就像唱民谣。");
	text = text.replace("And we all need a bit of poetry in the dullness of our lives.", "而我们所有人都在这无聊的生活中需要点诗词。");
	text = text.replace("He nods and speaks with a tone you know he uses upon his fellow merchants.", "他点头并用一种你知道的他用来跟他的商人同行的语气说道。");
	text = text.replace("I have an expectation with the Viziers, but being robbed or losing items is also an expectation of this expectation.", "我跟维齐尔定了个时间，但是被抢劫或丢点东西也是可以接受的。");
	text = text.replace("Upon this, I do have things to offer, which if agreed upon, will be \'stolen\' from me at your expense.", "在这之上，我确实有东西可以提供，如果我们都同意，这些东西将会被“偷走”，费用由你承担。");
	text = text.replace("But you can only have one of these availabilities: a Handgonne for but 2,500 crowns, or a Fire Lance for a mere 500 crowns.", "但你只能有着其中的一个：一杆只要2500克朗的手炮，或一根只要500克朗的火矛。");
	text = text.replace("You may have only one of the two on offer.", "你只能从两个中选一个。");
	
	text = text.replace("You and the merchant come to an agree upon the items.", "你和商人就商品达成一致意见。");
	text = text.replace("After you make an exchange of coin and goods, he gets back up on his camel and thumbs his nose at you.", "在你们交换完硬币和货物后，他回到他的骆驼上并向你蹭了蹭鼻子。");
	text = text.replace("I\'m so sorry to have been stolen from, this has truly been an awful day.", "我对于被偷东西很难受，这真是一个糟糕的一天。");
	text = text.replace("Woe, the Viziers will be just as sad as I am.", "麻烦了，维齐尔将会跟我现在一样悲伤。");
	text = text.replace("The merchant sits sidesaddle again and begins to feast on his berries and nuts.", "商人再次侧坐在马鞍上开始吃他的浆果和坚果。");
	text = text.replace("He doesn\'t take up his reins, yet the camels seem to move as though on command.", "他没有拿起他的缰绳，而骆驼们看起来就好像受到指令一般。");
	text = text.replace("May your path be ever Gilded, Crownling, and may my abrogated goods provide you the shine you seek.", "愿你的道路金光闪耀，逐币者，也愿我被偷走的货物提供给你所追寻的光辉。");
	
	text = text.replace("The merchant puts his hands out as though you are robbing him.", "商人将他的手张开好似你在打劫他。");
	text = text.replace("It is no matter that you do not wish to have my goods, truly.", "你不想要我的货物并不重要，真的。");
	text = text.replace("He crosses his legs to sit sidesaddle once more and the camels immediately begin to move as though this was their command.", "他将腿盘起再次侧坐在马鞍上然后骆驼们马上开始了移动好似这就是他们的指令一般。");
	text = text.replace("The merchant talks as he eats his nuts and berries.", "商人一边吃坚果和浆果一边说。");
	text = text.replace("May your path be ever Gilded, Crownling, and may the Viziers of these deserts put you to good use.", "愿你的道路金光闪耀，逐币者，也愿这篇沙漠的维齐尔让你派上好用场。");
	
	text = text.replace("You nod and wish the man good luck in his travels. He bows respectively.", "你点头并祝他旅途顺利。他鞠躬回应道。");
	text = text.replace("May your path be ever Gilded, Crownling.", "愿你的道路金光闪耀，逐币者。");

//manhunters_origin_capture_prisoner_event.nut
	text = text.replace("The surviving man scrambles away from you. He\'s muttering something.", "幸存者艰难的爬离你。他在咕哝这什么。");
	text = text.replace("You can\'t hear it, but the language is clear nonetheless: he knows who you are, and what you are.", "你听不清，但语言还是很明显的：他知道你是谁，你是什么。");
	text = text.replace("The battle over, you find one survivor in the field.", "战斗结束了，你在战场找到一个幸存者。");
	text = text.replace("He\'s a little scraped up but could be of use.", "他有点伤但是还有用。");
	text = text.replace("Slaving shit, do your worst.", "奴隶混账，拿出本事吧。");
	text = text.replace("Despite being the last man standing, the northerner\'s still got some fight in him.", "尽管是最后一个人，这个北方人依然能战斗。");
	text = text.replace(/He may do well in the (.*?)\./, "他将来可能会做得很好，在 $1。");
	text = text.replace("You find the last man standing, hurt but alive.", "你找到最后一个人，受伤了，但还活着。");
	text = text.replace("He\'s a northerner and would look good in chains.", "他是个北方人而且挂着锁链会很好看。");
	text = text.replace("Perhaps fetch a solid price in the south, or serve as fodder on the frontlines?", "或许在南方卖到个好价钱，又或者在前线当炮灰？");
	text = text.replace("The northern troop has been cut down to its last, a pale man who seems to not dwell long in defeat.", "北方士兵被斩到最后一人，一个苍白的人看起来在失败中沉浸多久。");
	text = text.replace("Southern shits, your \'Gilder\' can suck my balls.", "南方杂种，你们这些“镀金者”狗娘养的。");
	text = text.replace("C\'mon, give me a weapon, I\'ll show you how a northerner dies!", "来啊，给我个武器，我会给你展示北方人怎么战死！");
	text = text.replace("You can\'t help but like his gusto.", "不得不说你喜欢他的精力。");
	text = text.replace("Instead of serving worms in the grave, perhaps he could serve the company as one of the indebted?", "比起在坟墓里，或许作为一个负债者加入战队更合适？");
	
	text = text.replace("The surviving man scrambles away from you. He\'s muttering something.", "幸存者艰难的爬离你。他在咕哝这什么。");
	text = text.replace("You can\'t hear it, but the language is clear nonetheless: he knows who you are, and what you are.", "你听不清，但语言还是很明显的：他知道你是谁，你是什么。");
	text = text.replace("The battle over, you find one survivor in the field.", "战斗结束了，你在战场找到一个幸存者。");
	text = text.replace("He\'s a little scraped up but could be of use.", "他有点伤但是还有用。");
	text = text.replace("The lone bandit survivor yells out for the old gods as you weigh a chain in your hand, wondering how it will fit around his neck.", "孤独的土匪幸存者呼喊着旧神，你手中拿着锁链，心想合不合他的脖子。");
	text = text.replace("Is this the penalty for banditry?", "这是当土匪的惩罚吗？");
	text = text.replace("The northerner asks as you weigh a chain in your hand.", "北方人看着你掂量手中的锁链问道。");
	text = text.replace("You\'re still not sure yet of how you\'ll handle him, but answer anyway.", "你还不太确定你会怎么处理他，但还是回答了。");
	text = text.replace("This isn\'t punitive at all, it\'s merely business.", "这不是惩罚，这只是生意。");
	text = text.replace("The bandit tries to hide, but as the last survivor he\'s about as easy to spot as a white rabbit on a bloodslaked battlefield.", "土匪试着躲起来，但是作为最后的幸存者他就像片鲜红的战场上的白兔子。");
	text = text.replace("He yells out that the old gods wouldn\'t abide by men such as yourself. You shrug.", "他呼喊着旧神不会容忍你这样的人。你耸耸肩。");
	text = text.replace("The old gods aren\'t standing where I am, now are they?", "旧神们现在不在这，不是吗？");
	text = text.replace("And you hold out the chain, sizing it with his neck.", "然后你拿出了锁链绕在他的脖子上。");
	text = text.replace("But I wonder, how much would you give up, to swap spots with one of your gods, hm?", "不过我在想，你会愿意为了和你的其中一个神换位置付出多少，哼？");
	
	text = text.replace("The surviving man scrambles away from you. He\'s muttering something.", "幸存者艰难的爬离你。他在咕哝这什么。");
	text = text.replace("You can\'t hear it, but the language is clear nonetheless: he knows who you are, and what you are.", "你听不清，但语言还是很明显的：他知道你是谁，你是什么。");
	text = text.replace("The battle over, you find one survivor in the field.", "战斗结束了，你在战场找到一个幸存者。");
	text = text.replace("He\'s a little scraped up but could be of use.", "他有点伤但是还有用。");
	text = text.replace("You hold the chain out to the nomad, sizing his head from a distance in the swing of its closed gate.", "你向游牧民伸出锁链，在远处用它的闭锁抓住了他的头。");
	text = text.replace("Sometimes in the sands, a man may come across those he should not have trifled with.", "有时候在沙漠里，一个人可能经过了一些他不该打扰的人。");
	text = text.replace("Sometimes he walks away.", "有时候他能走开。");
	text = text.replace("You grasp the chain firmly.", "你紧紧的抓住锁链。");
	text = text.replace("Sometimes he just walks.", "有时候他只是走着。");
	text = text.replace("The sands shift and slide as the wounded nomad tries to escape.", "沙漠滑动着，一个受伤的游民试着逃跑。");
	text = text.replace("You easily put a boot on him and hold him down, your other hand sizing up his neck with the slave chain.", "你轻松的把靴子踩在他身上并按住他，你的另只手用奴隶锁链圈住他的脖子。");
	text = text.replace("The nomad prays for forgiveness.", "游牧民恳求原谅。");
	text = text.replace("By parting our shadows, the shine of the Gilder brighten the both of us!", "通过远离你的阴暗，镀金者的光辉将我们都照亮！");
	text = text.replace("You hold up a chain and tell him not every shadow is born a part of us.", "你举起锁链并告诉他不是所有阴暗都是我们生来的一部分。");
	
	text = text.replace("The surviving man scrambles away from you. He\'s muttering something.", "幸存者艰难的爬离你。他在咕哝这什么。");
	text = text.replace("You can\'t hear it, but the language is clear nonetheless: he knows who you are, and what you are.", "你听不清，但语言还是很明显的：他知道你是谁，你是什么。");
	text = text.replace("The battle over, you find one survivor in the field.", "战斗结束了，你在战场找到一个幸存者。");
	text = text.replace("He\'s a little scraped up but could be of use.", "他有点伤但是还有用。");
	text = text.replace("The Gilder wouldn\'t have it.", "镀金者不会允许这种事的。");
	text = text.replace("He is the last of the southern troop, a wounded pitiful man begging for his life.", "他是南方士兵的最后一人，一个受伤的可怜虫，乞求仁慈。");
	text = text.replace("You hold up the chain.", "你举起了锁链。");
	text = text.replace("Just because this is on you does not mean your path is shadowed, fellow traveler.", "只因为这些东西戴到你身上不意味着你的道路被阴影遮蔽了，旅行者伙计。");
	text = text.replace("Just means mine is a little bit brighter.", "只意味着我的稍微更亮了一点。");
	text = text.replace("Ah, please don\'t!", "啊，求你了不要！");
	text = text.replace("You have your boot on the last of the southern troop, and you are sizing him up to join the indebted.", "你的靴子踩着最后的南方士兵，然后抓起他加入负债者。");
	text = text.replace("He begs for his life, or for freedom, and eventually to simply die free.", "他乞求仁慈或者自由，或者说保持自由的死去。");
	text = text.replace("You shake your head.", "你摇了摇头。");
	text = text.replace("Gold cannot live or die, traveler, it is merely weighed. Heavy. Or light.", "金子可没法活也没法死，旅行者，它只能被衡量重量。重。或是轻。");
	text = text.replace("My considerations do not concern you.", "我的决策与你无关。");
	text = text.replace("You beg about something you lost the moment you crossed paths with me.", "你在乞求你与我相遇时就失去的东西。");
	text = text.replace("The last of the southern troop is at your feet.", "最后的南方士兵在你脚下。");
	text = text.replace("He\'s praying to the Gilder to bring light to his path.", "他在向镀金者祈祷给他的道路带来光明。");
	text = text.replace(/Unfortunately, the only one with say here is yourself, and you\'ve got a spot in chains for the man if you wish him to \'join\' the (.*?)\./, "不幸的是，这里只有你说了算，而你在锁链中有个位置给他，如果你想让他“加入” $1。");
	
	text = text.replace("The surviving man scrambles away from you. He\'s muttering something.", "幸存者艰难的爬离你。他在咕哝这什么。");
	text = text.replace("You can\'t hear it, but the language is clear nonetheless: he knows who you are, and what you are.", "你听不清，但语言还是很明显的：他知道你是谁，你是什么。");
	text = text.replace("The battle over, you find one survivor in the field.", "战斗结束了，你在战场找到一个幸存者。");
	text = text.replace("He\'s a little scraped up but could be of use.", "他有点伤但是还有用。");
	text = text.replace("Ah, the last survivor.", "啊，最后的幸存者。");
	text = text.replace("He\'s a large man, the barbarian, and could perhaps do well for you.", "他挺大个儿的，这个野蛮人，而且可以为你效劳。");
	text = text.replace("In chains, of course.", "当然，戴着锁链。");
	text = text.replace(/The (.*?) rarely comes across stock such as these northern barbarians\./, "$1 很少过手这些北方野蛮人。");
	text = text.replace("With one last survivor left on the field, you ponder if taking him as an indebted would be to your benefit.", "当最后一个幸存者留在战场上时，你思索把他作为负债者会不会对你有利。");
	text = text.replace("The last barbarian standing.", "最后一个野蛮人站立着。");
	text = text.replace("He speaks to you in a language you\'d never have the time to learn.", "他用一种你从没有时间去学习的语言向你说话。");
	text = text.replace("Grunts, growls, things which other languages would take for threats, but here you know he is articulating something of import.", "嘟囔着，低吼着，一些其他语言会当做威胁的东西，但是这里你知道他在试图说什么比较重要的事情。");
	text = text.replace(/But, all you have to respond with is the chain, and this barbarian might just make a very good indebted for the (.*?)\./, "但是，你的回应只有锁链，还有这个野人可能会是个非常棒的负债者在 $1。");

//merchant_of_jugs_event.nut
	text = text.replace("A lone merchant approaches with a wagon pulled by a camel.", "一个孤独的商人牵着骆驼拉的载重货车走了过来。");
	text = text.replace("Large jugs rattle against one another in the bed of his cart, with ropes of dried moss hanging between the lids of each one.", "不小的瓶瓶罐罐在他货车底部磕磕碰碰，每一个的开口上系着根干草绳连在一起。");
	text = text.replace("He rears up on the camel and swings his legs to one side of the animal\'s withers, tapping his own boot with a jockey switch.", "他在骆驼上弓起身并把腿摆向它的一边，他的靴子轻叩马镫。");
	text = text.replace("Hello there, travelers, I pray that your road to the coin has been gilded well.", "你好，旅行者，我祝你通往硬币的道路更加的金光闪耀。");
	text = text.replace("Mine has, though I\'m afraid we have seemingly crossed paths at a time when my peculiar shines rank in rare number.", "我的已经是了，尽管我们的相逢恐怕恰巧在一个我的闪光数量上不多的时刻。");
	text = text.replace("I\'ve but a few goods left, all of the drinking sort.", "我只剩下了一点货物，都是些喝的。");
	text = text.replace("50 crowns per jug. Interested?", "50克朗一罐。有兴趣吗？");
	
	text = text.replace("You exchange for everything he\'s got to which the merchant happily obliges.", "你提出买下他所有的货物，商人愉快的接受了。");
	text = text.replace("When he leaves, his camels are barren and seem to have a skip in their step after carrying a load for so long.", "当他离开的时候，他的骆驼都是光秃秃的，而且在扛了这么长时间的东西之后，它们的脚步好像有点跳跃。");
	text = text.replace("The drink in the jugs is a mixture of water and other additives which we\'ll ensure good, long lasting taste.", "罐子里的饮品是水和些其他的什么添加剂，保证持久可口的味道。");
	text = text.replace("A refreshing beverage to have in an otherwise hellish wasteland.", "对于这地狱般的荒地真是令人清爽的饮料。");
	
	text = text.replace("The merchant nods and you exchange crowns for one of the jugs.", "商人点了点头，你用克朗换了一个罐子。");
	text = text.replace("Despite only having a single jug of the drink, it will provide a refreshing respite from the hellish heat of the desert.", "尽管只有一罐饮料，在这酷热的沙漠里也能提供些许清爽的闲暇。");

//pirates_event.nut
	text = text.replace("You come across a line of men being marched in chains.", "你遇到一排拷着锁链被驱赶的人。");
	text = text.replace("Their leader remarks that they are a part of the \'indebted,\' but one of the men, clearly a northerner, yells out that they\'re merchant mariners who have been captured by pirates.", "他们的领头人声称这些人是“负债者，”但是其中一个人，显然是个北方人，喊道他们是被海盗绑架了的航船商人。");
	text = text.replace("The supposed manhunter at the head of this troop laughs.", "搜捕者头头走在他手下前面笑道。");
	text = text.replace("Don\'t believe his lies, traveler, those who are deeply indebted to the Gilder fear the long journey to redemption.", "不要相信他的谎言，旅行者，这些人只是害怕向镀金者偿还债务的漫长救赎之旅。");
	text = text.replace("He\'d rather die and face hellfire than trouble himself with salvation.", "他宁愿下地狱也不愿意麻烦自己获得救赎。");
	text = text.replace("Is there nothing more human than that?", "他难道没有点人性吗？");
	
	text = text.replace("You draw your sword and demand the \'indebted\' be set free.", "你拔出剑要求他们释放“负债者”。");
	text = text.replace("The manhunter looks around, incredulous.", "搜捕者环顾四周，吃惊。");
	text = text.replace("Kind traveler, I am merely obeying the laws of the Gilder.", "善良的旅行者，我只是服从于镀金者的法律。");
	text = text.replace("These men have debts to pay, and hellfire awaits the ones who shall go unremitted.", "这些人有债务要还，地狱等着那些拒不偿还的人。");
	text = text.replace("Shaking your head, you tell him you won\'t repeat yourself.", "你摇了摇头，你告诉他你不会再说一遍。");
	text = text.replace("He sighs and goes about unshackling the men.", "他叹气并把人们解拷了。");
	text = text.replace("Most immediately take off running, however one stays behind.", "大部分马上就逃跑了，但是有一个留在原地。");
	text = text.replace("But he\'s not there to join you, he stays with the manhunter, holding his wrists out.", "但他不是要加入你，他留在奴隶贩子那，伸出他的手。");
	text = text.replace("Please, let me into the Gilder\'s light.", "求你了，把我领向镀金者的光芒。");
	text = text.replace("Another man also stays behind, but mostly to convene with you.", "还有个人没跑，但看来是想跟着你走。");
	text = text.replace(/He announces himself with clear intentions: he\'ll join and fight for the (.*?)\./, "他以明确的意图宣布自己：他将加入并为之而战的就是 $1。");
	text = text.replace("If I\'ve debts to pay off, it\'s with you, sir.", "如果我有债要还，那只会是向你，先生。");
	
	text = text.replace(/(.*?) the fisherman steps forward\./, "$1 渔夫走上前。");
	text = text.replace("Wait, I know this man!", "等等，我认识这个人！");
	text = text.replace("He\'s not indebted to no one, we used to sail together many winters ago.", "他可没什么债务，许多个冬天前我们一起出海过。");
	text = text.replace("The sailor nods.", "水手点头。");
	text = text.replace("Yes, yes that\'s right!", "是，是的没错！");
	text = text.replace("The manhunter looks over, then walks forward and frees the sailor.", "搜捕者看了看，然后走过去放开了水手。");
	text = text.replace("I am no stranger the circumstances and complexities of the Gilder and can see the machinations of his designs.", "我对镀金者计划展现的情形的复杂性并不陌生并看得到其中的意图。");
	text = text.replace("No doubt he wanted these two to meet.", "无疑他想让这两人见面。");
	text = text.replace("Please, have the man, and his salvation shall be true.", "请接收他，然后他将完成他的救赎。");
	text = text.replace("The manhunter continues on with his train of captured men.", "搜捕者继续带着他的俘虏队伍前进。");
	text = text.replace("One turns to you.", "其中一个转向你说。");
	text = text.replace("Real shame we don\'t farkin\' know each other, yeah?", "真可惜我们不认识，哼？");
	
	text = text.replace("You rattle a chain and bring a few of your indebted forward.", "你摇响了锁链并把几个负债者拉上前。");
	text = text.replace("Flexing your indebted-wrangling cred, you tell the manhunter that you\'ve experience in these matters and you can tell these unruly sailors will find a moment to ambush and kill him.", "显摆着你的负债者牛仔证，你告诉搜捕者你在这些事情上很有经验而且你看得出来这些不听话的水手会找到个机会做掉他。");
	text = text.replace("Hand them over to me and I will pursue their salvation accordingly.", "把他们交给我，我将会亲自给赶向救赎。");
	text = text.replace("Keep them in your stead, and the Gilder Himself will not be able to protect you from the evil which lies in their hearts.", "将他们留在身边，镀金者也难保你不受他们心中的邪恶所害。");
	text = text.replace("The manhunter thinks for a time, then nods in agreement.", "搜捕者想了一会，然后点头同意了。");
	text = text.replace("You\'re right. This was a good haul, but the Gilder shall see my deeds have already been enough and my intents true.", "你说得对。收成不错，但是镀金者已经见证过我的所作所为和目的是正直的。");
	text = text.replace("Take them for yourself and may the Gilder shine sublimity upon your life and theirs.", "带走他们吧，并愿镀金者的光芒照亮你和他们的命运。");
	
	text = text.replace("The manhunter bows briefly.", "搜捕者短鞠一躬。");
	text = text.replace("May your road be ever gilded, traveler.", "愿你的道路金光闪耀，旅行者。");
	text = text.replace("He continues on his way while the supposed sailor yell out that they\'re not even from these lands, that they don\'t know anything about this \'Gilder\' they\'re indebted to in the first place.", "他回到路上，另一边所谓的水手呼喊到他们甚至不来自这里，他们从一开始就不理解“镀金者”和债都是什么。");

//read_black_book_event.nut
	text = text.replace(/(.*?) enters your tent\./, "$1 进入你的帐篷。");
	text = text.replace(/Captain, come quick, there\'s something wrong with (.*?)!/, "队长，快来，有人出了点问题是 $1！");
	text = text.replace(/Captain, come quick, something happened with (.*?)!/, "队长，快来，有人出了点什么事是 $1！");
	text = text.replace(/You hurry to the scene. (.*?) is bowled over the Lorekeeper\'s book like an ancient man shielding the first flame\./, "你赶到现场。$1 抱着博学者的书就好像远古人保护最初的火苗一样。");
	text = text.replace("He\'s clenching the fleshen covers, hands shaking, and he looks up at you with bloodshot eyes.", "他紧攥着血肉封皮，手颤抖着，他抬头用满是血丝的眼看向你。");
	text = text.replace("I know what it says, captain, I know what it says!", "我知道这本书在说什么，队长，我知道它在说什么！");
	text = text.replace("You crouch down and the man backs off, shaking his head.", "你蹲下，引得他后退，摇着头。");
	text = text.replace("No. No! It\'s about the end!", "不。不！是终结！");
	text = text.replace("The end of all things!", "一切的终结！");
	text = text.replace("We\'re... we\'re merely tools to get there, don\'t you understand?", "我们…我们只是达到那里的工具，你难道不能理解吗？");
	text = text.replace("Everything we do, everything anybody does, is a means to the ultimate end: the death of all beings.", "我们做的一切，其他人做的一切，都是通往终极终点的方式：万物的死亡。");
	text = text.replace("Our very existence gives it power, without us, it can rest again.", "我们的存在给予它力量，没有我们，它就能再次安眠。");
	text = text.replace("But so long as there is existence, it cannot sleep!", "但只要还有存在，它就不能睡下！");
	text = text.replace("You shake your head and ask what he means.", "你摇头问他在说什么。");
	text = text.replace("The man turns the book around and there\'s a page that is entirely black, yet he points his finger to a spot on it as though you were meant to read a sentence there.", "他把书反过来展示出一片纯黑书页，但他把手指指向上面的一个点好似你应该在那里读到一句话。");
	text = text.replace("This is no book, captain, it is instruction, on how to raise the spirits of the dead.", "这不是书，队长，这是指示，关于怎么把死灵复苏。");
	text = text.replace(/You ask who could have such knowledge, and (.*?) grins madly/, "你问他谁可能拥有这种知识，$1 露出狂乱的笑容。");
	text = text.replace("There is no \'who\', there is no \'what\'!", "那里没有“谁”，没有“什么”！");
	text = text.replace("It is a tool of undoing, put into this world by the one that calls itself Davkul!", "它是一个消除的工具，被一个自称达库尔的个体投入这个世界！");
	text = text.replace("It is a tool of undoing, put into this world by Davkul!", "它是一个消除的工具，被达库尔放到这个世界上！");
	text = text.replace("You tell the men to shelter him as he has clearly lost his mind.", "你告诉手下照顾好他，因为他看起来明显已经失去理智了。");
	text = text.replace(/One of the sellswords brings you (.*?)\'s translations of the book, but they\'re just scribbles, no less unintelligible than their source\./, "其中一个佣兵拿来 $1的译本，但是他们只是一片潦草写下的胡言乱语，不比原本好理解多少。");
	text = text.replace(/One of the men brings you (.*?)\'s translations of the book, but they\'re just scribbles, no less unintelligible than their source\./, "其中一个人拿来 $1的译本，但是他们只是一片潦草写下的胡言乱语，不比原本好理解多少。");
	text = text.replace("Even if we could understand a word of it, even if we could use it, I don\'t think we should.", "就算我们可以理解其中的词语，就算我们可以应用它，我也不认为我们应该这么做。");
	text = text.replace("See, and just between us, but that page he showed you?", "看，只在你我之间说，那片他展示给你的书页？");
	text = text.replace("EJust between us, but that page he showed you?", "只是我们之间的事，那片他展示给你的书页？");
	text = text.replace("It had text on it earlier.", "它上面之前是有字的。");
	text = text.replace("And I mean in the very moment you were walking up.", "而且我是说在你走过来的时候。");
	text = text.replace("I could see the words, I could see the symbols.", "我能看到字，我能看到符号。");
	text = text.replace("But at some point, the ink, the ash, whatever it was, it spread over the page entirely.", "但是在某一刻，墨水，灰尘，还是什么，它就这么遍布了书页。");
	text = text.replace("It\'s as if we\'re not meant to have this knowledge.", "就好像我们不应该拥有这个知识。");
	text = text.replace(/It\'s quite possible, but there\'s a darker realization spreading over your mind: (.*?) is meant to have this knowledge, but his limited understanding is not for your benefit, but merely a tool in the machinations of something else entirely\./, "这很有可能，但是有一种更黑暗的设想浮现在你的脑海中：信息是要传给 $1 的，但他有限的理解不是用来给你提供帮助的，而只是作为别的什么巨大阴谋中的一个工具。");
	text = text.replace("You are only being shown as much as you need and no more...", "你只被展示了你该知道的，仅此而已…");

//retired_gladiator_event.nut
	text = text.replace("You come across an old man in the street.", "你在街上碰到一位老人。");
	text = text.replace("He wouldn\'t be particularly remarkable, except for the fact that he is owner of a particularly nice set of equipment.", "他并不突出，除开他拥有一副非常不错的装备。");
	text = text.replace("A bit worn and torn, but nice.", "有点破旧了，但还不错。");
	text = text.replace("And, of course, the fact he\'s an elder and hasn\'t had these items stolen from him is evidence of something else going on here.", "当然，他作为一个老人还有这些东西不是他偷来的还能意味着别的什么。");
	text = text.replace("The Crownling stares, the Crownling wonders.", "逐币者盯着，逐币者寻思着。");
	text = text.replace("The man says as he bites in a loaf of bread.", "他一边说一边啃了一口面包。");
	text = text.replace("He looks up at you.", "他抬头看着你。");
	text = text.replace(/My name is (.*?)\. I once fought in the arenas, but retired five years ago\./, "我的名字是 $1。我曾经在竞技场战斗，但是五年前退休了。");
	text = text.replace("Not by choice, mind.", "不是我选的，注意。");
	text = text.replace("I was tasked with throwing a match, but instead I cut the opponent\'s head off.", "我拿到一个故意输掉的任务，但与之相对的我斩首了我的对手。");
	text = text.replace("Said opponent was the son of a Vizier.", "这个对手是维齐尔的一个儿子。");
	text = text.replace("This particular detail was not shared with me at the time.", "这个信息并没有被分享给我。");
	text = text.replace("Those five years I spoke of?", "我刚才说的这五年？");
	text = text.replace("Spent them in a dungeon.", "花在了地牢里。");
	
	text = text.replace(/You tell him that you\'d have use for him in the (.*?)\. He laughs\./, "你告诉他可以来 $1。他笑道。");
	text = text.replace("Fighting days are a bit beyond me.", "战斗的年华对我而言已经是过去了。");
	text = text.replace("I\'m looking to sell this armor at cost and leave this city forever.", "我打算把这幅盔甲卖个好价钱然后永远离开这个城市。");
	text = text.replace("He tilts armor forward.", "他把盔甲转向前。");
	text = text.replace("You won\'t find equipment like this anywhere.", "你没法在任何地方找到这样的装备。");
	text = text.replace("All I ask is 1,000 crowns for it, a gladiator\'s harness the likes of which you\'d be hard pressed to find in any ordinary blacksmith\'s shop.", "我只要1000克朗，一个角斗士的甲胄，你在什么普通铁匠铺可找不到这样的。");
	
	text = text.replace("You hand him the gold and he gives you the armor.", "你把钱交给他，然后他把盔甲交给你。");
	text = text.replace("He weighs the purse of crowns.", "他掂量着装着克朗的钱袋。");
	text = text.replace("I suppose this will be enough to retire away on.", "我想这些足够我度过退休生活了。");
	text = text.replace("The weapons are better left to me.", "武器最好留着。");
	text = text.replace("This is not a particularly safe land, after all, and even an old man as dangerous as myself might need protection.", "这片土地可不是特别安全，一个像我一样危险的老人也可能需要点保护。");
	text = text.replace("He\'s right about that.", "他说的没错。");
	text = text.replace("You wish him well and put the armor into inventory.", "你祝他好运并把盔甲放进了仓库。");
	
	//text = text.replace(/(.*?) laughs\./, "$1 笑了。");
	text = text.replace("Friend, I was once a gladiator.", "朋友，我曾经是个角斗士。");
	text = text.replace("Come with us and treat the whole world as your arena.", "跟我们来吧，把整个世界当做你的角斗场。");
	text = text.replace("I know you have that itch.", "我知道你有那种瘙痒。");
	text = text.replace("I know it\'s somewhere down in there.", "我知道它在那下面。");
	text = text.replace("Find it. That glee of the kill.", "找到它。那战斗的欣喜。");
	text = text.replace("That energy from victory.", "那胜利的力量。");
	text = text.replace("Share it with us, a band of battle brothers.", "跟我们这群战场兄弟分享吧。");
	text = text.replace("The elder gladiator stares at his equipment.", "年老的角斗士看着他的装备。");
	text = text.replace("His reflection stares back, albeit muddled and warbled from dirt and dents. He nods.", "他的倒影也看向他，尽管布满尘土还有坑洼。他点头。");
	text = text.replace("You\'re right. What in the Gilder\'s name am I thinking?", "你说的对。以镀金者之名我刚才都在想什么？");
	text = text.replace("I\'ve been piss poor and pissed on and pissed off for far too long.", "我已经在贫穷中被欺凌了太久了。");
	text = text.replace("If your company will have me, then I shall end my days going out the way I lived it: killing!", "如果你的战队愿意接受我，那么我将会以我过去生活过的方式度过我的日子：杀戮！");
	
	text = text.replace("You welcome the man aboard.", "你欢迎他加入。");
	text = text.replace("He gets to his feet.", "他站起身。");
	text = text.replace("I\'d like to fight with my own gear, but I\'m not partial to it.", "我更倾向于穿着我自己的装备战斗，但我也不是它的一部分。");
	text = text.replace("After all, I was just trying to sell it, right?", "毕竟，我刚刚还试着卖掉它，对吗？");
	text = text.replace("Give me what you think is best and point me in the right direction.", "给我你认为最好的并把我指向合适的方向。");
	text = text.replace("I\'ll show them what the Wolf of Arena Alley has to show!", "我会给他们看看竞技街之狼的本事！");
	
	text = text.replace("The gladiator sits back down.", "角斗士坐了下来。");
	text = text.replace("Well, what the fuck was all that big bravado speech for?", "好吧，他妈的那些虚张声势的演讲是为了什么？");
	text = text.replace(/(.*?) apologizes, throwing you a glare between words whlie the rest of the company laughs\./, "$1 向你道歉，在战队其他人笑的时候，他在言语间瞪了你一眼。");

//runaway_harem_event.nut
	text = text.replace("You come across a sparse group of nomads arguing with a troop of the Vizier\'s men.", "你遇到一片稀疏的游牧民和一些维齐尔人的士兵在争论。");
	text = text.replace("Between them is another group of what look like the sort of women that would be in the Vizier\'s harem.", "在他们中间是另一群看起来好像某种可能在维齐尔的后宫里的女人。");
	text = text.replace("As you draw near all sides pause and stare at you.", "随着你靠近都停下来看着你。");
	text = text.replace("A lieutenant of the Vizier\'s troop waves you off.", "一个维齐尔士兵的军官挥手示意让你离开。");
	text = text.replace("This does not concern you, Crownling.", "这跟你无关，逐币者。");
	text = text.replace("But, perhaps trying to invite you into the event, the nomads explain: the women consist of \'indebted\', those whose service is owed to another for failures or transgressions.", "但是，或许是想把你卷入这个事件，游牧民们解释道：这些女人都是“负债者”，那些要为失误或者冒犯服侍别人的人。");
	text = text.replace("In this case, they owe services to the Vizier.", "这个情形中，他们得去服侍维齐尔。");
	text = text.replace("However, they have escaped and the nomads, who find the concept of indebtedness to be heresy, have taken them in.", "但是，她们逃跑了，并且把负债者这个概念视为异端的游牧民们接纳了她们。");
	text = text.replace("Hey, Crownling! Don\'t listen to a word of that nomad\'s poison!", "嘿，逐币者！不要听进那个游民的毒药！");
	text = text.replace("And nomad, these women come with us, or you ALL die here.", "还有游牧民，这些女人得跟我们走，或者你们全得死在这里。");
	
	text = text.replace("You draw your sword and tell the Vizier\'s men to get lost, hoping it works because any violence with them will not be without a good amount of bloodshed.", "你拔出剑并告诉维齐尔的人滚开，希望这能奏效，因为跟他们打起来恐怕不会很干净利落。");
	text = text.replace("Thankfully, they retreat. The lieutenant bows mockingly.", "幸运的，他们撤退了。军官嘲弄的鞠了个躬。");
	text = text.replace("The womenfolk are free, but with their debts to the Gilder left unpaid, they shall burn in pits of burning sand, a hell from which there will never be escape!", "这些女人自由了，但她们负镀金者的债尚未偿还，她们将会在这灼热的沙坑中受苦，一个她们永远无法逃离的地狱！");
	text = text.replace("Laughing, you thank him for the imagery.", "笑着，你感谢他的想象力。");
	text = text.replace("The nomads also thank you, as do the freed harem though it\'s more with their eyes than anything.", "游牧民们，还有被解救的后宫，尽管主要是通过眼神，表达谢意。");
	text = text.replace("One nomad hands you a gift of treasures.", "其中一个游牧民交给你一份礼物。");
	text = text.replace("We carry these not for us, but for when we occasion upon travelers such as yourself.", "我们拿着这些不是为了我们自己，而是为了经过像你这样的旅行者的时候。");
	text = text.replace("We do not seek comforts in material things, not in this world.", "我们不追寻物质上的舒适，至少不是这个世界中的。");
	text = text.replace("And do not trust that man of the Vizier. He lies.", "而且不要相信那个维齐尔的人。他在撒谎。");
	text = text.replace("The Gilder shall see us all in sublimity when it is our time to come.", "镀金者在检阅我们时会看到我们的高尚的。");
	
	text = text.replace("You know a good payday when you see one, and by payday you mean an ambassador of a Vizier.", "你知道什么时候是个赚钱的好机会，尤其是作为维齐尔的代理人的时候。");
	text = text.replace("Drawing your sword, you jump between the nomads and the women, telling the former to back off and return to the deserts.", "拔出剑，你跳到游牧民和女人们中间，告诉前者后退回到沙漠里去。");
	text = text.replace("The nomads draw bows and raise spears, but their leader quiets them.", "游牧民们掏出弓箭和短矛，但是他们的头领制止了他们。");
	text = text.replace("No, the interloper has intervened in a manner he finds most suitable, and certainly the Gilder has chosen him as an arbiter in this matter for good reason.", "不，入侵者以他觉得最适合的方式介入了，很显然镀金者选择了他来裁决这件事。");
	text = text.replace("Take the women, then, and the dispute is settled.", "带走女人吧，这样争端被解决了。");
	text = text.replace("The Vizier\'s men gather the harem back into their ranks.", "维齐尔的人把女人带回队伍里。");
	text = text.replace("A heavy bag is brought to you by the lieutenant.", "军官丢给你一个厚重的包。");
	text = text.replace("Payment, Crownling. This was not your task, but that does not mean it carries no reward.", "报酬，逐币者。这不是你的工作，但也不意味着没有报酬。");
	text = text.replace("You have saved these indebted women from the Gilder\'s hellfire.", "你从镀金者的狱火中拯救了这些负债者女人。");
	text = text.replace("May our generosity be a constant reminder going forward, yes?", "记住我们的慷慨，嗯哼？");
	
	text = text.replace("You shake your head and wish the women the best in the matter, but it\'s resolved before you can even leave: the nomads back off and the Vizier\'s men take them away.", "你摇了摇头愿女人们好运，但是在你能离开前就事态就解决了：游牧民们后退，维齐尔的人把她们带走了。");
	text = text.replace("When you ask the nomads why they gave up so quick, their leader states that you must have been an arbitrator sent by the Gilder Himself, and if this is what you chose then so be it.", "当你问游牧民为什么他们这么快就放弃了，他们的头领说因为你肯定是镀金者派来的裁决者，如果你选择放弃，那也意味着他们也该照做。");
	text = text.replace("Seems the nomads never had a chance at beating those professional soldiers and you were their last hope.", "看起来游牧民们面对职业士兵毫无机会，而你是他们最后的希望。");

//sellsword_retires_event.nut
	text = text.replace("While on the path, you come across a man sitting beside the path.", "你遇到一个坐在路边的人。");
	text = text.replace("He\'s clad in some beaten armor and there\'s an even more beaten weapon in his lap.", "他穿着些破损的盔甲还有把比之更加破损的武器在他腰边。");
	text = text.replace("He regards you with the limpest of waves.", "他用手用最微弱的力道挥了挥。");
	text = text.replace("Evening. If you ain\'t sellswords, then I never set my pa\'s pants afire.", "晚上好。如果你不是佣兵，那我就从没把我爸爸的裤子点着。");
	text = text.replace("That seems to be an interesting tale in and of itself, but you instead ask the man what he\'s doing in the middle of the road.", "他刚才说的听起来是个非常有趣的故事，但是比起那个你问他在这路中间干什么。");
	text = text.replace("More important, you ask this rather able-bodied fella if he\'s looking for work.", "更重要的，你问他，一个还很健壮的小伙，需不需要工作。");
	text = text.replace("A job? No. I don\'t need one.", "工作？不。我不需要。");
	text = text.replace("I already done that sword-selling bit and I\'m done with it.", "我已经干过佣兵这一行而且我已经干完了。");
	text = text.replace("You know what, here.", "你知道吗，这儿。");
	text = text.replace("He starts undoing his armor and throws it on the ground before you.", "他开始脱下他的盔甲并把他丢到你面前。");
	text = text.replace("Take it. I\'ve no need for that life anymore.", "拿走它。我不再需要那种生活了。");
	text = text.replace("Take the weapon, too.", "把武器也拿走。");
	text = text.replace("I\'m leaving all this shite behind.", "我要把这些都抛在身后。");
	text = text.replace("You should, too, but I knew ya won\'t.", "你也应该，但我知道你不会。");
	text = text.replace("Not before it\'s too late, anyway.", "在一切都太迟之前。");
	text = text.replace("I\'m walking the earth until my feet are ground into nubs.", "我要在这片大地上走到我入土。");
	text = text.replace("As for yourself, godspeed.", "至于你，祝你好运。");
	text = text.replace("And just like that, the stranger goes.", "就像那样，陌生人离开了。");
	
	text = text.replace(/(.*?) the peddler, always having a good nose for gold, asks if the man earned any crowns while working as a sellsword\./, "$1 小贩，总是对金子有着敏锐的嗅觉，问了问他干佣兵挣到克朗了吗。");
	text = text.replace("When the stranger nods, the peddler notes that if that\'s true then he can always \'buy\' his way back into the life.", "当他点头，小贩说如果那时真的他总能“买”下他回去的路。");
	text = text.replace("The sellsword thinks for a minute, then nods again.", "佣兵寻思了会，然后又点了点头。");
	text = text.replace("You know what? That\'s right.", "你知道吗？没错。");
	text = text.replace("So long as I\'ve got the crowns, I\'ve still got a lifeline back to that damned business. Here, take it.", "只要我有克朗，我就还有生命线回到那该死的生意上。给，拿着。");
	text = text.replace("The retiring, and ostensibly soon-to-be-hermit, fishes into his pockets and happily throws you a sack of crowns like a man ridding himself of an old burden.", "要退休，还有看起来马上就要隐居的佣兵伸进他的口袋里并开心的把一袋克朗丢给你，好像在摆脱负担一样。");

//sellsword_vs_bees_event.nut
	text = text.replace("The desert is not home to much of anything beyond the sands.", "沙漠里几乎没有什么沙子以外东西。");
	text = text.replace("So it is rather particular when you come across a lone tree setting out by itself, and even more stranger that hanging from a branch is a fat beehive with a cloud of workers swarming around its bulbous shape.", "所以一颗单独立在那的树很吸引眼球，更奇怪的是树枝上还有个肥厚的蜂巢和一片工蜂围绕着它。");
	text = text.replace("Even at some distance, you can see the golden ember of their honey glistening...", "这个距离上你已经可以看到蜂巢里蜂蜜金色的闪光…");
	
	text = text.replace(/(.*?) confidently walks up toward the tree and the bees seem shunted away by his very presence\./, "$1 自信的走向树，蜜蜂好似被他的存在驱赶开一样。");
	text = text.replace("The noise of their fluttering thickens with angry vibrations, but otherwise they take no further offense.", "它们的振翅声带着愤怒的震动越来越大了，但是除此之外他们没有发起攻击。");
	text = text.replace("He carefully scoops some of the honey into a jar and then eases back and steps away.", "他小心的挖些蜂蜜到罐子里并后撤回来。");
	text = text.replace("He returns to the company.", "他回到战队里。");
	text = text.replace("Easy peasy beehive squeezy, lads.", "轻而易举，小伙子们。");
	
	text = text.replace(/(.*?) laces his fingers and cracks the knuckles with a long stretch\./, "$1 伸展了下他的手指。");
	text = text.replace("Like stealing candy from a baby.", "像从个婴儿手中偷糖果一样。");
	text = text.replace("He walks up to the tree and stands beneath the hive.", "他走向树，站在蜂窝下。");
	text = text.replace("He poses and points up at it, laughs, then turns his hands up and - much to the shock of everyone - just grabs the entire beehive.", "他摆着姿势指向它，笑着，然后举起手－令所有人震惊的－去抓整个蜂窝。");
	text = text.replace("The bees instantly swarm the sellsword and he drops the hive and sprints away, a cloud of angry buzzing chasing him down a sand dune.", "蜜蜂们一瞬间就淹没了他，而他丢下蜂巢就开始跑，一片愤怒的嗡嗡着的云赶着他下了一个沙丘。");
	text = text.replace("He rolls and rolls, his screams issuing out whenever he flies out of the sand, and then he lands at the bottom and a wash of sand covers him and spares him from further bee stings.", "他滚啊滚，他的喊叫声每次飞出沙子的时候都会传出来，最后他落在底端，一层沙遮住他免于更多的叮刺。");
	text = text.replace("You wait a while before retrieving him, lest the bees know your hand in this attempted thievery.", "你等了一会才去救他，不然蜜蜂们会知道你也是这场未遂盗窃的一份子。");
	
	text = text.replace(/You\'re sure (.*?) the Wildman has seen a hive or two in his time estranged to the forests\./, "你确定野人 $1 在他森林生活中见过一个两个蜂窝。");
	text = text.replace("He grunts and points at the beehive and then at himself. You nod.", "他嘟囔着指向蜂窝然后他自己。你点头。");
	text = text.replace("He grunts again and goes up the sand dune to the tree while you watch from a safe distance.", "他再次嘟囔着走上沙丘到树那里，而你在安全距离观察着他。");
	text = text.replace("When he stands beneath the hive, he hoots again, cupping his hand over his mouth to make sure you hear him.", "在他站在蜂窝下的时候，他又一次喊了一声，手围在嘴边好让你听清楚。");
	text = text.replace("He points at the beehive.", "他指着蜂窝。");
	text = text.replace("You nod again and point aggressively at the hive.", "你再次点头并对蜂窝做出进攻性的指指点点。");
	text = text.replace("It\'s the only beehive for miles, what could possibly be so confusing about this?", "这是这几里内唯一一个蜂窝，有什么难理解的？");
	text = text.replace("The Wildman turns toward the beehive.", "野人转向蜂窝。");
	text = text.replace("He cocks an arm back.", "他把一个手臂弯向身后。");
	text = text.replace("That... that is not what you wanted to see.", "那…那不是你想看到的。");
	text = text.replace("He sizes up the beehive, tongue out, eyes slimmed.", "他打量着蜂窝，吐出舌头眯着眼。");
	text = text.replace("You rush forward, yelling at him, but he\'s already honed in.", "你赶快向前跑，对着他喊，但他已经上了。");
	text = text.replace("He launches a fist and absolutely obliterates the bees.", "他击出一拳，绝对性的毁灭了蜜蜂。");
	text = text.replace("Honeycombs stickily flail around his wrist as though his hairy arm were an impromptu maypole.", "蜂窝块黏糊糊的围绕他的手腕好像他毛茸茸的手臂是什么还没准备好节日装饰的柱子。");
	text = text.replace("The Wildman casually walks back down the sand dune.", "野人轻松的向回走下沙丘。");
	text = text.replace("As he nears, you see bees crawling all over his face and stinging away like the pissed off savages that they are, but he doesn\'t seem to even sense their presence.", "随着他靠近，你看到蜜蜂爬满了他的脸并且像他们应该的那样愤怒的叮着他，但是他好像根本没察觉到他们的存在似的。");
	text = text.replace("He holds out the crunchy remains of his honeyed demolition as though he held the heart of a ferocious beast.", "他举起他的蜂蜜爆破留下的松脆的残留物就好像一头猛兽的心脏似的。");

//sword_eater_event.nut
	text = text.replace(/A sword eater is dancing around a plaza of (.*?)\. He holds out a blade about as thick as your pinky\./, "一个食剑者在 $1 的广场边跳着舞。他拿起一把差不多有你小拇指厚的利刃。");
	text = text.replace("As the Gilder sees me, I will eat this steel!", "在镀金者的注视下，我将会吃下这些钢铁！");
	text = text.replace("The man announces his intent, and follows through promptly: he arches his back, pinches the blade, and glides it into his mouth and onward and inward, his mouth puckering around the steel as though he were slurping noodles.", "那人声明了他的目的，并接着迅速行动了起来：他弓起腰，拧着刀，并把它滑入了他的嘴，越来越深，他的围绕着铁褶皱着就好像他在吸面条。");
	text = text.replace("The crowd at first gasps, but then the swallower gives two thumbs up and the onlookers cheer.", "群众一开始深吸一口气，但是吞咽者举起两个大拇指，旁观者欢呼了起来。");
	
	text = text.replace("You toss the man a few crowns.", "你丢给他几克朗。");
	text = text.replace("He pulls out his sword and places its tip upon his pate.", "他拔出剑并把它放到他的头顶上。");
	text = text.replace("The crowd cheers again.", "群众再次欢呼。");
	text = text.replace("Grinning, the man talks as he balances the sword.", "笑着，他一边平衡着剑一边说道。");
	text = text.replace("I see your banner, Crownling.", "我看到了你的旗帜，逐币者。");
	text = text.replace("I\'m no warrior, but I am a traveler and well enough speaker.", "我不是一个战士，但我是个旅行者和一个不错的演讲者。");
	text = text.replace("Though I seek to impress for personal gain, I will on occasion make sure to put in a kind word for your company of coin-seeking misfits.", "尽管我是为了个人利益表演，我会时不时为你们这些追逐硬币的恶棍说几句好话的。");
	text = text.replace("The swallower throws his arms wide and nods quickly.", "吞剑者张开他的双臂并快速的点头。");
	text = text.replace("The blade plummets from his skull and falls deftly into his sheathe at his hip.", "刀从他头顶快速落下并安静的落入他腰间的刀鞘。");
	text = text.replace("Again, the crowd roars with delight and you can\'t help but think this entertainer is a man of his word.", "再一次，群众欣赏的欢呼起来而你不得不忍痛这个艺人会信守承诺。");
	
	text = text.replace(/You hand (.*?) a few crowns and tell him to tip the entertainer\./, "你给了 $1 几个硬币告诉他教给艺人。");
	text = text.replace(/He grunts and heads over, then you realize that wasn\'t just any sellsword you beckoned, but (.*?) the wildman!/, "他嘟囔着走过去了，然后你意识到了那个佣兵不是别人，而是野人 $1！");
	text = text.replace("Before you can stop him, he pushes the sword swallower over.", "在你能阻止他之前，他把吞剑者推倒。");
	text = text.replace("There are cries, screams, and blood gargling death throes, but the crowd sweeps in front of the action and blocks the view.", "哭喊，尖叫还有血吐出来的声音，但是群众聚集到现场前遮挡了视线。");
	text = text.replace("The way it is relayed to you is that the blade came out the swallower\'s front with straps of esophagus or stomach hanging off it.", "结果是锋刃从吞剑者的胸口穿了出来，上面挂着食管或胃的带子。");
	text = text.replace("You know this, because the wildman made sure to bring back the sword himself and you had to have it cleaned.", "你知道这些，因为野人自己把剑拿了回来而你必须得让人把它洗干净。");
	text = text.replace("How exactly he retrieved the blade during those moments of carnage is beyond you, though you imagine he escaped the ferocity of the crowd by sheer will, determination, and complete absence of moral judgments which frightens men of normal sensibilities.", "至于他怎么把利刃在一片腥风血雨中取回来超出你的想象，但是你想他靠着意志，信念，还有对道德的完全无知使他躲过了人群的攻击，最后一个让每一个有基本认知的人恐惧不已。");
	text = text.replace("You ask a few of the sellswords to hide the wildman away as he\'ll need to lay low for a while.", "你要几个佣兵把野人藏起来，因为他恐怕得避避风头了。");

//trade_black_book_event.nut
	text = text.replace("A man has approached the camp.", "一个人靠近了营地。");
	text = text.replace("You leave your tent to find him standing with his hands atop a golden spear, the shaft of which branches out with sharpened points.", "你离开你的帐篷发现他拿着一杆金色的长矛站在外面，枪杆像树枝一样突出些尖锐的棱角。");
	text = text.replace("As threatening as the weapon looks, a pair of water jugs and golden curios have weighted it with other purposes.", "尽管武器看起来很具威慑性，但一对水罐和一个金色物件挂在上面使它有了其他用途。");
	text = text.replace("The man himself throws back a cloak to reveal a very peculiar and pale face that has not a single hair upon the flesh.", "那人自己把斗篷掀开露出一张非常奇特和苍白的脸，上面没有一根毛发。");
	text = text.replace("He introduces himself with flawless articulation.", "他用完美的谈吐介绍他自己。");
	text = text.replace("Hello stranger, my name is Yuchi Eveohtse.", "你好陌生人，我的名字是尉迟绿洲。");
	text = text.replace("I\'m looking for two things in these lands, one of which I\'ve come to understand is in your possession.", "我在这片土地上寻找着两件东西，其中一个我了解到在你的手中。");
	text = text.replace("It is a profound text on the nature, no, the existence of death.", "这是一篇关于自然，不，死亡存在的深刻文本。");
	text = text.replace("I believe one of your men has already unlocked a partial set of its mysteries and, at this point, it is of little further use to you.", "我相信你的一个手下已经解开了它秘密的一部分，在这一点上，它它对你没有多大用处了。");
	text = text.replace(/(.*?) nods, stating that as long as he stares at the pages, he can make nothing more of it and doubts anyone can\./, "$1 点头，声称只要他看向书页，他便不能解读出更多的内容并且怀疑某些人能做点什么。");
	text = text.replace("Yuchi whistles and you look back at him.", "尉迟吹了个口哨然后你回头看他。");
	text = text.replace("The man holds out three fingers.", "那人伸出三根手指。");
	text = text.replace("In exchange for the book, I\'ve one of these to offer: either a golden shield the faithful of these lands call the Gilder\'s Embrace, my two jugs which, when imbibed, will strengthen a man in ways beyond your imagining, or, being that you are mercenaries, a sum of 50,000 crowns.", "为了书，我愿意用这些东西中的一样来交换：一个这片土地的忠实信徒称作镀金者的拥抱的金盾，我的两个罐子，喝下后，会让一个人强化到超越你想象的程度，或，看你们是佣兵，50000克朗。");
	
	text = text.replace("Yuchi bows for the briefest moment and when he stands he is holding a shield.", "尉迟短暂的鞠了个躬，当他起身的时候他拿着一面盾牌。");
	text = text.replace("At first glance, it appears to be nothing more than steel with ornate gildings around the edges, but suddenly an orb of yellow light cycles around the outer rim, dancing around and around.", "第一眼，它看起来就是个边缘镀金的普通铁盾，但是突然一个黄色光球开始环绕外缘，一圈一圈的跳动着。");
	text = text.replace("They call it the Gilder\'s Embrace for the God\'s very divinity is said to be partitioned within its framing.", "他们称呼它为镀金者的拥抱，因为传说上帝的神性参与到了它的制造过程中。");
	text = text.replace("See, if you were to turn this against your enemies, the light would grow to such blinding rays that your foes shall not see.", "看，如果你把这个转向你的敌人，光会变得如此耀眼以至于让你的敌人失去视野。");
	text = text.replace("And as you can tell, the light now is dull, for we are not enemies, stranger.", "你看得出来，现在光还很昏暗，因为我们不是敌人，陌生人。");
	text = text.replace("The man holds out his hand.", "那人伸出他的手。");
	text = text.replace("You give him the book, and he gives you the shield.", "你给了他书，而他给了你盾。");
	text = text.replace("He does not even stare at the book, simply stows it away and gathers up his spear.", "他甚至没有看向书，只是单纯的放置起它并举起他的长矛。");
	text = text.replace("You ask him what he intends to do with the text. He smiles.", "你问他要拿这些文献做什么。他笑道。");
	text = text.replace("Who knows. Maybe I will simply return it, hm? Or maybe not.", "谁知道呢。或许我只是要把它还回去，哼？又或许不会。");
	
	text = text.replace("Yuchi tips his gilded spear forward.", "尉迟把他镀金的长矛向前倾。");
	text = text.replace("It sharpness is incredible, like something a blacksmith may dream of but never manifest by any mortal hand.", "它的锋利度令人震惊，像个铁匠梦里打出来但从没被任何凡人的手铸成过。");
	text = text.replace("The pair of jugs slide off and he catches them by their straps and holds them out.", "那对罐子滑下来然后他抓住了它们的带子并递了过来。");
	text = text.replace("You give him the book and he lets go of the jugs.", "你给了他书而他也放开了罐子。");
	text = text.replace("Not wanting to be poisoned, you ask that he take a drink of both jugs which he does so willingly.", "不想被下毒，你要求他喝一口两个罐子里的液体，而他情愿的照做了。");
	text = text.replace("Wiping his mouth, he nods.", "抹了抹嘴，他点头道。");
	text = text.replace("I\'m quite partial to its flavors and its effects, please do not waste anymore of it on your suspicions and hesitancies.", "我很偏好它的风味和效果，请不要为你的怀疑和迟疑浪费更多这个东西。");
	text = text.replace("The man stows the book somewhere into his cloak, picks up his gear, and begins to walk away.", "那人把书放到了他斗篷里的什么地方，拿起他的装备，并开始走远。");
	text = text.replace("You ask what he plans to do with the text. He smiles.", "你问他准备拿这些文献做什么。他笑道。");
	text = text.replace("Who knows. Maybe I will simply return it, hm? Or maybe not.", "谁知道呢。或许我只是要把它还回去，哼？又或许不会。");
	
	text = text.replace("Yuchi nods.", "尉迟点头。");
	text = text.replace("Give me the book and bring me your warchest.", "把书和你的战箱拿过来。");
	text = text.replace("You throw him the text and then have the company\'s treasury brought before the man.", "你把书丢给他然后把战队的宝库拿到这个人面前。");
	text = text.replace("He holds out both arms of his cloaks and slowly tips them forward.", "他从斗篷中伸出双臂并缓慢的倾向前。");
	text = text.replace("Crowns stream out of the sleeves seemingly without end and then on an instant the man tips both arms up.", "克朗像溪流一样从袖子中流出，无穷无尽，然后再一个瞬间男人把他的双臂举了起来。");
	text = text.replace(/Your (.*?) crowns should be there\./, "你的 $1 克朗应该到齐了。");
	text = text.replace("You have the coin counted and it is the exact amount.", "你让手下数了数硬币，而它刚刚好那么多。");
	text = text.replace("You look up to say he\'s quite lucky, but the man is already picking up his things and preparing to leave.", "你抬头说他很幸运，但他已经在收拾东西准备离开。");
	text = text.replace("Take care, stranger.", "保重，陌生人。");
	text = text.replace("Before he goes, you ask what he plans to do with the text. He smiles.", "他走前，你问他准备拿这些文献做什么。他笑道。");
	text = text.replace("Who knows. Maybe I will simply return it, hm? Or maybe not.", "谁知道呢。或许我只是要把它还回去，哼？又或许不会。");
	
	text = text.replace("Yuchi turns around.", "尉迟转过身。");
	text = text.replace("Hm?", "哼？");
	text = text.replace("You explain that he said he had come to these lands looking for two things.", "你解释道他说过他来这里找寻两样物品。");
	text = text.replace("One was the book, what was the other? He smiles.", "其中一个是那本书，另一个呢？他笑道。");
	text = text.replace("There is a town in these parts by the name of Dagentear.", "这一片有一个城镇叫达根泰尔。");
	text = text.replace("The town is no more, but something that lived there still wanders.", "镇子没了但是有些住在那的东西依然在游荡。");
	text = text.replace("A being they call the \'Wight.\'", "一个他们称呼为“鬼”的东西。");
	text = text.replace("I wish to find it and speak with it.", "我想找到它并和它说话。");
	text = text.replace("When you ask for more information he simply parts with a graceful bow.", "当你想从他那儿询问更多信息时他单纯的用一个充满敬意的鞠躬告别。");
	text = text.replace("Thank you for your gentle dealings, stranger.", "谢谢你的温柔交易，陌生人。");

//traveler_south_event.nut
	text = text.replace("You come across a man wandering the desert with a family of younger men by his side.", "你遇到一个带着家里年轻男孩的男人在沙漠里游荡。");
	text = text.replace("He welcomes you to a campfire and asks if you\'d like to hear tales of the desert and of the south in general.", "他欢迎你坐在篝火边并问你是否想听听沙漠和南方的故事。");
	
	text = text.replace("The man goes on to talk about the Ancient Empire - at least what he is aware of it.", "男人接着开始说起了古代帝国－至少他所了解的部分。");
	text = text.replace("It\'s hard to say exactly what it was, you know?", "很难说那究竟是什么，你知道吗？");
	text = text.replace("And it is hard to say what exactly came before.", "很难说之前到底发生了什么。");
	text = text.replace(/I had gotten a glimpse into the libraries of (.*?) and was rather astonished and what I was able to find\./, "我瞟到 $1 的图书馆里过，被我所了解的事情给吓到了。");
	text = text.replace("You know what the oldest texts we have are? Ancient texts.", "你知道我们最古老的文献是什么吗？古代文献。");
	text = text.replace("Do you know what these ancient texts write about? Other ancient texts.", "你知道这些古代文献都写了些什么吗？更多的古代文献。");
	text = text.replace("We have no idea how far back our timeline really goes.", "我们不清楚我们的时间线到底可以追溯到多久远以前。");
	text = text.replace("We just exist in the here and now, and perhaps one day in the future our progeny will come to find that we are the mystery, and those that were mysteries to us?", "我们在现在，或许未来的某天我们的后代会觉得我们就像神话一样，至于我们都不理解的秘密呢？");
	text = text.replace("He scissors his fingers through the air.", "他在空中交叉他的手指。");
	text = text.replace("He prods the campfire with an iron poker.", "他用一个拨火棍挑动着营火。");
	text = text.replace("They say that the Ifrits are manifestations of man\'s cruelty.", "他们说伊夫利特产自人们的残酷。");
	text = text.replace("That when we are evil to one another there is a force, some unseen force, which we are pressing against.", "当我们对他人作恶时有一股力量，一股看不见的力量，被我们压迫着。");
	text = text.replace("When we attack and slaughter on a larger scale, this force is bent across the entire seam, but when we do ill against one individual, to such horrible ends, it is when this force snaps.", "当我们大规模的杀戮时，这股力量被曲过整个缝隙，但当我们对一个个体作恶时，一些非常可怕的恶，这时候这股力量就会折断。");
	text = text.replace("And a hole is made, and out of that hole comes a correction.", "产生一个洞，通过那个洞产生了修正的力量。");
	text = text.replace("A correction which we call the Ifrit.", "这个修正的力量被我们称作伊夫利特。");
	text = text.replace("A correction that will seek to make amends, by literally mending these invisible forces with the corpses of those who dared to open them in the first place.", "因这股修正的力量我们会试图做出补偿，通过把那些制造出洞的人的尸体字面意义上的和这些透明力量合为一体。");
	text = text.replace("The man sets the iron poker aside. He smiles somberly.", "他把拨火棍放在一边。他苦笑着。");
	text = text.replace("So it is said, anyway.", "他们是这么说的。");
	text = text.replace("Despite being an old man, he crosses his legs with the limberness and agility of a younger fellow.", "尽管是个老人，但他还是像年轻人那样四肢灵活地交叉着双腿。");
	text = text.replace("He\'s no doubt sat before many a campfire.", "他无疑坐在许多个篝火边过。");
	text = text.replace("He speaks as warmly as the flames before you.", "他像面前的营火般温暖的跟你说道。");
	text = text.replace("I\'ve been around these sands for many summers.", "我在这片沙漠经历过了许多个夏天。");
	text = text.replace("But my sons, who I have outlasted, I must sadly say, they would ask, how do we go on about telling the time from one season to the next?", "但是我的儿子们，不幸的走在我前面的儿子们，他们会问，我们怎么在不同的季节分辨时间？");
	text = text.replace("To which marker do we signify the years?", "用什么来标记经历的每一年？");
	text = text.replace("A wrinkly finger is raised, and it points further above.", "一个褶皱的手指举起，并指向上面。");
	text = text.replace("He winks at you.", "他向你眨了眨眼。");
	text = text.replace("The stars. They wheel across the sky in patterns one can recognize if one is willing to pay attention.", "星象。它们划过天际的规律只要人们愿意关注就可以察觉。");
	text = text.replace("I also imagine that those stars may be beings of another aether, another unimaginable place.", "我还想象这些星星或许是其他的境界，另一个无法想象的地方。");
	text = text.replace("Perhaps somewhere we will go when we die, but this is hearsay, of course, and just between us musing travelers, yes?", "或许我们死时会去的地方，但这是异端言论，当然，只在我们之间讨论，好吗？");
	text = text.replace("The man sips at a drink from a cup of unknown make and material.", "男人从一杯不明内容的饮料中嘬了一口。");
	text = text.replace("He smells the drink and sips it again before setting it down and stretching out.", "他闻着饮料并再次品了一口之后把它放下并伸展身体。");
	text = text.replace("You know, I somewhat look forward to the end of my Gilded path.", "你知道的，我有时候期盼着我镀金道路的终点。");
	text = text.replace("It has been good to me, all these years, but I can tell that I stride between the withers of this horrible world and the sooner I can make my leave the better.", "它对我很好，这么些年，但我看得出来我在这可怕世界的灾难之间行走，我越早离开越好。");
	text = text.replace("I have the notion that if I stick around too long then the world is going to find out I slipped by, receipt in hand, and have been getting away with a good life while I supposedly got suffering on the docket.", "我觉得如果我呆在这太久到时候这个世界会发现我溜了开来，拿着收据，并在我的单据上写着苦难时过着好日子。");
	text = text.replace("You ask him why he thinks this. He shrugs.", "你问他为什么这么想。他耸耸肩。");
	text = text.replace("Instinct. You got it too, Crownling, this I have no doubt.", "直觉。你也有的，逐币者，我毫不怀疑。");
	text = text.replace("After all, how do you make it so far when others, just like you, trundle into terrors and horrors and, eventually, death?", "毕竟，你和其他人怎么撑过这么长时间的，就这么踏过各种恐惧和死亡？");
	text = text.replace("There\'s a ticker somewhere in this world, a great accountant, perhaps it is the Gilder, perhaps it is something else, but life is not meant for unending good.", "这个世界上的某个地方有个记录者，一个伟大的记录员，或许是镀金者，或许是什么别的，但生活并不意味着无尽的好事。");
	text = text.replace("At some point, eventually, there\'s gonna be one big, bad moment.", "在某个时间点，总有一天，会有一个大的，不好的一刻。");
	text = text.replace("Once you settle down, the old man leans back as though you were an old friend and begins to talk.", "你一坐下，老人就向后仰靠着好像你们是老朋友一样开始说。");
	text = text.replace("It\'s interesting to me to see you here, Crownling, dressed in the regalia of brigandage as it were.", "看到你在这很有趣，逐币者，尽管穿着盗匪的服饰。");
	text = text.replace("Here are, simple men in simple times.", "这里，单纯人在一个单纯的时代。");
	text = text.replace("But I take it you\'re as aware of a much greater past as I am.", "但我想你也同样注意到一个更伟大的过去。");
	text = text.replace("The sense that there was a long, long time of events that came before us.", "有一种感觉，那就是在我们之前有一个很长很长的历史。");
	text = text.replace("You nod. It seems obvious.", "你点头。很显然。");
	text = text.replace("The man nods back.", "那人点头回应。");
	text = text.replace("That is good. It shows an inquisitive nature to your side, even just in recognizing that there was much that walked these sands before us both.", "这很好。这展示了你的探索天性，即使只是了解到许多人和物在我们之前走过这些沙地。");
	text = text.replace("Many... many do not even take this into consideration.", "许多…许多人甚至没有考虑到这一点。");
	text = text.replace("They live in the here and now.", "他们住在这而现在。");
	text = text.replace("In some ways, I envy them.", "在某种程度上，我嫉妒他们。");
	text = text.replace("How it must be to exist as oneself and only oneself with the whole world beneath your feet.", "以自己的身份存在，而且只以自己的身份存在，整个世界就在你脚下，这一定是什么感觉。");
	text = text.replace("He lays back and stares up at the sky.", "他后躺并盯着天空。");
	text = text.replace("I think most people don\'t really believe they\'ll die.", "我想大多数人都不相信他们会死。");
	text = text.replace("You set down and the old man leans back with a book in hand that is part scrolls and part binding.", "你坐下来，老人向后靠着，手里拿着一份卷轴和一份书简。");
	text = text.replace("He reads, occasionally looking up.", "他读起来，时不时抬头。");
	text = text.replace("You have no idea if he\'s speaking from the text or if his nature is capable of holding two different studies at once.", "你不知道他是在读上面的文字还是他能够自然的同时读两本书。");
	text = text.replace("Did you know how it is the Ancient Empire was felled?", "你知道古代帝国是怎么陷落的吗？");
	text = text.replace("They say it was a great blast from the earth itself.", "他们说是因为大地的一次大爆炸。");
	text = text.replace("He mimics with his hands an explosion from the sands.", "他用他的手模仿沙地中爆炸的样子。");
	text = text.replace("A volcano. But that seems far too simple, doesn\'t it?", "一次火山喷发。不过那看起来太过简单了，不是吗？");
	text = text.replace("One volcano wipes out the entire empire?", "一个火山灭掉了整个帝国？");
	text = text.replace("You remark that the best sellsword you have could be crippled with a small nick to the back of his heels.", "你回应到你最好的佣兵也可能被后脚踝的一个小割伤致残。");
	text = text.replace("No longer able to walk well, turn, pivot, or put weight on his feet, he\'d fall apart from the bottom up.", "不再能好好走路，转向，甚至只是支撑，他会从下而上的崩溃。");
	text = text.replace("The old man stares at you.", "那个老人盯着你看。");
	text = text.replace("Hmm, that may be right then.", "嗯，很有道理。");
	text = text.replace("Perhaps this volcano obliterated what little grasp this empire had on its own control.", "或许这个火山摧毁了这个帝国对自己的最后一点控制。");
	text = text.replace("After that... who knows what happened.", "在那之后...谁知道发生了什么呢。");
	text = text.replace("Chaos, presumably. That sweet little thing.", "混沌，也许吧。那可恶的东西。");
	text = text.replace("You set down and the man begins to speak almost immediately.", "你坐下了然后那个人几乎马上就开始说话了。");
	text = text.replace("I\'ve heard rumors of a cult running about. Something about \'Davkul\'.", "我听说一个异端教派在活动。有关什么“达库尔”。");
	text = text.replace("Well, I will say this: they\'re an earnest sort by the sounds of it.", "好吧，我要说的是：从声音上看，他们是认真的那种。");
	text = text.replace("You ask if he has any knowledge beyond just rumors. He shrugs.", "你问他是否知道谣言以外的东西。他耸耸肩。");
	text = text.replace("Only that is a cult of death and it did not originate here.", "只知道那是一种死亡崇拜，它不是起源于这里。");
	text = text.replace("At least, you\'ll never hear a southerner admit to this Davkul creation starting here.", "至少你不会听到南方人承认这个达库尔玩意是从这儿开始的。");
	text = text.replace("No, no, must have been those scoundrels to the north to come up with such a gruesome idea as this death god.", "不，不，一定是那些北方无赖想出了一个像这个死亡之神这样可怕的想法。");
	text = text.replace("He grins whimsically. You take it he has no real skin in the game with this topic and only threw it out there to see your response.", "他古怪的笑道。你想他没有什么实际的料，并且只是把它提出来看看你的回应。");
	text = text.replace("Yes yes, have a seat already.", "是的是的，坐下吧。");
	text = text.replace("You sit down and the man begins speaking immediately.", "你坐下来，然后那人就说起来了。");
	text = text.replace("One of the strange natures of the desert is that will both preserve and erase all things.", "沙漠的其中一个怪异现象是它会同时保存和抹去所有东西。");
	text = text.replace("Do you understand what I mean?", "你能理解我在说什么吗？");
	text = text.replace("If you were to die, the sands would swallow you whole, but you, your body, would never really disappear.", "如果你死了，沙子会把你整个淹没，但是你，你的尸体，永远不会真的消失。");
	text = text.replace("It would be submerged.", "它会被淹没。");
	text = text.replace("If we were to start clawing our way into the desert around us we would surely find bodies and treasures and some say even entire cities.", "如果我们开始向沙漠底下挖我们肯定会找到尸体，宝藏，有的人甚至说整座城市。");
	text = text.replace("You wave off the notion, but the man raises a finger.", "你对此难以置信，但是他竖起了根手指。");
	text = text.replace("Tsk tsk tsk, don\'t be so dismissive, Crownling.", "呲呲呲，不要这么不假思索的否定，逐币者。");
	text = text.replace("This is a hungry world and, may my path be Gilded, it is entirely possible that all these cities we know today will soon be gone.", "这是个饥饿的世界而且，愿我的道路金光闪耀，我们现在现在知道的这些城市完全可能很快就会消失。");

//crisis
//holywar_crucified_1_event.nut
	text = text.replace("In the middle of the desert wastes one has to be somewhat suspicious of anything they come across, especially if it\'s a lone man on a cross.", "在荒芜的沙漠中，人必须要对任何他们经过的东西保持怀疑，特别是十字架上钉了一个人的时候。");
	text = text.replace("The crucified figure looks entirely dead, given the buzzards clerically perched on each shoulder, but as you draw near the birds take flight and the man lifts is head.", "被钉在上面的人看起来死透了，秃鹫像牧师似的啄过了两肩，但随着你靠近把鸟赶走时这个人抬起了头。");
	text = text.replace("Despite gruesome injuries to hands and feet, he\'s rather lively and asks for water.", "尽管手脚严重受伤，他还算是活着并且请求给点水。");
	text = text.replace("Instead of giving it to him, you ask why he\'s here. The man sighs.", "比起给他水，你选择先问问为什么他在这里。他叹了叹气。");
	text = text.replace("I was a crusader. Came in with the army looking to gain glory for the old gods.", "我曾经是个十字军战士。为了旧神的荣誉随军来到这里。");
	text = text.replace("Except when I got down here, and got to talking with the locals and the priests, I had a change of heart.", "只是当我到了这里，与当地人和牧师们交谈过了之后，我的想法改变了。");
	
	//text = text.replace("The man nods.", "这个人点头。");
	text = text.replace("Aye, that they did.", "是的，就是他们。");
	text = text.replace("Mind, I was there when they crucified someone else on account of the same reason.", "不过回想起来，当他们因为同样的原因把别人钉在十字架上时我也在场。");
	text = text.replace("So in part I\'m not the brightest fella to follow in his footsteps, nor am I clean of heart, for I cheered it on when they did it to him.", "所以部分的讲，我选择跟着他的脚印不是什么明智之举，我也不是心地善良，因为我也是当时欢呼的人群中的一员。");
	text = text.replace("But perhaps the Gilder will see the true light I carry within, you know?", "不过或许镀金者会看到我心中真正的光，你知道吗？");
	text = text.replace("He turns his head to the skies, and to the buzzards cycling above.", "他把他的头扭向天空，盯着上方盘旋的秃鹫。");
	text = text.replace("I\'m still one open to fight, no matter who it is, south, north, doesn\'t matter.", "我还可以战斗，不管是和谁，南方人，北方人，不重要了。");
	text = text.replace("I\'ve the Gilder in my heart.", "镀金者在我心中。");
	
	text = text.replace("You draw out your dagger and cut the man down.", "你掏出你的匕首把他放了下来。");
	text = text.replace("He\'s got injuries aplenty but is no doubt of strong enough constitution to one day recover.", "他显然受了很多伤，但以他的体格他能恢复过来。");
	text = text.replace("He thanks you with remarkable mildness given the doom which awaited him.", "用一种对于差点丧命的人而言出奇温和的态度，他向你表示感谢。");
	text = text.replace("Glad to stretch. I mean, you know, stretch on my terms.", "终于能伸展一下了。我是说，你懂的，对我而言的伸展。");
	text = text.replace("Lead the way, captain of the Gilder\'s circumstance, captain of His mighty sublimity.", "带路吧，镀金者命运的领路人，他强大威严的指引者。");
	text = text.replace("Many in the company do not care for taking in a man who has turned his back not only on his fellow man, but his own gods.", "战队里的许多人对于带上一个不仅背叛了他的同胞，还背叛了他的神的人有些不满。");
	
	text = text.replace("You tell the man he\'ll be talking to his god or gods real soon. He sighs.", "你跟他说他很快就会去见他的神或神们了。他叹了一口气。");
	text = text.replace("In a manner, I deserve this, but I am at peace with it.", "某种程度上，我罪有应得，而我也对此感到平静。");
	text = text.replace("There\'s mixed reactions about the company on it, and by mixed it is mostly varying levels of exuberance.", "战队里对这件事的反应不一，这里不一指的是不同程度的幸灾乐祸。");
	text = text.replace("After all, the man is a traitor to both terra and celestial, making him easily hated by anyone and everyone.", "毕竟，这个人同时背叛了天和地，很容易让他被任何人与所有人厌恶。");

//holywar_flavor_north_outside_event.nut
	text = text.replace("The homestead is a smoldering ruin and its occupants have all been beheaded save one.", "农庄被烧毁，它的居民全都被斩首，除了其中一个。");
	text = text.replace("An unlucky figure has instead been prostrated and spread-eagled on the ground and has been set afire from what looks like the belly out: his chest is a cratered, ashen ruin, and his limbs blackened and charred, yet still skeletal in their remains.", "这个不幸的人呈飞鹰状的被压在地上，火势看来是从腹部开始的：他的胸口成了一个灰黑的坑，他的骨瘦如柴四肢亦是焦黑。");
	text = text.replace("His face is untouched, perhaps by design, and by the look of him he did not die in a manner you\'d find suitable to anyone, not even your own enemies.", "他的面部则没有受损，可能是故意的，而从他的表情看来即使是你的敌人也不该如此死去。");
	text = text.replace("You find some southern soldiers hanging from a tree, their eyes long since plucked by crows and their feet by fortune hunters.", "你找到了一些被吊在树上的南方士兵，他们的眼球早已被乌鸦啄走，脚则是那些碰运气的捕食者。");
	text = text.replace("They twist listlessly in the wind and none of the locals seem in a hurry to cut them down.", "他们无序的在风中摇摆，当地人看起来并不急着把他们放下来。");
	text = text.replace("A wagon train is splattered to both sides of a path, the wood and material littering the fields beside them.", "一个车队散落在道路的两旁，木材与零件随着它们散布在附近的草地上。");
	text = text.replace("Everything of value has been taken, and the merchant slain to the last.", "一切有价值的东西都被拿走了，而商人也全都被杀了。");
	text = text.replace("The wounds indicate southern intents, yet the mortal carvings don\'t quite seem as clean as you\'re used to seeing.", "伤口上可以看出是南方人的武器，但是这些致命的雕刻看起来不像你过去看过的一般简洁。");
	text = text.replace("This could very well be the work of thieves using the holy war as cover.", "这很有可能是贼匪借着圣战掩护下的作为。");
	text = text.replace("Either way, there\'s nothing of value left and you have the men continue on.", "不论如何，这里没有什么有价值的东西留下，于是你让手下们继续前进。");
	text = text.replace("You find a battlefield, though your arrival is far too late to make any dramatic appearance: the dead are all over the place, southern and northern, and the sutlers and scavengers and scapegraces have already looted the entirety of the aftermath.", "你找到了一个战场，尽管你的到来对于一个戏剧性的出场而言太迟了：死者到处都是，南方人与北方人，小贩与拾荒者还有恶棍们已经把这场战斗打扫干净了。");
	text = text.replace("Judging the frail appearances of a big heap of southerners piled in one spot, and fast footed retreat from it, you\'ve little doubt the Gilded threw forward their indebted souls to spare the rest of the troop.", "通过时不时出现的南方人尸体堆，以及这些尸体堆边仓促的撤退痕迹来看，你可以肯定那帮镀金者让负债者们成为了掩护他们撤退的牺牲品。");

//holywar_flavor_north_settlement_event.nut
	text = text.replace("A wagon is stopped on the side of the road.", "一辆载重货车停在路边。");
	text = text.replace("You find a man looking at a wide variety of wares.", "你发现一个人照看着多种多样的商品。");
	text = text.replace("He turns to your and speaks.", "他转身面向你说道。");
	text = text.replace("Ah, a sellsword. I imagine you\'re apart of the holy war, huh?", "啊，一个佣兵。我想你也参加了圣战，哏？");
	text = text.replace("Well, I hope you do right by your gods.", "我希望你做了你的神认为是正确的事情。");
	text = text.replace("I know coin\'s important, but there\'s more to life, and more after, understand?", "我知道钱是重要的，但是生命中有更多含义，以及更多在那之后，懂吗？");
	text = text.replace("You find a few children playfighting each other, some dressed up in loose clothing like you\'d find in the southern deserts.", "你发现几个儿童在玩战争游戏，有些穿着似南方沙漠中的的宽松衣服。");
	text = text.replace("The latter bunch fall easy to the preying swords of the more northern dressage.", "他们轻松的被更北方穿着的孩子们用木剑击中。");
	text = text.replace("Ah-ha! The Gilded fall, and may the old gods take the glory we\'ve to give!", "啊哈！镀金者倒下了，让旧神拥有我们赢来的荣誉！");
	text = text.replace("The kids calm down and then reset to positions.", "孩子们冷静下来便回到预定位置上。");
	text = text.replace("This time, they change guard, each exchanging clothes until the \'bad guys\' become \'good guys\' and then the play resumes.", "这一次，他们互换队伍，每个人交换着衣服直到“坏家伙”成为“好家伙”然后他们再从头开始。");
	text = text.replace("The holy war of the future will not be on short supply of faithful fighters, that\'s certain.", "未来的圣战不会缺少忠诚的战士，这一点是可以肯定的。");
	text = text.replace("You come across a monk reading a scroll.", "你遇到一个正在阅读一份卷轴的僧侣。");
	text = text.replace("He states that the old gods have willed the north to victory, and that glory shall be shared in terraria and more.", "他声称胜利是旧神们的旨意，而荣光将永照大地什么什么的。");
	text = text.replace("You ask what happens if the north loses.", "你问他如果北方人输了怎么办。");
	text = text.replace("It is a brazen question, certainly, yet he takes it on the chin with a smile.", "一个厚脸皮的问题，当然，但是他带着微笑接下了它。");
	text = text.replace("Do not fool yourself, sellsword, in thinking that our holy war today is all that there will be.", "不要骗自己，佣兵，特别是认为我们今天的圣战就是全部了。");
	text = text.replace("These wars will continue until an obvious end, and it will be at that end where we shall find most glory.", "这些战争会延续下去直到一个显而易见的结果，而这个结果将会是我们拥有最多的荣誉。");
	text = text.replace("I pray I live to see it, but my father and his father prayed the same, and alas I believe it will be my son who shall see the holy war brought to their righteous end.", "我祈祷我活到见证它的那一天，但是我的父亲与他的父亲都这么祈祷过，所以最终我相信我的儿子将能见证圣战正义的结局。");

//holywar_flavor_south_outside_event.nut
	text = text.replace("You find the disassembled remains of a battlefield: a litter of unusables with corpses so shriveled it\'s hard to discern to which side they belonged.", "你找到了一片杂乱的战场遗迹：干瘪的尸体凌乱的散步着，很难说他们是哪边的。");
	text = text.replace("The scraphunters no doubt took anything of use.", "拾荒者无疑拿走了一切有用的东西。");
	text = text.replace("A smoldering wagon with its owner left beside it, headless, and the rest of his body plucked to the bone.", "一驾载重货车散发着黑烟，它的主人躺在一边，没有头，剩下的尸体也露出了白骨。");
	text = text.replace("Given the war going on, it\'s hard to say who exactly is responsible for it.", "随着这场战争持续下去，很难说到底谁该为此负责。");
	text = text.replace("You find the defaced remains of an old gods banner, staked into the sands with a headless corpse strung up on the pole.", "你找到了一杆旧神的旗帜，上面的神像被抹去面容，扎在沙地里，一个无头的尸体被插在上面。");
	text = text.replace("No doubt a northerner, the body is practically bubbling in appearance as sand lizards snake to and fro, trying to get the last of the good morsels.", "无疑是一个北方人，尸体随着沙漠蜥蜴们为最后一点食物进出而看似起泡一般。");
	text = text.replace("There\'s a smattering of more bodies across the sands, most crawling with beetles or being tugged at by snakes and other vulturous creatures.", "更多的尸体零星的散步在沙地上，大多数被甲虫爬满或者被蛇还有什么其他食腐动物拖拽着。");
	text = text.replace("You find a dead northern man propped up in the sands, his arms and legs bound to a wooden chair.", "你找到一个撑在沙漠上的北方人尸体，他的手脚绑在一个木制椅子上。");
	text = text.replace("In front of him is a large pole with a catch frame and ropes which hang limp from its corners.", "在其前方是一个大号的柱子，带有框架与角落上耷拉着的绳索。");
	text = text.replace("It seems it once held something large and rotund.", "看起来它曾经挂着什么大而圆的东西。");
	text = text.replace("The man\'s head has a hole bored through it, and the wound is unlike any you\'ve ever seen: it\'s almost as if they drilled through it with heat alone.", "尸体的头上有一个洞，一种你没见过的伤口：就好像纯粹的热能就这么钻了过去。");
	text = text.replace("Perhaps the Gilded used the reflection of a great medallion to intensify the sun?", "也许镀金的家伙们用了一个很大的吊坠来强化太阳光的反射？");
	text = text.replace("It\'s hard to say.", "很难说。");
	text = text.replace("You find a row of corpses in the sand, and upon closer inspection find they\'re all southern women and what looks like a man who could possibly be on a Vizier\'s council.", "你在沙地中找到了一排尸体，在更近距离的观察后辨认出是一群南方女人以及一个看起来可能出现在维齐尔议会上的男人。");
	text = text.replace("All their heads have been removed and placed upon their backs, the eyes facing their buttocks.", "它们的头在移除后放在它们的背上，眼睛面向它们的臀部。");
	text = text.replace("You\'re not sure what any of this means, but no doubt it is the result of internal quarrels within the Vizier\'s own ranks.", "你不确定这些都有什么含义，不过这无疑是维齐尔内部纠纷的结果。");
	text = text.replace("There\'s nothing of value to take so you have the men move on.", "看起来再没有什么有价值的东西所以你让手下继续前进。");

//holywar_flavor_south_settlement_event.nut
	text = text.replace("Children peep their heads over a sand dune, just missing another group of children hiding in the shade of a defilade.", "孩子们从沙丘后探出头来，错过了另一群躲在遮蔽物阴影下的孩子。");
	text = text.replace("When the first troop come over the top, the ambushing kids jump out and stab them with sticks and slay them down.", "当第一批士兵越过顶端，埋伏着的孩子们跳出来用木棍扎他们并将他们击倒。");
	text = text.replace("Death to the northerners, may the Gilder\'s gaze shine upon us!", "死吧北方人，让镀金者的目光沐浴我们！");
	text = text.replace("The slain kids slide down the dune, limp and lifeless, before jolting back to their feet and arguing that it is their turn to play the \'good guys.\'", "被击倒的孩子们耷拉着滑下沙丘，直到他们突然跳起并开始争论是时候让他们来扮演“好家伙.”");
	text = text.replace("It seems the holy war has already invigorated the next generation to be ready when their time comes.", "看来圣战已经激励了下一代，让他们在时机成熟时做好准备。");
	text = text.replace("Rows and rows of the faithful bend to the sands to give their prayers to the Gilder.", "一排又一排的忠实信徒们趴向沙漠以向镀金者祈祷。");
	text = text.replace("All manner of men and women and children alike, and dissimilar, being that there were wealthy merchants beside impoverished beggars.", "各种各样的人，男人，女人，儿童，也有不同之处，一些贫穷的乞丐旁边还有富商。");
	text = text.replace("The only real standouts are the Vizier and the councilmen, who all pray beside the priests at the head of the procession.", "唯一的突出者是维齐尔与议员们，他们都在游行队伍前面的牧师旁边祈祷");
	text = text.replace("That is if these men are praying at all: as far as you can tell, the council is whispering amongst themselves, some not paying the slightest bit of attention to the ceremony.", "这是说如果他们真的在祈祷的话：至少从你这里看，议会成员间在轻声低语着什么，有的对仪式毫无关注。");

//holywar_ill_southerners_event.nut
	text = text.replace("You come across a homestead and think to pass it but all of a sudden the door swings open and a man falls out, legs scissoring across the porch until he falls flat in the front yard.", "你遇到一个农庄，你本打算快速通过不料突然一扇门摆开了，一个男人从中倒出来，腿交叉过门厅，直到他平倒在前院。");
	text = text.replace("Drawing your sword, you investigate him.", "拔出了剑，你检查了他。");
	text = text.replace("Turning him over reveals a green and purple face, a mouth caked with vomit and dried blood, and hair falling out of his head.", "翻过他显露出一张又绿又紫的脸，嘴上都是呕吐物与干掉的血，头发也不停的掉下来。");
	text = text.replace("You leave the body and enter the homestead where you find more men like him.", "你离开他并进入农庄，在那里你找到了更多像他一样的人。");
	text = text.replace("They\'re all southerners and seem to have come down with some northern illness that they are perhaps uninitiated to.", "他们都南方人，染上了某种他们或许不了解的北方疾病。");
	text = text.replace("Judging by the slovenly state of their equipment, they\'ve been holed up here for quite some time.", "通过他们装备的败坏程度，他们已经在这里待了有一段时间了。");
	text = text.replace("One of the southerners reaches out to you with a decrepit hand.", "其中一个南方人向你伸出他骨瘦如柴的手。");
	text = text.replace("Please, send us to the Gilder.", "求你了，将我们送往镀金者。");
	text = text.replace("The light of this world is no more.", "这个世界已经没有光了。");
	
	text = text.replace("The southerners are killed with dignity, or at least as much dignity a sword can afford.", "南方人被杀得很有尊严，至少是剑能给予他们的最后那一点尊严。");
	text = text.replace("Of course, you kill them at length, not daring to lay a hand on their diseased bodies.", "当然，你在动手的时候保持着距离，不敢碰他们感染恶疾的身体。");
	text = text.replace("After each is laid to rest, you take a look around the homestead.", "在每一个患者都安息后，你环顾了农庄。");
	text = text.replace("To your luck, and probably because the material was rubbing their skins raw, the sickly had lain some equipment off to the side.", "幸运的，或许是因为它们的材质很容易擦伤他们的皮肤，病人们把一些装备放在了边上。");
	text = text.replace("You have the brothers scrub it clean and take it with you onto the road.", "你让兄弟们把它擦干净后带上了路。");
	text = text.replace("While leaving, there\'s some grousing about how maybe these men deserved worse, but others are quite fine with the mercy killings.", "在离开的时候，有的人发牢骚，认为这些人应该承受更多折磨，但是其他人对于这种仁慈没有意见。");
	
	text = text.replace("Some of the southerners\' gear has been taken off and placed about the room.", "有些南方人的装备被脱下放在房间四周。");
	text = text.replace("You have the sellswords take these and scrub them clean.", "你让佣兵们拿了这些并把他们擦干净。");
	text = text.replace("Going to the front door, you light a torch and tell them the Gilder shall be seeing them in his true self real soon.", "走到前门，你点着了一个火炬并告诉他们镀金者很快会以他的真身会见他们。");
	text = text.replace("The soldiers beg for mercy, a writhing mass of silhouettes crawling toward you, groaning in weakness and fear.", "士兵们乞求怜悯，一堆扭曲的身影向你爬来，虚弱的哀嚎着他们心中的恐惧。");
	text = text.replace("You close the door and set the rooftop alight before pitching the torch through a window.", "你关上了门并点燃了屋顶之后将火炬丢入了窗户。");
	text = text.replace(/You\'ve taught your men well to not take it personal on these sorts of decisions, but you suspect some in the $1 might not care for this one\./, "你指导过你的手下不要把这种决策个人化，但是怀疑有些 $1 的人在这件事上不顾这些。");

//holywar_intro_north_event.nut
	text = text.replace("Alright, alright, sort yerself, sort yerself.", "好吧，好吧，肃静，肃静。");
	text = text.replace("You come to a peasant holding court with, unsurprisingly, more peasants.", "你来到了一个农民法庭，不出所料，那里有更多的农民。");
	text = text.replace("Now I just got told that these Gilded farks in the south think their \'maker\' has something in store for the old gods.", "现在我刚被告知这些镀金的南方狗屁认为他们的“造物主”给旧神们准备了点玩意。");
	text = text.replace("A voice from the crowd asks what that could be. The speaker shrugs.", "人群里的一个声音问道那会是什么。喊话者耸耸肩。");
	text = text.replace("Dunno. Now, I think we can all agree that the old gods settled their wars many years ago, and there\'s no need for violence.", "不知道。现在，我想我们都可以认同旧神在很多年以前就解决了他们的战争，没有什么好暴力的。");
	text = text.replace("But the Gilder, he ain\'t no old god.", "但是镀金者，他可不是旧神。");
	text = text.replace("That there is a heresy.", "这意味着异端。");
	text = text.replace("The crowd cheers. You\'re beginning to wonder if this man is a cleric in commoner\'s clothing. He continues.", "群众欢呼着。你开始寻思这个人是不是个穿着普通人衣服的牧师。他继续道。");
	text = text.replace("Gather up yer weapons, yer armor, yer gold, and most importantly, yer faith, we\'re going to put some shadow on that \'Gilder\'!", "集起你们的武器，你们的盔甲，你们的金子还有最重要的，你们的信仰，我们要去给那个“镀金者”来点阴影！");
	text = text.replace("The old gods will it!", "这是旧神的意志！");
	text = text.replace("The crowd roars this time, so deafening that your ears crackle.", "这次群众们咆哮了起来，震耳欲聋的响。");
	text = text.replace("It is good to see such energy.", "这种能量是好兆头。");  
	text = text.replace(/Once the fighting starts, there will be plenty of business as the righteous shall certainly find faith in the (.*?)\./, "一旦战斗开始，生意肯定会相当兴隆，特别是某些正义的人想要看到的信仰必然在 $1。");
	text = text.replace("A bearded cleric stands before a crowd of peasants.", "一个大胡子牧师站在一群农民面前。");
	text = text.replace("It is said that the old gods fought their wars to completion many years ago, that they tore this world asunder, and left us in the devastation, and they have been impressed by our ability to persevere against such great struggle.", "传说旧神在许多年前便完成了他们的战争，说他们将这个世界撕裂，并把我们遗留在这一片毁灭上，以及他们欣赏我们艰难奋斗生存下去的能力。");
	text = text.replace("The crowd murmurs. The man continues.", "群众低语着。那个人继续道。");
	text = text.replace("But we are challenged yet, ye faithful!", "但我们现在面对挑战，忠实信徒哟！");
	text = text.replace("To the south wander heretics, followers of the \'Gilder\', a false god of opulence, profligacy, and a lowly prestidigitation they pass for righteousness.", "在南方异端横行着“镀金者”的信徒们，一个象征奢侈，浪费，以及他们认为正义实为下贱巫术的伪神。");
	text = text.replace("The crowd doesn\'t know what any of those words mean, but they raise their pitchforks to the air and roar, beckoning the clerics to tell them where to go.", "群众们一个词都没听懂，但是他们将他们的草叉高举着嘶吼了起来，询问着牧师们他们将前往何处。");
	text = text.replace("Smiling, the elders turn to one another and nod.", "微笑着，长老们转向对方并点头。");
	text = text.replace(/You have little care for who or what is starting this crusade between north and south, only that the (.*?) will stand to earn a fair bit of coin in the gross matter\./, "你不在乎是谁或是什么在发起南北间的圣战，只在乎 $1 能从中捞到的好处。");
	text = text.replace("The arsenal assembled before you is unlike any you\'ve ever seen.", "堆积在你面前的军械前所未有。");
	text = text.replace("Armaments piled higher than three men head to feet.", "武器堆起来有三人多高。");
	text = text.replace("Soldiers are lined up, half of them holding religious banners, each adorned with one of the old gods.", "士兵们排成队，其中一半握着宗教旗帜，每一个都装饰着旧神中的一个。");
	text = text.replace("Clerics and monks walk the lines, speaking to the matter in both earthly and heavenly tones.", "神职人员和僧侣们都循规而行，用世俗和天国的语气来谈论这件事。");
	text = text.replace("This is the crusade, the great religious arrest of the northerners to take on the Gilder\'s followers.", "这就是圣战，北方人因宗教聚集在一起去面对镀金者的追随者。");
	text = text.replace("Sellsword, are ye?", "佣兵，是吗？");
	text = text.replace("You turn to see a young lad gearing up.", "你转过身看到一个小伙子正穿上装备。");
	text = text.replace("You\'ll be on the righteous path, I know it, and the old gods will watch over us all.", "你会在正直的道路上的，我懂的，而且旧神会照顾好我们所有人的。");
	text = text.replace("Do by them well, little scapegrace.", "好好表现给他们看，小流氓。");
	text = text.replace(/Of course\. But first you\'ll do right by the (.*?) and getting a fat purse from all the action to come\./, "当然。但是首先你要为了 $1 从战争的漩涡中赚得盆满钵满。");

//holywar_intro_south_event.nut
	text = text.replace("May our paths be gilded in the days to come.", "让我们的未来的道路金光闪耀。");
	text = text.replace("The priest speaks loudly to his congregation.", "牧师大声的向他的会众们说道。");
	text = text.replace("I ask of you, faithful, where is the light brightest?", "我问你们，忠实信徒，哪里的光最为闪亮？");
	text = text.replace("A throng of peasants murmur about themselves.", "一大群农民互相间低语着。");
	text = text.replace("Finally, the priest holds his hand up.", "最后，牧师举起他的手。");
	text = text.replace("It is upon the horizon, fighting against the shade of the earth herself, that we find the Gilder\'s gleam to be its fiercest.", "是在地平线上，对抗大地她本身的阴影，在那我们才能找到镀金者最强烈的光辉。");
	text = text.replace("And we are now fighting against the shade, and the horizon is not the earth, but the improprieties of the northern stock who dare to profane the holy lands!", "现在我们正与那阴影战斗，而地平线上并非大地而是胆敢亵渎圣地的北方无礼崽种！");
	text = text.replace("The crowd, once confused, is suddenly unified, seemingly all too knowledgeable about religious war. The priest grins.", "人群，一开始有点困惑，突然团结一致，看起来对宗教战争太过了解了。牧师嘴角上扬。");
	text = text.replace("That is right, I see your hearts burn with the fire of the Gilder already!", "这就对了，我已经可以看到你们心中燃烧着的镀金者之火！");
	text = text.replace("We must defend the sacred grounds no matter the cost!", "我们必须不惜代价保卫我们的圣地！");
	text = text.replace("Again, the crowd roars.", "又一次，回应他的是人群的吼声。");
	text = text.replace("You\'re not sure what to make of the peoples themselves, but if there\'s one thing you know about war it is that it is good for business and a bit of holy fury might make it all the better.", "你不知道该怎么理解这群人，但是你知道战争意味着生意而一点额外的宗教狂热可以让生意更好。");
	text = text.replace("The Vizier has made a rare appearance for the plebs of his land, and beside him is the greater councils of nearby cities.", "维齐尔罕见的出现在他土地上的平民前，周边城市的大议会议员们簇拥在他身边。");
	text = text.replace("But he does not speak.", "但他一言不发。");
	text = text.replace("A man clothed in gold steps forward instead.", "一个身着真金的男人走上前来。");
	text = text.replace("The path of us all has been gilded, has it not?", "我们的旅途都金光闪耀，不是吗？");
	text = text.replace("Far less gleaming than the priest, the crowd murmur amongst themselves, though none dare to contradict the holy man\'s assertion. The priest continues.", "远不如这个牧师般闪亮，人群熙熙攘攘的小声交谈着，尽管没人胆敢反对圣人的主张。牧师继续道。");
	text = text.replace("The Gilder has spoken to many of us, and revealed to us a new event threat: the northerners, spurred by their so-called old gods, have swept south.", "镀金者对我们中的许多人透露了一个新的威胁事件：北方人在他们所谓的旧神的刺激下，已经席卷南方。");
	text = text.replace("They entertain the thought of a crusade!", "他们可笑的声称，这是一场圣战！");
	text = text.replace("To come here, right here, and take all our lands and sacred grounds.", "为了到这来，就这里，来夺走我们的领土与圣地。");
	text = text.replace("You see, the Gilder\'s shine shows us the path, but perhaps to others it is far too blinding.", "很显然，镀金者的光芒给我们展示了道路，但或许对于他人而言这太过耀眼。");
	text = text.replace("These northerners do not understand, but we will teach them, and by the Gilder\'s fire we shall!", "这些北方人不明白，但我们会教给他们的，以镀金者的圣火之名教给他们！");
	text = text.replace("The crowd roars to life and any sense of hesitancy is long gone.", "人群嘶吼的活跃起来，任何迟疑都烟消云散了。");
	text = text.replace("You chow down on a local delicatessen and wonder just how much money you\'re going to make in this holy war to come.", "你吃下一口当地菜肴，开始寻思你在这场将要到来的圣战能中赚到多少。");

//holywar_neutral_nomads_event.nut
	text = text.replace("You come across a band of nomads.", "你遇到一群游牧民。");
	text = text.replace("Despite the severity of a war going on, they do not treat you as a threat.", "尽管战争惨烈的持续着，他们没有把你当做威胁。");
	text = text.replace("One welcomes you with a drink and the shade of an umbrella which you accept.", "一个人用饮品与可以遮阳的伞欢迎你，你接受了。");
	text = text.replace("I hope your travels have been kind, Crownling.", "我希望你的旅途坦荡，逐币者。");
	text = text.replace("You share a similarity with us dune runners, that of the interloper.", "你和我们沙丘旅者有一些相似，特别在作为入侵者这件事上。");
	text = text.replace("The grievances between the north and south need not concern us.", "南北之间的恩怨我们没必要掺和进去。");
	text = text.replace("He sips his own drink and nods.", "他喝下他自己的饮料点头说道。");
	text = text.replace("Though I suspect you have made a great deal of coin in the conflict.", "不过我想你已经在冲突中赚了不少钱。");
	text = text.replace("Some of my countrymen would consider you most faithful to the Gilder because of it.", "我的一些同胞会因此把你当做镀金者最忠实的信徒的。");
	
	text = text.replace("The nomad laughs.", "游牧民笑了。");
	text = text.replace("In matters of faith, why would anyone think alike?", "在信仰问题上，人怎么可能有共识呢？");
	text = text.replace("He gathers up his rugs and umbrellas.", "他卷起他的杯子和伞。");
	text = text.replace("I have heard in the north that there are wildmen like us.", "我听说在北方有像我们一样的野人。");
	text = text.replace("You purse your lips, holding back a laugh.", "你咬住嘴唇，尽力忍住不漏笑。");
	text = text.replace("We\'ve men of the forest who have absconded civilization, aye.", "我们有些人进入森林逃离了文明，没错。");
	text = text.replace("But they\'re a more... peculiar sort compared to you and yours.", "但是他们更加…不寻常，特别是对比你和你的族群的时候。");
	text = text.replace("They are not so much like you.", "他们不太像你。");
	text = text.replace("Nodding, the nomad gives you a gift.", "点着头，游牧民给与了你一份礼物。");
	text = text.replace("But maybe they are and you just have not been listening to them.", "或许我是错的，只是你从没有听从过他们。");
	text = text.replace("He touches his chest with a fist then the nomads continue on their journey.", "他握成拳头击打了下胸口，游牧民们便重新上路了。");
	
	text = text.replace("You finish your drink and tell the man your time with him was all very interesting.", "你喝完了饮料并告知和他一起的时间非常有趣。");
	text = text.replace("He goes to shake your hand at which point you put the sword through him.", "他伸出手向你握手时你的剑刺穿了他。");
	text = text.replace("The rest of the company joins in and the battle is as short-lived as your sense of hospitality.", "战队的其他人也加入进来，战斗如同你的好客般短暂。");
	text = text.replace("The nomads have little worthwhile in their holding, but no one will know of what you\'ve done here, though it\'s unlike they would care anyway.", "游牧民们没有什么值钱的东西，但是没人会知道你在这里做了什么，本身他们也不大可能在意。");
	
	text = text.replace(/(.*?) the wildman steps beneath the umbrella\./, "$1 野人凑上来到伞下。");
	text = text.replace("The nomad stares at him, and the wildman at the nomad.", "游牧民盯着他，野人也盯着游牧民。");
	text = text.replace("You ask if they know each other. The nomad smiles.", "你问他们彼此是否认识。游牧民笑道。");
	text = text.replace("No, but yes. We\'ve kindred spirits.", "不，但是的。我们有相似的灵魂。");
	text = text.replace("I can see it in his eyes.", "我可以从他的眼中看到。");
	text = text.replace("The wildman hoots and grunts, then turns and leaves.", "野人大笑着发出了咕哝声，之后便转身离开了。");
	text = text.replace("When you return your gaze to the nomad he is holding out a gilded dagger.", "当你看回游牧民时他握着一把镀金的匕首。");
	text = text.replace("Treasures, golds, those things which shine and catch a man\'s eye, they carry little value to me.", "宝藏，黄金，这些闪亮而引人注目的东西，他们对我而言毫无价值。");
	text = text.replace("I found this upon one of the Vizier\'s guards.", "我在维齐尔的一个卫兵身上找到了这个。");
	text = text.replace("We had slain him and his caravan for their food and water, the things which I believe most important.", "我们为了水和食物杀了他及他护送的商队，我认为这是最重要的东西。");
	text = text.replace("You may have the dagger, as nothing more than a gift.", "拿走这个匕首吧，当做是我的一个礼物。");
	text = text.replace("You take it, but warn him that if he ambushes you the way he did the Vizier\'s men that you will perhaps use the very same dagger against him. The nomad nods.", "你收下了它，但是警告他如果他像对维齐尔的人一般伏击你，你或许会用这把匕首对抗他。游民点头说。");
	text = text.replace("And yet it is still my gift.", "依然，这是我的礼物。");
	text = text.replace("I would find the occasion to be of such irony that it could only be a pleasure to die in such a manner.", "如果事态发展成如此讽刺的情景，我觉得死亡也是一件乐事。");
	text = text.replace("There are worse ways to go here in the desert, friend.", "在沙漠中有很多糟的多的死法，朋友。");

//holywar_occupied_north_event.nut
	text = text.replace(/News travels fast with a bit of religious spurring: (.*?) has been taken by northern crusaders!/, "信息传的很快，带着一点宗教味的刺激性：$1 被北方十字军占领了！");
	text = text.replace(/Crusaders from the north have taken (.*?)\. You\'re not sure if this means the war is soon to be at an end\./, "来自北方的十字军占领了 $1。你不确定这意味着战争是否很快就要结束了。");
	text = text.replace("It would be a shame if that were the case as all this strife has made for such great opportunities.", "如果是的话那真是可惜，想想这场斗争创造了多少好机会。");
	text = text.replace(/(.*?) has fallen under the banner of northern crusaders!/, "$1 陷落于北方十字军旗下！");
	text = text.replace("While the old gods no doubt rejoice, the followers of the Gilder will presumably seek to have it taken back.", "毫无疑问，在旧神们欢呼时，镀金者的追随者将会试图夺回它。");
	text = text.replace(/This may present opportunities for the (.*?)\./, "这个可能的机会来到了 $1。");

//holywar_occupied_south_event.nut
	text = text.replace(/News is coming that the Gilded ones have conquered (.*?)\. What they plan to do with it, who knows\./, "消息传来，镀金者们征服了 $1。至于他们打算用它做什么，谁知道呢。");
	text = text.replace("Maybe put up a gold-plated fence to keep the northerners out?", "或许立起一圈镶金的栅栏来把北方人挡在外面？");
	text = text.replace(/You\'re mostly concerned the fighting might be nearing an end, and with it all the sweet religious honey the (.*?) has been eating up\./, "你最担心的是这场战斗可能接近尾声，随着所有那些 $1 享受着的甜蜜的宗教甜点一起。");
	text = text.replace(/The Gilder\'s gleam must be brighter than ever now: (.*?) has fallen under control of the southerners\./, "镀金者的光辉想必前所未有的闪亮：$1 现在处于南方人的控制下。");
	text = text.replace(/Perhaps the Gilded folk will ask the (.*?) to help defend it, or maybe the old gods will need a bit of proper gumption in taking it back\./, "或许镀金的人们会希望 $1 来帮忙守住它，又或许旧神需要些真正有勇气的人来帮他们夺回它。");
	text = text.replace(/Either way, the (.*?) is still on the catbird seat for fattening its purse\./, "不论如何，$1 依旧坐在让钱袋子变大的座位上。");

//holywar_outro_north_event.nut
	text = text.replace("Faith placed in the old gods has been rewarded: the holy war is over, and the northerners stand victorious.", "对旧神们的虔诚信仰得到了回报：圣战结束了，北方人获得了胜利。");
	text = text.replace("Songs fill the air as crowds move as a mob, fists pumping, flags flying, becoming briefly uniform in a shared sense of piety.", "喜乐随着人群摆动，好友击着拳，旗帜飘扬，一切都以一种虔诚感而团结起来。");
	text = text.replace("You stand by the wayside, your shoulders already wreathed in adornments, beads, necklaces, things of no material value, and yet they bear some weight which the wearer can only find by looking into the eyes of those who hand them out.", "你站在路边，你的肩膀上环绕着装饰品，念珠，项链，没有什么物质价值的东西，但同时它们有一种只有在看入那些交出它们的人的眼睛时才能感到的重量。");
	text = text.replace("Of course, certain dignities go unrealized in the celebration: the bodies of the defeated are put on display, thrashed in ways meant to satisfy the old gods that are watching, and holy totems of the Gilder are mocked, desecrated, and ultimately burned.", "当然，一些美德在庆祝中被无视了：败者的尸体被摆出展示，鞭打过，仿佛是为了满足注视着的旧神一般，还有镀金者的神圣图腾，被嘲弄，亵渎，并最终烧掉。");
	text = text.replace("And it is indeed certain that not a joyful soul will recognize you as a force in this cheerful culmination.", "很显然没有一个欢快的灵魂在这种庆祝的高潮中承认你的贡献。");
	text = text.replace("You\'ve merely slipped right into the background once more, sellsword, crownling, interloper.", "你只不过又一次滑入了幕后，佣兵，逐币者，入侵者。");
	text = text.replace(/But the (.*?) made a small fortune in the religious endeavors\./, "但是 $1 在这一系列宗教活动中收获不少。");
	text = text.replace("Despite the smiles and laughs, you know that strife such as this is buried in the mind, not in the earth, and someday someone or something will come and resurrect it, and there the company will await another glorious payday.", "抛开欢言笑语，你知道这种争端只是埋在了脑海中，而不是土里，总有一天什么人或什么东西会回来复活它，在那时战队将等到又一个荣耀的发薪日。");
	text = text.replace("Or perhaps now would be a good time to put up the sword and enjoy your crowns?", "又或许现在是放下剑享受你挣到的克朗的好时候？");
	text = text.replace("You\'ve won! Battle Brothers is designed for replayability and for campaigns to be played until you\'ve beaten one or two late game crises.", "你已经胜利了！战场兄弟是为可重玩性和战役而设计的，直到你在游戏后期打败了一两次危机。");
	text = text.replace("Starting a new campaign will allow you to try out different things in a different world.", "开始一个新的战役会让你在不同的世界尝试不同的东西。");
	text = text.replace("You can also choose to continue your campaign for as long as you want.", "你可以选择继续你的战役，只要你想。");
	text = text.replace("Just be aware that campaigns are not intended to last forever and you\'re likely to run out of challenges eventually.", "只是要意识到，战役并不是要永远持续下去的，你可能最终会尝尽所有的挑战。");
	
	text = text.replace("Uttering their name is to draw words from tongue to intemporal: the old gods.", "低语他们的名字是将言语从舌尖变为非世俗的事物：旧神。");
	text = text.replace("They are beyond time, and their vast number invoke awe over specificity.", "他们是超越时间的，他们的数量让人对明确性敬而远之。");
	text = text.replace("Endearing as this is to any listener familiar or not with the faith, it also brings greater weight to any defeat of those who follow these unbranded beings.", "对于不论对宗教熟悉与否的听众而言可喜的是，它同样在那些追随这些不明确个体的人在落败时给予巨大的压力。");
	text = text.replace("The crusades are over, and the northerners have lost.", "圣战结束了，北方人输了。");
	text = text.replace("You watch as the northerners try and explain it to one another how it came to pass.", "你看着北方人互相试着解释这一切是怎么发生的。");
	text = text.replace("It was not a terrestrial defeat here, nor even a victory by the southerners - no, this was punishment.", "这不是地上人的失败，也不是南方人的胜利－不，这是惩罚。");
	text = text.replace("Northerners have grazed far from the holy lands, they have meadowed in the material world, priories and churches dot the realm, empty and hollow for far too long.", "北方人放牧到了离圣地太远的地方，他们沉沦在物质世界的草场中，修道院与教堂点缀着国土，空洞已久，太久。");
	text = text.replace("Naturally, inquiries about the nature of this southern \'Gilder\' have also come, but they quickly pass.", "很自然的，对南方的所谓“镀金者”的调查也曾有过，但是他们很快就过去了。");
	text = text.replace("To even dwell on Him is to invite doubt, and right now doubt is as dangerous as any poison.", "即使是停留在他身上，也会引起怀疑，而现在怀疑就像毒药一样危险。");
	text = text.replace(/Of course, the (.*?) stays at a distance\./, "当然，$1 保持着距离。");
	text = text.replace("Sellswords that you are, you put faith in your sword and in the purse, and both got their dues in this war.", "作为一个佣兵你的信仰在于剑和钱袋上，这两个都得到了这场战争中它们应得的。");
	text = text.replace("The only philosophizing you\'ll be doing in the days to come is pondering just how soon the north and south will resume stating their differences.", "在接下来的日子里，你唯一要做的哲学思考就是思考南北两国多久会重新开始陈述他们的分歧。");
	text = text.replace("Perhaps now would be a good time to put up the sword and enjoy your crowns?", "又或许这是时候放下剑来享受你的克朗？");
	text = text.replace("You\'ve won! Battle Brothers is designed for replayability and for campaigns to be played until you\'ve beaten one or two late game crises.", "你已经胜利了！战场兄弟是为可重玩性和战役而设计的，直到你在游戏后期打败了一两次危机。");
	text = text.replace("Starting a new campaign will allow you to try out different things in a different world.", "开始一个新的战役会让你在不同的世界尝试不同的东西。");
	text = text.replace("You can also choose to continue your campaign for as long as you want.", "你可以选择继续你的战役，只要你想。");
	text = text.replace("Just be aware that campaigns are not intended to last forever and you\'re likely to run out of challenges eventually.", "只是要意识到，战役并不是要永远持续下去的，你可能最终会尝尽所有的挑战。");

//holywar_outro_south_event.nut
	text = text.replace("You recall the followers of the Gilder to once be united in their pursuit of leveling the old gods.", "你回想起镀金者的追随者们曾经团结在他们抗衡旧神们的追求中。");
	text = text.replace("Some misplaced notion that, were they to satisfy their God enough, He would put his powerful eye upon all enemies of His faithful and obliterate them.", "有些人误认为，如果他们让他们的神足够满意，他就会将他强大的眼睛用来把他忠实的信徒们的敌人摧毁。");
	text = text.replace("Instead, the Gilded find their resolve greatly tested: they have lost the holy war.", "与之相对，镀金者发现他们的意志面临着极大的考验：他们在这场圣战中输了。");
	text = text.replace("Cities and towns have been burned, holy totems desecrated, and sacred grounds looted.", "城市，城镇都被烧毁了，神圣的图腾被亵渎，圣地亦被洗劫一空。");
	text = text.replace("Crowds of people listlessly shift about in the streets, wailing now and again, not with purpose, but as though they\'ve lost all language to articulate the pain they must now endure.", "大量的人群散乱的在街上游荡，时不时号啕大哭，没有什么明确的目的，只是如同他们失去了能够表述他们现在承受的痛苦的所有言语。");
	text = text.replace("On occasion, a body will plummet from above, or you find the guards pulling corpses out of the well only for an onlooker to pitch herself in.", "时不时的，一个尸体就会从上面掉下来，你看到卫兵们从井中捞出尸体时旁观者中的一个女人自己投身进去。");
	text = text.replace("A few prostrate themselves before golden relics, letting themselves cook in the sun struck glare of the shiny emblems, the grief stricken crawling beneath the simmering reflections until their skins turn to crust and their throats choke on their own flesh, and as the sun comes and goes, bodies lay in the wake of its stare.", "数个人伏在金制的圣物前，任自己受其上纹章在阳光下反射出的光线灼烧，饱受悲伤煎熬的悲怆者趴在炙热的反射下直到他们的皮肤结成硬壳，喉咙因他们自己的血咳嗽，日升日落，他们就这么承受着它的注视。");
	text = text.replace(/As for the (.*?), you\'ve put yourself to one side or the other, and regardless of winners or losers, you made a small fortune\./, "至于 $1，你投身于其中一方或另一方，不论输赢，你获得了一份微小的财富。");
	text = text.replace("For the future you need not wish to have the opportunity again, either: if there\'s one thing you know about a man of faith it\'s that defeat is only but one strike upon the hardening iron.", "对于未来，你也无需期盼这样的机会再次出现：如果关于信教者有什么是你可以确信的，那便是失败不过是愈加硬化的钢铁上的一击而已。");
	text = text.replace("With all that you\'ve achieved, perhaps now would be a good time to put up the sword and enjoy your crowns?", "以你的成就，或许现在是时候放下剑享受你挣到的克朗？");
	text = text.replace("You\'ve won! Battle Brothers is designed for replayability and for campaigns to be played until you\'ve beaten one or two late game crises.", "你已经胜利了！战场兄弟是为可重玩性和战役而设计的，直到你在游戏后期打败了一两次危机。");
	text = text.replace("Starting a new campaign will allow you to try out different things in a different world.", "开始一个新的战役会让你在不同的世界尝试不同的东西。");
	text = text.replace("You can also choose to continue your campaign for as long as you want.", "你可以选择继续你的战役，只要你想。");
	text = text.replace("Just be aware that campaigns are not intended to last forever and you\'re likely to run out of challenges eventually.", "只是要意识到，战役并不是要永远持续下去的，你可能最终会尝尽所有的挑战。");
	
	text = text.replace("Faith placed in the Gilder has been rewarded: the holy war is over, and the southerners stand victorious.", "对镀金者虔诚的信仰得到了回报：圣战结束了，南方人获得了胜利。");
	text = text.replace("The Vizier, councilmen, and clergy alike are found in the streets, each riding great wagons which, in place of wheels, are lofted on the backs of slaves.", "维齐尔，议员，神职者之类在街道上，每一个都乘坐着巨大的载重货车，轮子被奴隶替代了的车。");
	text = text.replace("Northern slaves, particularly, indebted to the Gilder for their crimes.", "尤其是北方奴隶，因他们对镀金者的罪孽而负债。");
	text = text.replace("You can hardly see the men, just their legs black in shadow as though a procession of swaying beetles was on the go.", "你几乎看不到那些人，只是他们的腿在阴影下的黑影，就好像甲虫成队列在前进一般。");
	text = text.replace("The wealthy and profligate men take great chalices and hurl what looks like golden water upon the cheering faithful.", "富有而奢侈的人们举起巨大的酒杯向欢呼的忠实信徒们抛出看起来像是金色的水的东西。");
	text = text.replace("You yourself lean into one of these splashes, but find it is merely just tinted water.", "你自己探身去检测这些泼洒，只发现这原来不过是染过色的水。");
	text = text.replace(/While the faux fortunes served only to slake your thirst, the very real war between the followers of the old gods and the Gilded themselves served to fill the (.*?)\'s treasury\./, "尽管这种假冒的财富只能够满足你的口渴，旧神与镀金者信徒间真实的战争本身已经把 $1的宝箱塞满了。");
	text = text.replace("As a Crownling, you\'ll never find the respect of bared heads and bowed bodies, nor the prostrations of peasants, nor the gleam of gold too heavy for any one man to carry.", "作为一个逐币者，你从未受到过光头的和屈身的人的尊重，也没有农民的拜倒，亦没有重到一个人搬不动的黄金的微光。");
	text = text.replace("That is the reality for you, but that won\'t stop the company from being ready the next time the pious wanna have a squabble over righteousness.", "这就是你的现实，但是那不会阻止你的战队在下一次虔诚者们想要争论什么是正义时做好准备。");
	text = text.replace("Or perhaps now would be a good time to put up the sword and enjoy your crowns?", "又或许现在是放下剑享受你挣到的克朗的好时候？");
	text = text.replace("You\'ve won! Battle Brothers is designed for replayability and for campaigns to be played until you\'ve beaten one or two late game crises.", "你已经胜利了！战场兄弟是为可重玩性和战役而设计的，直到你在游戏后期打败了一两次危机。");
	text = text.replace("Starting a new campaign will allow you to try out different things in a different world.", "开始一个新的战役会让你在不同的世界尝试不同的东西。");
	text = text.replace("You can also choose to continue your campaign for as long as you want.", "你可以选择继续你的战役，只要你想。");
	text = text.replace("Just be aware that campaigns are not intended to last forever and you\'re likely to run out of challenges eventually.", "只是要意识到，战役并不是要永远持续下去的，你可能最终会尝尽所有的挑战。");

//holywar_sand_storm_event.nut
	text = text.replace("You come across a troop of men half-buried in sand.", "你遇到一队半埋进沙子的士兵。");
	text = text.replace("Northerners caught in a sandstorm over night.", "北方人，扎营过夜时被卷入沙尘暴。");
	text = text.replace("They\'re writhing in pain, the ones alive at least.", "他们在痛苦中哀嚎，至少还在活着那些。");
	text = text.replace("Some have had their flesh rent from bone, and others are already being picked at by scorpions and buzzards.", "有的人皮开肉绽，而其他的已经在被蝎子与秃鹫啄着。");
	text = text.replace("It seems some have killed themselves.", "看起来有的选择了自杀。");
	text = text.replace("Not one of the souls can be saved, they\'re just clinging on to the end.", "没有一个人可以被拯救，他们只是艰难的扒在终结的边缘。");
	
	text = text.replace("Drawing your sword, you ask the men if they will accept the dignity of a swift death by your steel.", "拔出你的剑，你询问他们是否接受你所给予他们的尊严。");
	text = text.replace("They\'re too parched and starved to speak, but a few nod.", "他们太渴，太饿，难以说话，但是几个人点头了。");
	text = text.replace("One dies before he can even answer.", "其中一个在他能回答前便死去了。");
	text = text.replace("You go to each, crouch, wish them well, and push the sword in.", "你走过每一个人，蹲下，愿他们安息，并将剑推入。");
	text = text.replace("The skin cracks beneath the blade, and the dying men are briefly revivified by the piercing pain, and then they are relinquished from this world.", "皮肤在锋刃下裂开，正在死去的人们因疼痛短暂的恢复一丝活力后便不情愿的离开了这个世界。");
	text = text.replace("A few in the company have varying opinions about this matter.", "队伍里的几个人对此有不同的意见。");
	text = text.replace("You have the sellsword pick up what things they can, though much of the equipment has been laid to waste by the fury of the desert.", "你让佣兵们拿上他们可以带走的，尽管大部分的装备都被狂躁的沙漠损坏了。");
	
	text = text.replace("You order the sellswords to strip the dying men of any useful gear.", "你命令佣兵们从半死不活的士兵们身上扒下任何有用的装备。");
	text = text.replace("The crusaders can only mumble and groan as they are stripped of arms and armor.", "十字军只能随着他们的武器和盔甲被拿走时嘟哝和哀嚎。");
	text = text.replace("Their naked bodies are left to the burning sands, and as you depart with whatever scraps of useful gear the animals of the waste already begin to move in and feed.", "他们身体裸露在灼热的沙漠里，而随着你带着可用的废品离开，荒野上的动物们已经进场开始进食。");
	text = text.replace(/Mixed feelings run through the (.*?) about this decision, but ultimately contentions or support alike stay quiet\./, "对于这一决定 $1 有所争执，但是最终争论与支持都安静了下来。");

//holywar_warnings_event.nut
	text = text.replace("A peasant passes you on the path.", "一个农民在路上从你身边经过。");
	text = text.replace("He mentions off-hand that he doesn\'t understand why gods would have their followers fight each other.", "他漫不经心的提到他无法理解为什么神要让他们的追随者互相战斗。");
	text = text.replace("If it really wanted to be settled, why not do it themselves?", "如果他们真的想解决这件事，为什么不自己上？");
	text = text.replace("You grab him by the shirt and ask what he\'s blathering about. He pulls away.", "你抓住他的衣服并问他在扯些什么。他摆脱开。");
	text = text.replace("Oy! Hands off, or I\'ll nip ya!", "嗨！手拿开，不然我就咔了你！");
	text = text.replace("And I\'m just grousing, thass\'all.", "而且我只是在发牢骚，仅此而已。");
	text = text.replace("Lotta talk going around about the Gilded folk and the followers of the old gods butting heads.", "很多传言说镀金家伙和旧神信徒在对头锤。");
	text = text.replace("Again. Now lemme bitch in peace!", "又一次。现在让我安静会！");
	text = text.replace("The man walks off, mumbling and, ironically, getting louder in volume the further away he gets from you.", "那个人走开了，嘟哝着，讽刺的是，他离你越远，音量就越大。");
	text = text.replace("You come across a congress of Gilded and old gods\' monks alike.", "你遇到了一个镀金者和旧神祗的僧侣还是什么的集会。");
	text = text.replace("They\'re discussing the possibility of an upcoming war, and how to protect themselves if such a time comes to pass.", "他们在讨论一场战争的可能性，以及当它发生时怎么保护自己。");
	text = text.replace("It\'s admirably amicable, all told, but it does seem there\'s a hint of religious reckoning in the air.", "值得欣赏的友善，说真的，不过空气中确实有一股宗教上审判日的气息。");
	text = text.replace("A man fixing a wagon beside the road shakes his head.", "一个在路边修着载重货车的男人摇了摇头。");
	text = text.replace("You know, I\'d just like to go from one spot of the world t\'another, and that be that.", "你知道的，我只想从世界上的这个点走到另一个，仅此而已。");
	text = text.replace("But no. Farking... something!", "但是不，不行。狗日的…玩意！");
	text = text.replace("Always something! Has gotta go wrong.", "总是有什么玩意！总得出状况。");
	text = text.replace("Hey, speaking of wheels, here\'s one I hear turning: the Gilder and the old gods might be knocking heads again.", "嗨，说道轮子，我这里听说个消息：镀金者和旧神祗们又要开始撞头了。");
	text = text.replace("Seen storm clouds of it.", "看到风暴云了吗。");
	text = text.replace("Holy war in the sky.", "是天上的圣战。");
	text = text.replace("Which means holy war here.", "意味着这里也要圣战了。");
	text = text.replace("I hope to get clear of it before it starts.", "我期盼在它开始前离它远点。");
	text = text.replace("You seen the last one? Nasty business.", "你见过上次圣战吗？可不是什么好事。");
	text = text.replace(/You\'re sure it is, but nasty business means good business for the (.*?)\./, "你确认这确实不是好事，但是这种事情也意味着要有活干了 $1。");
	text = text.replace("Knees bothering me.", "膝盖苦恼着我。");
	text = text.replace("You look over to see an old man wiggling two stumps. He grins.", "你看过去看到一个老人摇摆着两个木桩假肢。他笑道。");
	text = text.replace("That is to say, the spirit of my knee is getting ornery.", "这是在说，我膝盖的灵魂在躁动。");
	text = text.replace("When I had m\'legs, the tinge in the knee meant bad weather.", "当我还有腿的时候，膝盖的刺痛意味着坏天气要来了。");
	text = text.replace("Now the twinge in no-knee means something worse.", "现在没有了的膝盖的剧痛意味着什么更糟的东西。");
	text = text.replace("A young boy comes and hauls the elder into a wheelbarrow.", "一个年轻的男孩过来并把老人扶到了手推车上。");
	text = text.replace("Before he departs, you ask what he means.", "在他离开前，你问他在说什么。");
	text = text.replace("He turns aside, elbow cocked and hand planted on his hand, looking dapper and lively for what he is.", "他转向一边，眉头紧皱，手互相紧握，相对于他的实际状况而言看起来些许潇洒和活跃。");
	text = text.replace("A reckoning from above.", "来自天上的审判。");
	text = text.replace("The Gilder, the old gods, maybe even more than just them.", "镀金者，旧神，或许不止他们。");
	text = text.replace("I think they\'re all toying with us, spurring us folk to kill one another to appease them, so they can have a watch.", "我想他们都在调戏我们，策划我们自相残杀来取乐他们，这样他们好有场戏看。");
	text = text.replace("You look the part of a sellsword, so I imagine business will be kind to you once them clerical colors wanna go red.", "你看起来像个佣兵，所以我想当那些圣职者准备让他们的袍子染上血红色时你的生意会很不错。");

//location
//meteorite_enter_event.nut
	text = text.replace("A cataclysm as the world knows it comes from the earth herself.", "一场大灾害在世界上的认知中总是来自大地她本身。");
	text = text.replace("Volcanos, floods, earthquakes, plagues, these are things all men fear.", "火山，洪水，地震，瘟疫，这些事物为所有人所恐惧。");
	text = text.replace("The unwarned issuances that can instantly shatter the greatest of kingdoms and disrobe the royal color from the greatest of kings.", "没有警告的突发事件能够顷刻间粉碎最伟大的王国并扯下最伟大的国王们的王袍。");
	text = text.replace("The great caldera before you, then, stands as a stark reminder that not only are you small, but you might not even know just how small you are: it is quite clear to even the simplest of minds that the enormous rock at the crater\'s center came from above.", "你面前巨大的陨石坑不仅赤裸裸的反衬出你的渺小，还有你渺小的尺度：最愚蠢的人也看得出来陨石坑中心的巨大石头来自上面。");
	text = text.replace("Perhaps, quite very far above.", "或许，相当非常遥远的上面。");
	text = text.replace("Northerners believe it is the coda of the great war of the old gods.", "北方人相信这象征着旧神之间伟大战争的尾声。");
	text = text.replace("It is a literal mountain weaponized by the deities, thrown like a stone from a catapult before landing with such apocalyptic damage that the horrors wrought ceased all heavenly conflict.", "这是一座山字面意义上的被神祗们用来当做武器，像一块石头一样被投石机抛出，落地时的巨大威力有如末日降临，以至于让天堂之战都因为恐怖而终止。");
	text = text.replace("Southerners see it as the \'fiery tear\' of the Gilder.", "南方人则将它看做镀金者的“烈焰之泪”。");
	text = text.replace("Looking down upon a world without man, the God fell into deep sadness and cried upon the earth.", "俯视着一个没有人的世界，神陷入了深深的悲伤而哭泣。");
	text = text.replace("At first He was fearful that he had destroyed all that lay below, but instead He watched as Man drew up from the fires and armored himself in the ashes.", "一开始他害怕他摧毁了下面的一切，但是当他看到人类从火中崛起并以尘为甲时。");
	text = text.replace("And it is then that He knew Man, living in every corner of the earth, was his chosen beings, and Man knew Him.", "他认定居住在大地各个角落的人类是被他选中的存在，而人类也认定了他。");
	text = text.replace("Whatever it is, the crater brings followers and believers from all directions.", "不论如何，陨石坑从世界各地吸引着追随者与信徒。");
	text = text.replace("Here exists an amicable understanding that there shall be no impasses upon one another, though during times of religious war that unspoken agreement is oft shattered.", "这里存在这一种互不相迫的友善共识，尽管在宗教战争时这一不成文的规矩通常是作废的。");

//oracle_enter_event.nut
	text = text.replace("Venturing into the vestibule of the ancient Oracle is like stepping into someone else\'s dream.", "进入神谕所的前厅就好像走入他人的梦境。");
	text = text.replace("Men and women listlessly shift around its pillars, the timid scratch of shoes across stone faintly filling the air, and day or night the architectural curvature brings a pale and somber shadow to its strange halls as though it were permitted eternity beneath the moon herself.", "男人和女人无精打采的在柱子周围来回移动，鞋子擦过石头的细微摩擦声充斥着空气，以及黯淡而阴沉的阴影通过建筑弯曲的穹顶投射在它奇怪的大厅里，不论白天还是黑夜都如同月光下一般。");
	text = text.replace("People of all religions come to the Oracle with a shared sense of awe.", "不同信仰的人们来到神谕所都带有一丝敬畏。");
	text = text.replace("Nobody knows which priestly being once dwelled there, nor what clerical colors they donned.", "没有人知道哪些圣职者曾经居住在这里，亦或者他们袍子的颜色。");
	text = text.replace("Despite these mysteries, many believe that by sleeping inside the Oracle one can harness visions of their own future.", "尽管有诸多秘密，许多人相信通过在神谕所入睡可以看到自己的未来。");
	text = text.replace("An admirable faith to have, though you find it ironic these ethereal meanings must be sought by using the faithful\'s hands and feet to get there.", "一个值得尊敬的信仰，虽然你觉得这些超凡的意义必须通过忠实信徒的手脚才能到达很讽刺。");
	text = text.replace("For now, an impoverished and clustered tent city has glommed onto the Oracle\'s edges.", "眼下，破败拥挤的帐篷城趴在神谕所的边缘。");
	text = text.replace("It is a decrepit end for those who have so buoyed themselves to hope they\'ve made themselves refugees of reality.", "对于那些自认为逃离了凡世的难民而言真是一个暮气沉沉的结局。");

//sunken_library_enter_event.nut
	text = text.replace("The shine and shimmer is so bright you almost think the Gilder Himself has ordained you a proper visit - unfortunately or fortunately, what you\'ve stumbled across is actually a great gilded dome protruding ever so slightly from the sands.", "光与亮如此耀眼以至于你开始认为镀金者他本人授予了你一场正式访问，不幸的或者说幸运的是，实际上是你遇到了一个略微露出沙丘的巨大镀金穹顶。");
	text = text.replace(/Immediately, you test if you can pull some of the gold away, but it has no give\. (.*?) calls you over to a slab of stone which is gapped\./, "很快，你试了试你能不能扒下来一些金子，但是一无所获。$1 把你叫到一块裂开的石板边。");
	text = text.replace("Perhaps a belltower at one point?", "或许这里过去曾经是一座钟塔？");
	text = text.replace("Light fades quick and you can see very little inside.", "光线消散的很快，你看不到多少里面的东西。");
	text = text.replace("Above the entryway a relief depicts men pulling carts of scrolls.", "在进入通道的上方有一片浮雕描绘着人们拉着一车一车的卷轴。");
	text = text.replace("There\'s a set of words repeatedly scrawled across the relief.", "浮雕上有一组文字被反复的刻在上面。");
	text = text.replace("None of the languages look remotely familiar to anything you\'ve ever heard or seen.", "看起来丝毫不像任何你听或看过的语言。");
	text = text.replace("It takes a bit of time until you can find a hurriedly etched translation left by someone approximal to your era: \'the Library, the Labyrinth of the Night, the Labyrinth of the Mind, Leave here as you would Leave a Dream, Tread here as you would Tread a Dream, Leave to Dwell upon the Horror of not Knowing, Enter to be One with Knowing, and in Knowing the Dream, Know the Nightmare\'.", "你花了一些时间才找到了一个更接近你的时代的人仓促刻下的翻译：“图书馆，夜晚的迷宫，思维的迷宫，如同离开梦境一般离开，如同步入梦境一般行走，离开便栖身于未知的恐惧，进入则成为已知的一员，并通过知晓梦境，知晓梦魇”。");
	text = text.replace("Fair bit ominous, captain, but if you wanna go down in there we got the rope and torches to see to it.", "颇为不详啊，队长，但如果你想要下去我们有可以用的绳索与火炬。");
	text = text.replace(/(.*?) tells you this, and the look on his face suggests he\'s hoping you decline the proposition\./, "$1 向你提供了这些话，还有他希望你会拒绝这个提案的表情。");
	
	text = text.replace("The climb down is a perilous one, the dark so thick you can\'t even see your own boots.", "向下的路程非常的危险，黑暗如此厚重你甚至看不到你自己的靴子。");
	text = text.replace("But eventually you hit a marbled floor and quickly light up some torches.", "但是最终你踩到了大理石地板并快速的点亮了一些火炬。");
	text = text.replace("You find yourself in a massive hall around which spiral rows and rows of bookcases.", "你发现自己在一个充满了一排又一排螺旋状书柜的巨大大厅内。");
	text = text.replace("Every shelf is adorned with piles of scrolls, many dwelling within glass enclosures.", "每一个书柜都有成堆的卷轴，许多被封存在玻璃罐中。");
	text = text.replace("The shelves are stacked upon each other and seem to ascend to the very ceiling from which you descended.", "书柜彼此堆叠在一起看起来好像高耸到你降下来的天花板一般。");
	text = text.replace("Rolling ladders rest at each level, but even further up runs a floating mezzanine with metal chutes stationed here and there.", "每一层都放着楼梯，但是更高的地方时不时停着一个带着金属溜道的悬浮夹层。");
	text = text.replace("It seems as though once upon a time one was meant to pass these scrolls up and down, though now everything is rusted, and the mezzanine has collapsed in parts.", "看起来好像过去可以通过这些把卷轴传上传下，尽管现在一切都锈了，夹层也有部分塌了。");
	text = text.replace(/(.*?) calls your attention\./, "$1 寻求你的注意。");
	text = text.replace("He points to an enormous scroll flattened behind a sheet of glass.", "他指向一个被压平在一层玻璃后的巨大卷轴。");
	text = text.replace("Drawings sprawl over the paper, and upon closer inspection it appears they are blueprints for seemingly everything: the human body, the bodies of many animals, castles, towers, windmills, ships, weapons and armor, boots and gloves, alignments of the stars, and a great number of drawings of things which you have never seen before, things which don\'t make sense.", "纸上到处都是绘画，在更仔细的观察后看起来他们好像是一切的蓝图：人体，许多动物的身体，城堡，塔，风车磨坊，船只，武器有盔甲，靴子与手套，行星的排列，还有很多你从没见过的东西的绘画，毫不合理的东西。");
	text = text.replace("Captain, this place is not meant for us.", "队长，这个地方不是我们该来的。");
	text = text.replace("The languages, the halls, we should go.", "这语言，这长廊，我们应该离开这里。");
	text = text.replace("One of the sellswords expresses the mood in the air.", "一个佣兵表达了空气中弥漫的情绪。");
	text = text.replace("You have absolutely trespassed to a place few have gone before.", "你显然擅自进入了一个很少人来过的地方。");
	text = text.replace("And if they have gone before, where are they?", "如果有人曾经来过，他们现在在哪？");
	text = text.replace("A place like this surely can\'t stay hidden, right?", "这样一个地方显然不可能就这么藏起来，对吗？");
	
	text = text.replace("Interlopers in the Library.", "图书馆中有闯入者。");
	text = text.replace("The voice scratches along the marbled floor and rises up to meet your ears and continues on, the word \'Libraryyy\' slithering into the dark behind you.", "声音在大理石地板上摩擦着挺起身来靠近你的耳朵，“图书馆”一词滑入你背后的黑暗。");
	text = text.replace("Suddenly, a number of the glass cases begin to glow, the phylacteries holding some sort of ethereal energy, and as the light widens it unveils the torso of a black skeleton, its body captured in air.", "突然，数副玻璃柜开始发光，其中的护符存放着某种超自然的能量，并且随着光的扩散映照出了一副黑色骷髅的身躯，它的身躯被捕获在半空中。");
	text = text.replace("The ribcage holds a book, hooked into place by the sickly folds of its own ribs as a spider would clutch a meal.", "胸骨中有一本书，扭曲的肋骨包裹着它如同一只蜘蛛抓住它的食物一般。");
	text = text.replace("The skull of the creature stares at you with peerless sockets.", "这个生物用空洞的眼眶注视着你。");
	text = text.replace("Your kind has already stolen from me, now you dare profane these halls again?", "你们之类曾经对我行窃过，现在你还敢再次亵渎这些长廊？");
	text = text.replace("The phylacteries grow brighter and in turn the skeleton\'s torso grows flesh, weeds of vein and the pulp of skin blossoming outward to cover bone.", "护符发出的光越发闪亮，同时骷髅的身躯开始长出血肉，血管与皮肤绽放出来包裹住骨头。");
	text = text.replace("But it is only the torso which is ensconced.", "但只有躯干是稳定的。");
	text = text.replace("You stare at the phylacteries and they are brimming with energy now, and in staring you can see the ghostly faces smearing along the glass like streaks of rain.", "你看向那些护符，他们现在充满了能量，你可以看到鬼魅般的面孔如同雨水般抹过封存他们的玻璃。");
	text = text.replace("You hear a loud clap and turn back to see the Loremaster in full, its eyes aflame with white fire, its limbs skinny yet with smoky muscles winding around its frame, and its lower half is pluming with black ash as it glides forward.", "你听到一声响亮的击掌，转过身来你看到了博学士，重归完整，它的眼中冒出白色的火焰，它干瘦的四肢上烟雾缭绕的肌肉缠绕着火焰，在它的下半身黑色的灰烬随着它滑翔向前而喷出。");
	text = text.replace("The brighter the glass bulbs get, the stronger and faster it becomes!", "随着灯泡越来越亮，他正变得越来越强，越来越快！");
	
	text = text.replace("The Lorekeeper collapses onto the ground a pile of ash and the phylacteries slowly fade back to dark.", "博学者倒下化作了一堆灰，护符慢慢黯淡。");
	text = text.replace("You walk over with torch in hand.", "你拿着火炬走过去。");
	text = text.replace("Its black skull resides atop the book that once dwelled in its chest.", "它的黑色头骨置于那本之前在胸口的书上面。");
	text = text.replace("Captain, I don\'t think we should be touching anything here.", "队长，我不认为我们应该碰这里的任何东西。");
	text = text.replace("You ignore one of your men and pick the book up.", "你无视了你的手下并捡起了书。");
	text = text.replace("Its leather covering is stitched together, and as you look closer you can see the flesh of ears and noses encompassing the cover.", "它的封面是被缝在一起的某种皮革，随着你更仔细的观察你可以看到耳与鼻的血肉包裹着封面。");
	text = text.replace("Immediately, the bones of the slain undead scratch across the marbled floor.", "马上，被击倒的亡灵的尸骨擦过大理石地板。");
	text = text.replace("One zips between your legs and flies into the pile of ash.", "一闪而过你的腿间并飞入一堆灰尘。");
	text = text.replace("A dull white fire alights inside the socket of the skull.", "阴沉的白火从头骨的眼眶中亮起。");
	text = text.replace("That\'s more than enough for you: with a quick command, you get the men to climb back up the rope, yourself the last to leave.", "对你而言这足够明显了：你快速下令，让手下们用绳索爬回去，你断后。");
	text = text.replace("As you near the light of the earth above, you take one moment to stare back down and - the black skull is already in your face!", "随着你接近地表的亮光，你向下回望去－那个头骨正贴在你脸上！");
	text = text.replace("It floats alone, eyes burning white, capturing your sight in a cone of fire you cannot understand, and as you stare into it you can hear the voices of your men fade away.", "它独自飘着，眼中发出白火，将你的视线用你无法理解的火焰覆盖，随着你看着这火，只觉着你手下的声音越来越远。");
	text = text.replace("The skull floats alone, and you almost feel the urge to let the rope go.", "头骨飘在那，而你几乎感到一股放开绳索的冲动。");
	text = text.replace("The skull speaks to your mind:", "头骨直接向你的思维说道：");
	text = text.replace("It is but one of its gifts, Interloper, and you are not the first to have it.", "这只不过是它的礼物中的一个，入侵者，而你也不是第一个获得它的人。");
	text = text.replace("There is many who have taken it, and in the many there is but one end, the one who awaits us all!", "许多人都曾占有过它，这许多人都只有一个结局，一个等着我们所有人的结局！");
	text = text.replace("The skull\'s fire snuffs out and it drops away into the dark where you hear a brief clatter.", "头骨的火焰熄灭了后便掉入了黑暗中，只听得一声短暂的咔嗒声。");
	text = text.replace(/The voices of your men rush back in, louder than ever and you look up to see (.*?)\'s hand\./, "你手下的呼声重新涌入，比以往更加洪亮，你抬头看到了 $1的手。");
	text = text.replace("Grabbing hold, they pull you out.", "紧抓着手，他们把你拉了出来。");
	text = text.replace("As you exit, the entrance sinks into the sand, and all you have of the place is a strange, fleshen book filled with writings you cannot ever hope to decipher.", "随着你出来，入口陷入了沙子，只剩你手上一本怪异的血肉之书，其中的文字你甚至无法想象从何开始解读。");
	
	text = text.replace("The men run and hastily climb up again.", "伙计们匆忙的再次开始往上爬。");
	text = text.replace("Perhaps another time?", "或许下一次？");
	text = text.replace(/One sellsword says. (.*?) nods\./, "一个佣兵说着。$1 点头。");
	text = text.replace("Another time, aye. Maybe a time far away from now, when I\'m out retired and farkin\' whoors, then y\'all can dip down into the darkness and go gallivanting with dead wizards.", "是的，下次吧。或许很久以后，等我他妈的退休了，到时候你们可以再下到里面去跟那帮死巫师寻欢作乐。");
	text = text.replace("Does that time work for y\'all?", "这个时间对你们都合适吗？");

//vulcano_enter_event.nut
	text = text.replace("Empire\'s End. Metropolis of Ash. The Annihilation.", "帝国的终点。尘埃之城。大灭绝。");
	text = text.replace("Whatever its name, the ancient city is now a vast grey ruin.", "不论怎么称呼它，这座古老的城市现在只是一片广阔的灰色遗迹。");
	text = text.replace("It sits beneath a mountain missing a peak, its once glorious shape obliterated in an enormous eruption.", "它坐落在一座没有山峰的山脊下，曾经的荣光在一场巨大的喷发中湮灭。");
	text = text.replace("The explosion hit with such violence that shockwaves unfurled cobbled streets and sent the bricks showering over the city proper.", "爆炸的威力是如此巨大，以至于冲击波使圆石铺成的街道崩开，送上天的砖块如下雨一般洒落在城市上。");
	text = text.replace("Enormous granitic boulders cratered neighborhoods whole and boiling debris vaporized all in its way.", "庞大的花岗岩石块让街区变为弹坑，沸腾的石流蒸发着路上经过的一切。");
	text = text.replace("The flow of lava came last, smoldering much of the city in a black sludge, the edges of which pillowed and toed in bulbous contours until it looked as though a cloud of black smoke had solidified.", "流动的岩浆在最后到来，将大部分的城市烧成一滩黑色的烂泥，缓慢爬行的岩浆边缘呈一种难看的圆弧轮廓，直到它看起来就好像一片黑烟固化了一般。");
	text = text.replace("It is a horrid sight to behold, in part because the earthen rage also captured many victims in perpetuity: grey casts of ancient humans still stand to this day, posed in manners most lively like pairs shaking hands, one looking over a stove, another petting a dog.", "这是一幅可怕的景象，部分是因为大地的怒火将许多受害者困在了永恒的静止之中：古代人类的灰色模具至今耸立着，维持着鲜活的姿势，比如一对夫妇在握手，一个人在照看着灶台，另一个在抚摸一只狗。");
	text = text.replace("Of course, it is wholly within man\'s nature to see such relics of destruction and, distant as they are from its reality, flock to its remains, and vicariously revivify the violence through means of faith.", "当然，对人而言很自然而然的会看到这样一座毁灭的遗迹，尽管距离遥远，但他们聚集到它的遗骸，并通过信仰替代性的给与这一暴行新生。");
	text = text.replace("Followers of the Gilder see it as a warning to not fall for profligacy and greed.", "镀金者的追随者们将它看做一个警告，以使他们远离浪费与贪婪。");
	text = text.replace("Northerners see it as a clash between old gods, a rarity since the dawn of man.", "北方人则将它看做旧神间的交锋，从人类诞生至今罕见的。");
	text = text.replace("One faith or the other, both reside here in mutual respect for those whose lives were lost... respectful for now, at least.", "不论哪个宗教，都共同地在这里向失去生命的人致敬…至少，目前，还保持着敬意。");

	text = text.replace("With the \'Anatomists\' origin, defeating new enemies grants potions that mutate your men and grant them special abilities.","“解剖学者”的起源，击败新的敌人授予药水变异你的人，并赋予他们特殊的能力");
			
	text = text.replace("With the \'Oathtakers\' origin, instead of ambitions you\'ll pick oaths that grant special boons and burdens.","“宣誓者”的起源，而不是野心，你会选择誓言赋予特殊的繁荣和负担");
	return text;
}
