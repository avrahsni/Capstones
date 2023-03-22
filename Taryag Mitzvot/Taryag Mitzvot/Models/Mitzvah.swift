//
//  Mitzvah.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/3/23.
//

import Foundation

struct Mitzvah: Hashable {
    let title: String
    let engText: String
    let hebText: String
    let verse: String
    var tags: [String]
    
    init(title: String, engText: String, hebText: String, verse: String, tags: [String]) {
        self.title = title
        self.engText = engText
        self.hebText = hebText
        self.verse = verse
        self.tags = tags
    }
    
    static func addMitzvot() -> [Mitzvah] {
        return [
            Mitzvah(title: "Know there is a God", engText: "I am the Lord, your God, Who took you out of the land of Egypt, out of the house of bondage.", hebText: "אָֽנֹכִ֨י יְהֹוָ֣ה אֱלֹהֶ֔יךָ אֲשֶׁ֣ר הֽוֹצֵאתִ֩יךָ֩ מֵאֶ֨רֶץ מִצְרַ֜יִם מִבֵּ֣ית עֲבָדִ֗ים:", verse: "Shemot 20:2", tags: ["Ten Commandments", "Positive", "Applicable"]),
            Mitzvah(title: "Do not have other gods before the Lord", engText: "You shall not have the gods of others in My presence.", hebText: "לֹ֣א יִֽהְיֶ֣ה־לְךָ֩ אֱלֹהִ֨ים אֲחֵרִ֜ים עַל־פָּנַ֗י:", verse: "Shemot 20:3", tags: ["Ten Commandments", "Idolatry", "Negative", "Applicable"]),
            Mitzvah(title: "Know the Lord is one", engText: "Hear, O Israel: The Lord is our God; the Lord is one.", hebText: "שְׁמַ֖ע יִשְׂרָאֵ֑ל יְהֹוָ֥ה אֱלֹהֵ֖ינוּ יְהֹוָ֥ה | אֶחָֽד:", verse: "Devarim 6:4", tags: ["Prayer", "Positive", "Idolatry", "Applicable"]),
            Mitzvah(title: "Love the Lord", engText: "And you shall love the Lord, your God, with all your heart and with all your soul, and with all your means.", hebText: "וְאָ֣הַבְתָּ֔ אֵ֖ת יְהֹוָ֣ה אֱלֹהֶ֑יךָ בְּכָל־לְבָֽבְךָ֥ וּבְכָל־נַפְשְׁךָ֖ וּבְכָל־מְאֹדֶֽךָ:", verse: "Devarim 6:5", tags: ["Prayer", "Relation to God", "Positive", "Applicable"]),
            Mitzvah(title: "Fear the Lord", engText: "You shall fear the Lord, your God, worship Him, and cleave to Him and swear by His Name.", hebText: "אֶת־יְהֹוָ֧ה אֱלֹהֶ֛יךָ תִּירָ֖א אֹת֣וֹ תַֽעֲבֹ֑ד וּב֣וֹ תִדְבָּ֔ק וּבִשְׁמ֖וֹ תִּשָּׁבֵֽעַ:", verse: "Devarim 10:20", tags: ["Relation to God", "Positive", "Applicable"]),
            Mitzvah(title: "Sanctify the name of the Lord", engText: "You shall not desecrate My Holy Name. I shall be sanctified amidst the children of Israel. I am the Lord Who sanctifies you", hebText: "וְלֹ֤א תְחַלְּלוּ֙ אֶת־שֵׁ֣ם קָדְשִׁ֔י וְנִ֨קְדַּשְׁתִּ֔י בְּת֖וֹךְ בְּנֵ֣י יִשְׂרָאֵ֑ל אֲנִ֥י יְהֹוָ֖ה מְקַדִּשְׁכֶֽם", verse: "Vayikra 22:32", tags: ["Speech", "Positive", "Applicable"]),
            Mitzvah(title: "Don't profane the name of the Lord", engText: "You shall not desecrate My Holy Name. I shall be sanctified amidst the children of Israel. I am the Lord Who sanctifies you", hebText: "וְלֹ֤א תְחַלְּלוּ֙ אֶת־שֵׁ֣ם קָדְשִׁ֔י וְנִ֨קְדַּשְׁתִּ֔י בְּת֖וֹךְ בְּנֵ֣י יִשְׂרָאֵ֑ל אֲנִ֥י יְהֹוָ֖ה מְקַדִּשְׁכֶֽם", verse: "Vayikra 22:32", tags: ["Speech", "Blasphemy", "Negative", "Applicable"]),
            Mitzvah(title: "Do not destroy objects associated with the name of the Lord", engText: "And you shall tear down their altars, smash their monuments, burn their asherim with fire, cut down the graven images of their gods, and destroy their name from that place. 4You shall not do so to the Lord, your God.", hebText: "וְנִתַּצְתֶּ֣ם אֶת־מִזְבְּחֹתָ֗ם וְשִׁבַּרְתֶּם֙ אֶת־מַצֵּ֣בֹתָ֔ם וַֽאֲשֵֽׁרֵיהֶם֙ תִּשְׂרְפ֣וּן בָּאֵ֔שׁ וּפְסִילֵ֥י אֱלֹֽהֵיהֶ֖ם תְּגַדֵּע֑וּן וְאִבַּדְתֶּ֣ם אֶת־שְׁמָ֔ם מִן־הַמָּק֖וֹם הַהֽוּא: ד לֹא־תַֽעֲשׂ֣וּן כֵּ֔ן לַֽיהֹוָ֖ה אֱלֹֽהֵיכֶֽם", verse: "Devarim 12:3-4", tags: ["Negative", "Applicable"]),
            Mitzvah(title: "Listen to the prophet speaking in God's name", engText: "A prophet from among you, from your brothers, like me, the Lord, your God will set up for you; you shall hearken to him. 16 According to all that you asked of the Lord, your God, in Horeb, on the day of the assembly, saying, \"Let me not continue to hear the voice of the Lord, my God, and let me no longer see this great fire, so that I will not die.\" 17 And the Lord said to me, \"They have done well in what they have spoken.\" 18 I will set up a prophet for them from among their brothers like you, and I will put My words into his mouth, and he will speak to them all that I command him.", hebText: "נָבִ֨יא מִקִּרְבְּךָ֤ מֵֽאַחֶ֨יךָ֙ כָּמֹ֔נִי יָקִ֥ים לְךָ֖ יְהֹוָ֣ה אֱלֹהֶ֑יךָ אֵלָ֖יו תִּשְׁמָעֽוּן: כְּכֹ֨ל אֲשֶׁר־שָׁאַ֜לְתָּ מֵעִ֨ם יְהֹוָ֤ה אֱלֹהֶ֨יךָ֙ בְּחֹרֵ֔ב בְּי֥וֹם הַקָּהָ֖ל לֵאמֹ֑ר לֹ֣א אֹסֵ֗ף לִשְׁמֹ֨עַ֙ אֶת־קוֹל֙ יְהֹוָ֣ה אֱלֹהָ֔י וְאֶת־הָאֵ֨שׁ הַגְּדֹלָ֥ה הַזֹּ֛את לֹֽא־אֶרְאֶ֥ה ע֖וֹד וְלֹ֥א אָמֽוּת: וַיֹּ֥אמֶר יְהֹוָ֖ה אֵלָ֑י הֵיטִ֖יבוּ אֲשֶׁ֥ר דִּבֵּֽרוּ: נָבִ֨יא אָקִ֥ים לָהֶ֛ם מִקֶּ֥רֶב אֲחֵיהֶ֖ם כָּמ֑וֹךָ וְנָֽתַתִּ֤י דְבָרַי֙ בְּפִ֔יו וְדִבֶּ֣ר אֲלֵיהֶ֔ם אֵ֖ת כָּל־אֲשֶׁ֥ר אֲצַוֶּֽנּוּ: וְהָיָ֗ה הָאִישׁ֙ אֲשֶׁ֤ר לֹֽא־יִשְׁמַע֙ אֶל־דְּבָרַ֔י אֲשֶׁ֥ר יְדַבֵּ֖ר בִּשְׁמִ֑י אָֽנֹכִ֖י אֶדְר֥שׁ מֵֽעִמּֽוֹ:", verse: "Devarim 18:15-18", tags: ["Not Applicable"]),
            Mitzvah(title: "Do not unduly test the prophet", engText: "You shall not try the Lord, your God, as you tried Him in Massah.", hebText: "לֹ֣א תְנַסּ֔וּ אֶת־יְהֹוָ֖ה אֱלֹֽהֵיכֶ֑ם כַּֽאֲשֶׁ֥ר נִסִּיתֶ֖ם בַּמַּסָּֽה:", verse: "Devarim 6:16", tags: ["Negative", "Applicable"]),
            Mitzvah(title: "Emulate the ways of the Lord", engText: "The Lord will establish you as His holy people as He swore to you, if you observe the commandments of the Lord, your God, and walk in His ways.", hebText: "יְקִֽימְךָ֙ יְהֹוָ֥ה לוֹ֙ לְעַ֣ם קָד֔וֹשׁ כַּֽאֲשֶׁ֖ר נִשְׁבַּע־לָ֑ךְ כִּ֣י תִשְׁמֹ֗ר אֶת־מִצְו‍ֹת֙ יְהֹוָ֣ה אֱלֹהֶ֔יךָ וְהָֽלַכְתָּ֖ בִּדְרָכָֽיו:", verse: "Devarim 28:9", tags: ["Positive", "Applicable"]),
            Mitzvah(title: "Cleave to God", engText: "You shall fear the Lord, your God, worship Him, and cleave to Him and swear by His Name.", hebText: "אֶת־יְהֹוָ֧ה אֱלֹהֶ֛יךָ תִּירָ֖א אֹת֣וֹ תַֽעֲבֹ֑ד וּב֣וֹ תִדְבָּ֔ק וּבִשְׁמ֖וֹ תִּשָּׁבֵֽעַ:", verse: "Devarim 10:20", tags: ["Positive", "Applicable"]),
            Mitzvah(title: "Love your fellow Jews", engText: "You shall neither take revenge from nor bear a grudge against the members of your people; you shall love your neighbor as yourself. I am the Lord.", hebText: "לֹֽא־תִקֹּ֤ם וְלֹֽא־תִטֹּר֙ אֶת־בְּנֵ֣י עַמֶּ֔ךָ וְאָֽהַבְתָּ֥ לְרֵֽעֲךָ֖ כָּמ֑וֹךָ אֲנִ֖י יְהוָֹֽה:", verse: "Vayikra 19:18", tags: ["Positive", "Applicable"]),
            Mitzvah(title: "Love the converts", engText: "You shall love the stranger, for you were strangers in the land of Egypt.", hebText: "וַֽאֲהַבְתֶּ֖ם אֶת־הַגֵּ֑ר כִּֽי־גֵרִ֥ים הֱיִיתֶ֖ם בְּאֶ֥רֶץ מִצְרָֽיִם:", verse: "Devarim 10:19", tags: ["Positive", "Applicable"]),
            Mitzvah(title: "Do not hate your fellow Jew", engText: "You shall not hate your brother in your heart. You shall surely rebuke your fellow, but you shall not bear a sin on his account.", hebText: "לֹֽא־תִשְׂנָ֥א אֶת־אָחִ֖יךָ בִּלְבָבֶ֑ךָ הוֹכֵ֤חַ תּוֹכִ֨יחַ֙ אֶת־עֲמִיתֶ֔ךָ וְלֹֽא־תִשָּׂ֥א עָלָ֖יו חֵֽטְא:", verse: "Vayikra 19:17", tags: ["Negative", "Applicable"]),
            Mitzvah(title: "Rebuke wrongdoers", engText: "You shall not hate your brother in your heart. You shall surely rebuke your fellow, but you shall not bear a sin on his account.", hebText: "לֹֽא־תִשְׂנָ֥א אֶת־אָחִ֖יךָ בִּלְבָבֶ֑ךָ הוֹכֵ֤חַ תּוֹכִ֨יחַ֙ אֶת־עֲמִיתֶ֔ךָ וְלֹֽא־תִשָּׂ֥א עָלָ֖יו חֵֽטְא:", verse: "Vayikra 19:17", tags: ["Positive", "Applicable", "Speech"]),
            Mitzvah(title: "Do not embarrass others", engText: "You shall not hate your brother in your heart. You shall surely rebuke your fellow, but you shall not bear a sin on his account.", hebText: "לֹֽא־תִשְׂנָ֥א אֶת־אָחִ֖יךָ בִּלְבָבֶ֑ךָ הוֹכֵ֤חַ תּוֹכִ֨יחַ֙ אֶת־עֲמִיתֶ֔ךָ וְלֹֽא־תִשָּׂ֥א עָלָ֖יו חֵֽטְא:", verse: "Vayikra 19:17", tags: ["Applicable", "Negative", "Speech", "Lashon HaRa"]),
            Mitzvah(title: "Do not oppress the weak", engText: "You shall not oppress any widow or orphan.", hebText: "כָּל־אַלְמָנָ֥ה וְיָת֖וֹם לֹ֥א תְעַנּֽוּן:", verse: "Shemot 22:21", tags: ["Negative", "Applicable", "Children"]),
            Mitzvah(title: "Do not gossip", engText: "You shall not go around as a gossipmonger amidst your people. You shall not stand by [the shedding of] your fellow's blood. I am the Lord.", hebText: "לֹֽא־תֵלֵ֤ךְ רָכִיל֙ בְּעַמֶּ֔יךָ לֹ֥א תַֽעֲמֹ֖ד עַל־דַּ֣ם רֵעֶ֑ךָ אֲנִ֖י יְהוָֹֽה:", verse: "Vayikra 19:16", tags: ["Applicable", "Negative", "Speech", "Lashon HaRa"]),
            Mitzvah(title: "Do not take revenge", engText: "You shall neither take revenge from nor bear a grudge against the members of your people; you shall love your neighbor as yourself. I am the Lord.", hebText: "לֹֽא־תִקֹּ֤ם וְלֹֽא־תִטֹּר֙ אֶת־בְּנֵ֣י עַמֶּ֔ךָ וְאָֽהַבְתָּ֥ לְרֵֽעֲךָ֖ כָּמ֑וֹךָ אֲנִ֖י יְהוָֹֽה:", verse: "Vayikra 19:18", tags: ["Negative", "Applicable"]),
            Mitzvah(title: "Do not keep grudges", engText: "You shall neither take revenge from nor bear a grudge against the members of your people; you shall love your neighbor as yourself. I am the Lord.", hebText: "לֹֽא־תִקֹּ֤ם וְלֹֽא־תִטֹּר֙ אֶת־בְּנֵ֣י עַמֶּ֔ךָ וְאָֽהַבְתָּ֥ לְרֵֽעֲךָ֖ כָּמ֑וֹךָ אֲנִ֖י יְהוָֹֽה:", verse: "Vayikra 19:18", tags: ["Negative", "Applicable"]),
            Mitzvah(title: "Learn and teach Torah", engText: "And you shall teach them to your sons and speak of them when you sit in your house, and when you walk on the way, and when you lie down and when you rise up.", hebText: "וְשִׁנַּנְתָּ֣ם לְבָנֶ֔יךָ וְדִבַּרְתָּ֖ בָּ֑ם בְּשִׁבְתְּךָ֤ בְּבֵיתֶ֨ךָ֙ וּבְלֶכְתְּךָ֣ בַדֶּ֔רֶךְ וּבְשָׁכְבְּךָ֖ וּבְקוּמֶֽךָ:", verse: "Devarim 6:7", tags: ["Positive", "Applicable", "Prayer", "Speech", "Children"]),
            Mitzvah(title: "Venerate the elderly and those who know and teach Torah", engText: "You shall rise before a venerable person and you shall respect the elderly, and you shall fear your God. I am the Lord.", hebText: "מִפְּנֵ֤י שֵׂיבָה֙ תָּק֔וּם וְהָֽדַרְתָּ֖ פְּנֵ֣י זָקֵ֑ן וְיָרֵ֥אתָ מֵּֽאֱלֹהֶ֖יךָ אֲנִ֥י יְהוָֹֽה:", verse: "Vayikra 19:32", tags: ["Positive", "Applicable"]),
            Mitzvah(title: "Do not turn to idols", engText: "You shall not turn to the worthless idols, nor shall you make molten deities for yourselves. I am the Lord, your God.", hebText: "אַל־תִּפְנוּ֙ אֶל־הָ֣אֱלִילִ֔ם וֵֽאלֹהֵי֙ מַסֵּכָ֔ה לֹ֥א תַֽעֲשׂ֖וּ לָכֶ֑ם אֲנִ֖י יְהוָֹ֥ה אֱלֹֽהֵיכֶֽם:", verse: "Vayikra 19:4", tags: ["Applicable", "Negative", "Idolatry"])
        ]
    }
    
    enum Filter {
        case positive, negative, prayer, tenCommandments, passover, sukkot, roshHaShana, yomKippur, speech, blasphemy, lashonHaRa, shavuot, business, intimateRelations, forbiddenRelations, idolatry, kashrut, robbery, assault, children, courts, holidays, shabbat, levitical, holyTemple, conquest, applicable, unApplicable
    }
    
    static let filters = ["Positive", "Negative", "Prayer", "Ten Commandments", "Passover", "Sukkot", "Rosh HaShanah", "Yom Kippur", "Speech", "Blasphemy", "Lashon HaRa", "Shavuot", "Business", "Intimate Relations", "Forbidden Relations", "Idolatry", "Kashrut", "Robbery", "Assault", "Children", "Courts", "Holidays", "Shabbat", "Levitical", "Holy Temple", "Conquest", "Applicable", "Not Applicable"]
    
}
