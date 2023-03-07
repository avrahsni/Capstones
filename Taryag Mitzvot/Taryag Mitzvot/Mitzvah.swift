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
            Mitzvah(title: "Know there is a God", engText: "I am the Lord, your God, Who took you out of the land of Egypt, out of the house of bondage.", hebText: "אָֽנֹכִ֨י יְהֹוָ֣ה אֱלֹהֶ֔יךָ אֲשֶׁ֣ר הֽוֹצֵאתִ֩יךָ֩ מֵאֶ֨רֶץ מִצְרַ֜יִם מִבֵּ֣ית עֲבָדִ֗ים:", verse: "Shemot 20:2", tags: ["Ten Commandments", "Positive"]),
            Mitzvah(title: "Do not have other gods before the Lord", engText: "You shall not have the gods of others in My presence.", hebText: "לֹ֣א יִֽהְיֶ֣ה־לְךָ֩ אֱלֹהִ֨ים אֲחֵרִ֜ים עַל־פָּנַ֗י:", verse: "Shemot 20:3", tags: ["Ten Commandments", "Idolatry", "Negative"]),
            Mitzvah(title: "Know the Lord is one", engText: "Hear, O Israel: The Lord is our God; the Lord is one.", hebText: "שְׁמַ֖ע יִשְׂרָאֵ֑ל יְהֹוָ֥ה אֱלֹהֵ֖ינוּ יְהֹוָ֥ה | אֶחָֽד:", verse: "Devarim 6:4", tags: ["Prayer", "Positive", "Idolatry"]),
            Mitzvah(title: "Love the Lord", engText: "And you shall love the Lord, your God, with all your heart and with all your soul, and with all your means.", hebText: "וְאָ֣הַבְתָּ֔ אֵ֖ת יְהֹוָ֣ה אֱלֹהֶ֑יךָ בְּכָל־לְבָֽבְךָ֥ וּבְכָל־נַפְשְׁךָ֖ וּבְכָל־מְאֹדֶֽךָ:", verse: "Devarim 6:5", tags: ["Prayer", "Relation to God", "Positive"]),
            Mitzvah(title: "Fear the Lord", engText: "You shall fear the Lord, your God, worship Him, and cleave to Him and swear by His Name.", hebText: "אֶת־יְהֹוָ֧ה אֱלֹהֶ֛יךָ תִּירָ֖א אֹת֣וֹ תַֽעֲבֹ֑ד וּב֣וֹ תִדְבָּ֔ק וּבִשְׁמ֖וֹ תִּשָּׁבֵֽעַ:", verse: "Devarim 10:20", tags: ["Relation to God", "Positive"]),
            Mitzvah(title: "Sanctify the name of the Lord", engText: "You shall not desecrate My Holy Name. I shall be sanctified amidst the children of Israel. I am the Lord Who sanctifies you", hebText: "וְלֹ֤א תְחַלְּלוּ֙ אֶת־שֵׁ֣ם קָדְשִׁ֔י וְנִ֨קְדַּשְׁתִּ֔י בְּת֖וֹךְ בְּנֵ֣י יִשְׂרָאֵ֑ל אֲנִ֥י יְהֹוָ֖ה מְקַדִּשְׁכֶֽם", verse: "Vayikra 22:32", tags: ["Speech", "Positive"]),
            Mitzvah(title: "Don't profane the name of the Lord", engText: "You shall not desecrate My Holy Name. I shall be sanctified amidst the children of Israel. I am the Lord Who sanctifies you", hebText: "וְלֹ֤א תְחַלְּלוּ֙ אֶת־שֵׁ֣ם קָדְשִׁ֔י וְנִ֨קְדַּשְׁתִּ֔י בְּת֖וֹךְ בְּנֵ֣י יִשְׂרָאֵ֑ל אֲנִ֥י יְהֹוָ֖ה מְקַדִּשְׁכֶֽם", verse: "Vayikra 22:32", tags: ["Speech", "Blasphemy", "Negative"]),
            Mitzvah(title: "Do not destroy objects associated with the name of the Lord", engText: "And you shall tear down their altars, smash their monuments, burn their asherim with fire, cut down the graven images of their gods, and destroy their name from that place. 4You shall not do so to the Lord, your God.", hebText: "וְנִתַּצְתֶּ֣ם אֶת־מִזְבְּחֹתָ֗ם וְשִׁבַּרְתֶּם֙ אֶת־מַצֵּ֣בֹתָ֔ם וַֽאֲשֵֽׁרֵיהֶם֙ תִּשְׂרְפ֣וּן בָּאֵ֔שׁ וּפְסִילֵ֥י אֱלֹֽהֵיהֶ֖ם תְּגַדֵּע֑וּן וְאִבַּדְתֶּ֣ם אֶת־שְׁמָ֔ם מִן־הַמָּק֖וֹם הַהֽוּא: ד לֹא־תַֽעֲשׂ֣וּן כֵּ֔ן לַֽיהֹוָ֖ה אֱלֹֽהֵיכֶֽם", verse: "Devarim 12:3-4", tags: ["Negative"]),
            Mitzvah(title: "Listen to the prophet speaking in God's name", engText: "A prophet from among you, from your brothers, like me, the Lord, your God will set up for you; you shall hearken to him. 16 According to all that you asked of the Lord, your God, in Horeb, on the day of the assembly, saying, \"Let me not continue to hear the voice of the Lord, my God, and let me no longer see this great fire, so that I will not die.\" 17 And the Lord said to me, \"They have done well in what they have spoken.\" 18 I will set up a prophet for them from among their brothers like you, and I will put My words into his mouth, and he will speak to them all that I command him.", hebText: "נָבִ֨יא מִקִּרְבְּךָ֤ מֵֽאַחֶ֨יךָ֙ כָּמֹ֔נִי יָקִ֥ים לְךָ֖ יְהֹוָ֣ה אֱלֹהֶ֑יךָ אֵלָ֖יו תִּשְׁמָעֽוּן: כְּכֹ֨ל אֲשֶׁר־שָׁאַ֜לְתָּ מֵעִ֨ם יְהֹוָ֤ה אֱלֹהֶ֨יךָ֙ בְּחֹרֵ֔ב בְּי֥וֹם הַקָּהָ֖ל לֵאמֹ֑ר לֹ֣א אֹסֵ֗ף לִשְׁמֹ֨עַ֙ אֶת־קוֹל֙ יְהֹוָ֣ה אֱלֹהָ֔י וְאֶת־הָאֵ֨שׁ הַגְּדֹלָ֥ה הַזֹּ֛את לֹֽא־אֶרְאֶ֥ה ע֖וֹד וְלֹ֥א אָמֽוּת: וַיֹּ֥אמֶר יְהֹוָ֖ה אֵלָ֑י הֵיטִ֖יבוּ אֲשֶׁ֥ר דִּבֵּֽרוּ: נָבִ֨יא אָקִ֥ים לָהֶ֛ם מִקֶּ֥רֶב אֲחֵיהֶ֖ם כָּמ֑וֹךָ וְנָֽתַתִּ֤י דְבָרַי֙ בְּפִ֔יו וְדִבֶּ֣ר אֲלֵיהֶ֔ם אֵ֖ת כָּל־אֲשֶׁ֥ר אֲצַוֶּֽנּוּ: וְהָיָ֗ה הָאִישׁ֙ אֲשֶׁ֤ר לֹֽא־יִשְׁמַע֙ אֶל־דְּבָרַ֔י אֲשֶׁ֥ר יְדַבֵּ֖ר בִּשְׁמִ֑י אָֽנֹכִ֖י אֶדְר֥שׁ מֵֽעִמּֽוֹ:", verse: "Devarim 18:15-18", tags: [])
        ]
    }
    
    enum Filter {
        case positive, negative, prayer, tenCommandments, passover, sukkot, roshHaShana, yomKippur, speech, blasphemy, lashonHaRa, shavuot, business, intimateRelations, forbiddenRelations, idolatry, kashrut, robbery, assault, children, courts, holidays, shabbat, levitical, holyTemple, conquest
    }
    
    static let filters = ["Positive", "Negative", "Prayer", "Ten Commandments", "Passover", "Sukkot", "Rosh HaShanah", "Yom Kippur", "Speech", "Blasphemy", "Lashon Hara", "Shavuot", "Business", "Intimate Relations", "Forbidden Relations", "Idolatry", "Kashrut", "Robbery", "Assault", "Children", "Courts", "Holidays", "Shabbat", "Levitical", "Holy Temple", "Conquest"]
    
}
