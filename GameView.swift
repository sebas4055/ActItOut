//
//  GameVIew.swift
//  ActItOut
//
//  Created by Sebastian Molina on 8/8/23.
//

import SwiftUI

struct GameView: View {
    
    @State private var timeRemaining = 60
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var isLandscape: Bool {verticalSizeClass == .compact}
    var iPad: Bool {verticalSizeClass == .regular && horizontalSizeClass == .regular}
    
    @State var backToMenu = false
    
    @State var startingOffsetY: CGSize = .zero
    @State var currentDragOffsetY: CGFloat = 0
    
    @State var startingOffsetX: CGSize = .zero
    @State var currentDragOffsetX: CGFloat = 0
    
    @State var currentWord = " "
    
    @State var background = "diamonds"
    
    @State var score = 0
    
    @State var totalWords = 0
    
    @State var forehead: Bool = true
    
    @State var rightWords = " "
    @State var wrongWords = " "
    
    
    @State var postGame = false
    
    @Binding var isOn:Bool
    
    @Binding var gameTime:Bool
    
    @Binding var mime: Bool
    @Binding var wild: Bool
    @Binding var sing: Bool
    @Binding var lunch: Bool
    @Binding var lights: Bool
    @Binding var feeling: Bool
    @Binding var legends: Bool
    @Binding var spotlight: Bool
    @Binding var once: Bool
    
    @Binding var mimeS: Bool
    @Binding var wildS: Bool
    @Binding var singS: Bool
    @Binding var lunchS: Bool
    @Binding var lightsS: Bool
    @Binding var feelingS: Bool
    @Binding var legendsS: Bool
    @Binding var spotlightS: Bool
    @Binding var onceS: Bool
    
    
    @State var turnText = "Turn Me!"
    
    @Binding var english: Bool
    @Binding var spanish: Bool
    
        
    var body: some View {
        
        if postGame == true {
            PostGameView(isOn: $isOn, gameTime: $gameTime, mime: $mime, wild: $wild, sing: $sing, lunch: $lunch, lights: $lights, feeling: $feeling, legends: $legends, spotlight: $spotlight, once: $once, rightWords: $rightWords, wrongWords: $wrongWords, mimeS: $mimeS, wildS: $wildS, singS: $singS, lunchS: $lunchS, lightsS: $lightsS, feelingS: $feelingS, legendsS: $legendsS, spotlightS: $spotlightS, onceS: $onceS, english: $english, spanish: $spanish, score: $score, totalWords: $totalWords)
        }
        else {
            if backToMenu == true {
                DescriptionView(isOn: $isOn, gameTime: $gameTime, mime: $mime, wild: $wild, sing: $sing, lunch: $lunch, lights: $lights, feeling: $feeling, legends: $legends, spotlight: $spotlight, once: $once, mimeS: $mimeS, wildS: $wildS, singS: $singS, lunchS: $lunchS, lightsS: $lightsS, feelingS: $feelingS, legendsS: $legendsS, spotlightS: $spotlightS, onceS: $onceS, english: $english, spanish: $spanish)
            }
            else {
                if iPad == false && isLandscape == false{
                    ZStack{
                        Image("diamonds")
                        Text(turnText)
                            .font(.largeTitle).bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                    .onAppear{
                        if english == true {
                            turnText = "Turn Me On My Side!"
                        }
                        else if spanish == true {
                            turnText = "¡Girame A Mi Lado!"
                        }
                    }
                }
                else {
                    
                    ZStack{
                        Image("backgroundColor")
                            .resizable()
                            .ignoresSafeArea()
                        
                        if forehead == true {
                            
                            ZStack{
                                Image("diamonds")
                                    .resizable()
                                    .scaledToFit()
                                if english == true {
                                    Text("Place on Forehead!")
                                        .font(.largeTitle).bold()
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                else if spanish == true {
                                    Text("¡Coloca en tu frente!")
                                        .font(.largeTitle).bold()
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
                        }
                        else if forehead == false {
                            ZStack {
                                
                                ZStack{
                                    Image(background)
                                        .resizable()
                                        .scaledToFit()
                                        .ignoresSafeArea()
                                    
                                    Text(currentWord)
                                        .font(.largeTitle).bold()
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                .offset(startingOffsetY)
                                .offset(y: currentDragOffsetY)
                                .offset(startingOffsetX)
                                .offset(x: currentDragOffsetX)
                                .scaleEffect(getScaleAmount())
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            currentDragOffsetY = value.translation.height
                                        }
                                        .onEnded { value in
                                            if currentDragOffsetY > 75 {
                                                HapticManager.instance.notification(type: .success)
                                                SoundManager.instance.playSound(sound: .ding)
                                                if mime == true {
                                                    mimeGameE()
                                                }
                                                else if wild == true {
                                                    wildGameE()
                                                }
                                                else if sing == true {
                                                    singGameE()
                                                }
                                                else if lunch == true {
                                                    lunchGameE()
                                                }
                                                else if lights == true {
                                                    lightsGameE()
                                                }
                                                else if feeling == true {
                                                    feelingGameE()
                                                }
                                                else if legends == true {
                                                    legendsGameE()
                                                }
                                                else if spotlight == true {
                                                    spotlightGameE()
                                                }
                                                else if once == true {
                                                    onceGameE()
                                                }
                                                else if mimeS == true {
                                                    mimeGameS()
                                                }
                                                else if wildS == true {
                                                    wildGameS()
                                                }
                                                else if singS == true {
                                                    singGameS()
                                                }
                                                else if lunchS == true {
                                                    lunchGameS()
                                                }
                                                else if lightsS == true {
                                                    lightsGameS()
                                                }
                                                else if feelingS == true {
                                                    feelingGameS()
                                                }
                                                else if legendsS == true {
                                                    legendsGameS()
                                                }
                                                else if spotlightS == true {
                                                    spotlightGameS()
                                                }
                                                else if onceS == true {
                                                    onceGameS()
                                                }
                                                
                                                background = "correct"
                                                score += 1
                                                totalWords += 1
                                                rightWords.append("\(currentWord)\n")
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    withAnimation{
                                                        background = "diamonds"
                                                    }
                                                }
                                            }
                                            else if currentDragOffsetY < -75 {
                                                HapticManager.instance.notification(type: .error)
                                                SoundManager.instance.playSound(sound: .wrong)
                                                if mime == true {
                                                    mimeGameE()
                                                }
                                                else if wild == true {
                                                    wildGameE()
                                                }
                                                else if sing == true {
                                                    singGameE()
                                                }
                                                else if lunch == true {
                                                    lunchGameE()
                                                }
                                                else if lights == true {
                                                    lightsGameE()
                                                }
                                                else if feeling == true {
                                                    feelingGameE()
                                                }
                                                else if legends == true {
                                                    legendsGameE()
                                                }
                                                else if spotlight == true {
                                                    spotlightGameE()
                                                }
                                                else if once == true {
                                                    onceGameE()
                                                }
                                                else if mimeS == true {
                                                    mimeGameS()
                                                }
                                                else if wildS == true {
                                                    wildGameS()
                                                }
                                                else if singS == true {
                                                    singGameS()
                                                }
                                                else if lunchS == true {
                                                    lunchGameS()
                                                }
                                                else if lightsS == true {
                                                    lightsGameS()
                                                }
                                                else if feelingS == true {
                                                    feelingGameS()
                                                }
                                                else if legendsS == true {
                                                    legendsGameS()
                                                }
                                                else if spotlightS == true {
                                                    spotlightGameS()
                                                }
                                                else if onceS == true {
                                                    onceGameS()
                                                }
                                                
                                                background = "incorrect"
                                                totalWords += 1
                                                wrongWords.append("\(currentWord)\n")
                                                
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    withAnimation{
                                                        background = "diamonds"
                                                    }
                                                }
                                            }
                                            withAnimation(.spring()) {
                                                currentDragOffsetY = 0
                                            }
                                        }
                                        .onChanged { value in
                                            currentDragOffsetX = value.translation.width
                                        }
                                        .onEnded { value in
                                            
                                            if currentDragOffsetX > 450 {
                                                HapticManager.instance.notification(type: .warning)
                                                withAnimation{
                                                    backToMenu = true
                                                    gameTime = false
                                                }
                                            }
                                            
                                            withAnimation(.spring()) {
                                                currentDragOffsetX = 0
                                                currentDragOffsetY = 0
                                            }
                                        }
                                    
                                )
                                
                                VStack{
                                    Spacer()
                                    HStack{
                                        Text("\(timeRemaining):")
                                            .font(.title).bold()
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            }
                            .onReceive(timer) { time in
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation{
                                        if timeRemaining > 0 {
                                            timeRemaining -= 1
                                        }
                                        if timeRemaining == 10 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 9 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 8 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 7 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 6 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 5 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 4 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 3 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 2 {
                                            SoundManager.instance.playSound(sound: .count)
                                        }
                                        else if timeRemaining == 1 {
                                            SoundManager.instance.playSound(sound: .down)
                                        }
                                            else if timeRemaining == 0 {

                                            withAnimation{
                                                postGame = true
                                            }
                                        }
                                       

                                    }
                                }
                            }
                            .onChange(of: scenePhase) { newPhase in
                                    if newPhase == .active {
                                        isActive = true
                                    } else {
                                        isActive = false
                                    }
                                }
                            .onAppear{
                                if mime == true {
                                    currentWord = "Mime Time!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            mimeGameE()
                                        }
                                    }
                                }
                                else if wild == true {
                                    
                                    currentWord = "Go Wild!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            wildGameE()
                                        }
                                    }
                                }
                                else if sing == true {
                                    currentWord = "Sing It Out!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            singGameE()
                                        }
                                    }
                                }
                                else if lunch == true {
                                    currentWord = "Lunch Time!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            lunchGameE()
                                        }
                                    }
                                }
                                else if lights == true {
                                    currentWord = "Lights, Camera, Action!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            lightsGameE()
                                        }
                                    }
                                }
                                else if feeling == true {
                                    currentWord = "Feeling Frenzy!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            feelingGameE()
                                        }
                                    }
                                }
                                else if legends == true {
                                    currentWord = "Legends and Stars!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            legendsGameE()
                                        }
                                    }
                                }
                                else if spotlight == true {
                                    currentWord = "In The Spotlight!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            spotlightGameE()
                                        }
                                    }
                                }
                                else if once == true {
                                    currentWord = "Once Upon A Time..."
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            onceGameE()
                                        }
                                    }
                                }
                                else if mimeS == true {
                                    currentWord = "¡Tiempo de Mímica!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            mimeGameS()
                                        }
                                    }
                                }
                                else if wildS == true {
                                    
                                    currentWord = "¡Manada Salvaje!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            wildGameS()
                                        }
                                    }
                                }
                                else if singS == true {
                                    currentWord = "¡Cantalo!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            singGameS()
                                        }
                                    }
                                }
                                else if lunchS == true {
                                    currentWord = "¡A Comer!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            lunchGameS()
                                        }
                                    }
                                }
                                else if lightsS == true {
                                    currentWord = "¡Luces, Camara, Accion!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            lightsGameS()
                                        }
                                    }
                                }
                                else if feelingS == true {
                                    currentWord = "¡Locura de Emociones!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            feelingGameS()
                                        }
                                    }
                                }
                                else if legendsS == true {
                                    currentWord = "¡Leyendas y Estrellas!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            legendsGameS()
                                        }
                                    }
                                }
                                else if spotlightS == true {
                                    currentWord = "¡Abajo Las Luces!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            spotlightGameS()
                                        }
                                    }
                                }
                                else if onceS == true {
                                    currentWord = "Erase Una Vez..."
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            onceGameS()
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation{
                                forehead = false
                            }
                        }
                    }
                }
            }
        }
    }
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.height / 2
        let currentAmount = abs(startingOffsetY.height)
        let percentage = currentAmount / max
        return 1.0 - min(0.5, percentage) * 0.5
    }
    
    func mimeGameE() {
        
        let mimeWordsE = ["Paddleboarding", "Chef Hat", "Horseback Riding", "Playing Soccer", "Bungee Jumping", "Sculpting", "Bowling", "Firefighter", "Running", "Acrobat", "Playing Volleyball", "Playing Cards", "Breakdancing", "Sand Sculpting", "Detective", "Archery", "Yoga", "Riding a Bike", "Karate", "Skateboarding", "Mechanic", "Welder", "Elephant", "Playing Guitar", "Swimming", "Looking Through a Telescope", "Flipping a Pancake", "Sneezing", "Writing on a Typewriter", "Cactus", "Zebra", "Rain", "Helicopter", "Throwing a Snowball", "Gardening", "Shopping", "Playing Football", "Juggling", "Koala", "Hot Air Balloon Ride", "Fisherman", "Dentist", "Hula Hoop", "Farmer", "Magician", "Playing Piano", "Baking", "Ice Skating", "Pilot", "Airplane", "Playing Tennis", "Playing the Drums", "Mermaid", "Surfing", "Painting", "Skydiving", "Boxing", "Zookeeper", "Wine Tasting", "Acrobat", "Construction Worker", "Climbing a Tree", "Building a Sand Castle", "News Reporter", "Miming", "DJing", "Playing Baseball", "Synchronized Swimming", "Sumo Wrestlers", "Solving a Puzzle", "Parkour", "Sailing", "Waiter", "Ice Dancing", "Stilt Walking", "Playing Golf", "Paragliding", "Rock Climbing", "Playing Saxophone", "Snowboarding", "Walking on a Tightrope", "Cameraman", "Ice Cream", "Statue of Liberty", "Robot", "Circus", "Breakdancing", "Talking on the Phone", "Cutting with Scissors", "Eating", "Typing", "Driving", "Sleeping", "Laughing", "Crying", "Climbing", "Dancing", "Cooking", "Pointing", "Writing", "Reading a Book", "Blowing a Kiss", "Hugging", "Shouting", "Whispering", "Texting", "Stealing From a Store", "Singing", "Drinking", "Yawning", "Scratching your Back", "Taking a Shower", "Taking a Bath", "Cutting your Lawn", "Walking the Dog", "Playing Video Games", "Going to School", "Teacher", "Making your Bed", "Washing the Dishes", "Taking out the trash", "Whistling", "Working Out", "Playing Violin", "Blinking", "Washing your Car", "Vacuuming", "Closing the Blinds", "Closing the Curtains", "Watching TV", "Tying your Shoelaces", "Sunbathing", "Nodding", "Thinking", "Holding an Umbrella", "Flying a Kite", "Rowing a boat", "Riding a horse", "Blowing Bubbles", "Swatting a Fly", "Riding a Roller Coaster", "Playing Basketball", "Playing chess", "Doing a Cartwheel", "Putting on Makeup", "Curling your Hair", "Straightening your Hair", "Dying your Hair", "Cutting your Nails", "Shaving your Mustache", "Making a Snow Angel", "Catching a Butterfly", "Doing a Handstand", "Zombie", "Jogging", "Playing Hide and Seek", "Jumping on a Trampoline"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = mimeWordsE[Int(arc4random_uniform(UInt32(mimeWordsE.count)))]
                
            }
        }
    }
    
    func wildGameE() {
        
        let wildWordsE = ["Dog", "Cat", "Elephant", "Lion", "Tiger", "Bear", "Giraffe", "Zebra", "Kangaroo", "Panda", "Monkey", "Gorilla", "Chimpanzee", "Dolphin", "Whale", "Shark", "Octopus", "Penguin", "Koala", "Sloth", "Crocodile", "Alligator", "Snake", "Lizard", "Turtle", "Frog", "Toad", "Salamander", "Snail", "Butterfly", "Bee", "Ant", "Seal", "Bat", "Fox", "Wolf", "Coyote", "Raccoon", "Hedgehog", "Squirrel", "Chipmunk", "Rabbit", "Hare", "Hamster", "Guinea Pig", "Mouse", "Rat", "Otter", "Ferret", "Skunk", "Porcupine", "Parrot", "Eagle", "Hawk", "Falcon", "Owl", "Toucan", "Woodpecker", "Pigeon", "Crow", "Seagull", "Pelican", "Flamingo", "Ostrich", "Emu", "Pheasant", "Peacock", "Swan", "Duck", "Goose", "Rooster", "Chicken", "Turkey", "Puffin", "Sparrow", "Vulture", "Albatross", "Magpie", "Koel", "Hummingbird", "Grouse", "Quail", "Puffin", "Finch", "Macaw", "Shrimp", "Crab", "Lobster", "Jellyfish", "Starfish", "Seahorse", "Clownfish", "Pufferfish", "Swordfish", "Stingray", "Squid", "Cuttlefish", "Whale Shark", "Manta Ray", "Hammerhead Shark", "Barracuda", "Sea Turtle", "Sea Lion", "Walrus", "Manatee", "Sea Otter", "Dugong", "Narwhal", "Beluga Whale", "Orca", "Blue Whale", "Polar Bear", "Grizzly Bear", "Panda Bear", "Black Bear", "Red Panda", "Arctic Fox", "Snow Leopard", "Cheetah", "Jaguar", "Panther", "Leopard", "Lynx", "Bobcat", "Ocelot", "Caracal", "Cougar", "Hyena", "Coyote", "African Elephant", "Rhinoceros", "Hippopotamus", "Giraffe", "Okapi", "Bongo", "Elk", "Moose", "Deer", "Reindeer"]
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = wildWordsE[Int(arc4random_uniform(UInt32(wildWordsE.count)))]
                
            }
        }
    }
    
    func singGameE() {
        
        let singWordsE = ["\"Bohemian Rhapsody\"\nby Queen", "\"Billie Jean\"\nby Michael Jackson", "\"Imagine\"\nby John Lennon", "\"Like a Rolling Stone\"\nby Bob Dylan", "\"What's Going On\"\nby Marvin Gaye", "\"Smells Like Teen Spirit\"\nby Nirvana", "\"Hey Jude\"\nby The Beatles", "\"Johnny B. Goode\"\nby Chuck Berry", "\"I Want to Hold Your Hand\"\nby The Beatles", "\"Thriller\"\nby Michael Jackson", "\"Hotel California\"\nby Eagles", "\"Sweet Child o' Mine\"\nby Guns N' Roses", "\"Superstition\"\nby Stevie Wonder", "\"I Will Always Love You\"\nby Whitney Houston", "\"Stairway to Heaven\"\nby Led Zeppelin", "\"Purple Haze\"\nby Jimi Hendrix", "\"Imagine\"\nby Ariana Grande", "\"Hallelujah\"\nby Leonard Cohen", "\"Rolling in the Deep\"\nby Adele", "\"Like a Prayer\"\nby Madonna", "\"Boys Don't Cry\"\nby The Cure", "\"Don't Stop Believin'\"\nby Journey", "\"Let It Be\"\nby The Beatles", "\"Black Dog\"\nby Led Zeppelin", "\"Respect\"\nby Aretha Franklin", "\"Livin' on a Prayer\"\nby Bon Jovi", "\"Radioactive\"\nby Imagine Dragons", "\"Wannabe\"\nby Spice Girls", "\"Somebody to Love\"\nby Queen", "\"Yesterday\"\nby The Beatles", "\"Don't Stop 'Til You Get Enough\"\nby Michael Jackson", "\"Sweet Caroline\"\nby Neil Diamond", "\"Every Breath You Take\"\nby The Police", "\"Watermelon Sugar\"\nby Harry Styles", "\"Piano Man\"\nby Billy Joel", "\"Shape of You\"\nby Ed Sheeran", "\"Dancing Queen\"\nby ABBA", "\"Bad Guy\"\nby Billie Eilish", "\"Livin' La Vida Loca\"\nby Ricky Martin", "\"Sweet Home Alabama\"\nby Lynyrd Skynyrd", "\"Crazy\"\nby Gnarls Barkley", "\"Uptown Funk\"\nby Mark Ronson ft. Bruno Mars", "\"Unchained Melody\"\nby The Righteous Brothers", "\"Despacito\"\nby Luis Fonsi ft. Daddy Yankee", "\"Bad Romance\"\nby Lady Gaga", "\"Can't Stop the Feeling! \"\nby Justin Timberlake", "\"Hotline Bling\"\nby Drake", "\"All About That Bass\"\nby Meghan Trainor", "\"No Woman, No Cry\"\nby Bob Marley & The Wailers", "\"My Heart Will Go On\"\nby Celine Dion", "\"Blinding Lights\"\nby The Weeknd", "\"Thinking Out Loud\"\nby Ed Sheeran", "\"Another One Bites the Dust\"\nby Queen", "\"Shape of My Heart\"\nby Sting", "\"Sicko Mode\"\nby Travis Scott", "\"Royals\"\nby Lorde", "\"With or Without You\"\nby U2", "\"Rockstar\"\nby Post Malone ft. 21 Savage", "\"High Hopes\"\nby Panic! at the Disco", "\"All of Me\"\nby John Legend", "\"Counting Stars\"\nby OneRepublic", "\"Stayin' Alive\"\nby Bee Gees", "\"Old Town Road\"\nby Lil Nas X ft. Billy Ray Cyrus", "\"Viva la Vida\"\nby Coldplay", "\"Roar\"\nby Katy Perry", "\"Sultans of Swing\"\nby Dire Straits", "\"Roxanne\"\nby The Police", "\"Happy\"\nby Pharrell Williams", "\"Take Me to Church\"\nby Hozier", "\"Like a Virgin\"\nby Madonna", "\"I Want to Break Free\"\nby Queen", "\"Hello\"\nby Adele", "\"Havana\"\nby Camila Cabello ft. Young Thug", "\"Eye of the Tiger\"\nby Survivor", "\"Girls Just Want to Have Fun\"\nby Cyndi Lauper", "\"The Hills\"\nby The Weeknd", "\"After The Storm\"\nby Kali Uchis", "\"All Mine\"\nby Kanye West", "\"American Boy\"\nby Estelle", "\"American Pie\"\nby Don McLean", "\"Answer\"\nby Tyler, The Creator", "\"As the World Caves In\"\nby Matt Maltese", "\"Attention\"\nby Doja Cat", "\"Bad Habit\"\nby Steve Lacy", "\"Beat It\"\nby Michael Jackson", "\"Bellyache\"\nby Billie Eilish", "\"Bennie and the Jets\"\nby Elton John", "\"Best Friend\"\nby Rex Orange County", "\"Best Interest\"\nby Tyler, The Creator", "\"Bound 2\"\nby Kanye West", "\"Shake It Off\"\nby Taylor Swift", "\"Blank Space\"\nby Taylor Swift", "\"Look What You Made Me Do\"\nby Taylor Swift", "\"We Are Never Ever Getting Back Together\"\nby Taylor Swift", "\"Bad Blood\"\nby Taylor Swift", "\"Style\"\nby Taylor Swift", "\"You Belong with Me\"\nby Taylor Swift", "\"Careless Whisper\"\nby George Michael", "\"The Chain\"\nby Fleetwood Mac", "\"Champagne Poetry\"\nby Drake", "\"The Color Violet\"\nby Tory Lanez", "\"LES\"\nby Childish Gambino", "\"Dance the Night Away\"\nby Shane Smith and the Saints", "\"Dancing Queen\"\nby ABBA", "\"Deja Vu\"\nby Olivia Rodrigo", "\"good 4 u\"\nby Olivia Rodrigo", "\"Golden\"\nby Harry Styles", "\"Good Morning\"\nby Kanye West", "\"Heartbeat\"\nby Childish Gambino"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = singWordsE[Int(arc4random_uniform(UInt32(singWordsE.count)))]
            }
        }
    }
    
    func lightsGameE() {
        
        let lightsWordsE = ["The Shawshank\nRedemption", "The Godfather", "Pulp Fiction", "The Dark Knight", "Forrest Gump", "Inception", "Schindler's List", "Fight Club", "The Lord of\nthe Rings: The Fellowship of the Ring", "Star Wars: Episode IV\nA New Hope", "Jurassic Park", "The Matrix", "Avengers: Endgame", "Titanic", "Avatar", "The Lion King", "Toy Story", "Gladiator", "Braveheart", "The Silence of\nthe Lambs", "The Terminator", "The Social Network", "Gone with the Wind", "Casablanca", "The Wizard of Oz", "Jaws", "E.T. the Extra\nTerrestrial", "Back to the Future", "Raiders of the\nLost Ark", "The Godfather\nPart II", "The Departed", "The Avengers", "The Revenant", "Goodfellas", "The Shawshank\nRedemption", "The Grand\nBudapest Hotel", "The Lord of\nthe Rings: The Return of\nthe King", "The Dark Knight Rises", "Blade Runner", "Inglourious\nBasterds", "Gladiator", "The Sound of Music", "The Shining", "12 Angry Men", "The Incredibles", "Harry Potter and\nthe Sorcerer's Stone", "The Martian", "The Sixth Sense", "Mad Max:\nFury Road", "The Wolf of\nWall Street", "Reservoir Dogs", "The Green Mile", "A Beautiful Mind", "Finding Nemo", "The Truman Show", "The Dark Knight", "Black Panther", "No Country for\nOld Men", "Inception", "The Godfather\nPart II", "Avatar", "Schindler's List", "The Social Network", "The Lion King", "Toy Story", "The Matrix", "The Revenant", "Forrest Gump", "The Shape of Water", "La La Land", "The Grand\nBudapest Hotel", "Gravity", "The Big Lebowski", "The Great Gatsby", "The Princess Bride", "The Breakfast Club", "The King's Speech", "The Notebook", "2001: A Space\nOdyssey", "A Clockwork Orange", "The Graduate", "American Beauty", "The Godfather", "Goodfellas", "Citizen Kane", "Schindler's List", "Apocalypse Now", "The Shining", "Blade Runner", "Taxi Driver", "Fight Club", "The Dark Knight","The Matrix", "Star Wars: Episode V\nThe Empire Strikes Back", "Jurassic Park", "Forrest Gump", "Inception", "Casablanca", "Gone with\nthe Wind", "Titanic", "Avatar", "The Lion King", "Toy Story", "Braveheart", "Gladiator", "The Wizard of Oz", "Jaws", "Back to the Future", "Raiders of the\nLost Ark", "The Departed", "The Avengers", "The Revenant", "Goodfellas", "The Dark Knight\nRises", "Blade Runner", "Inglourious Basterds", "Gladiator", "The Sound of Music", "The Shining", "The Incredibles", "Harry Potter and\nthe Sorcerer's Stone", "The Martian", "The Sixth Sense", "Mad Max:\nFury Road", "Reservoir Dogs", "The Green Mile", "A Beautiful Mind", "Finding Dory", "The Meg 2", "The Godfather\nPart II", "Avatar 2", "Schindler's List", "The Social Network", "Avatar", "Titanic","Beauty and the Beast", "Finding Nemo", "The Lion King", "Avengers: Infinity War", "Spider-Man:\nNo Way Home", "Toy Story 4", "Spider-Man:\nHomecoming", "Spider-Man", "Pirates of the\nCaribbean", "The Chronicles of Narnia:\nThe Lion, the Witch,\nand the Wardrobe", "The Jungle Book", "Aquaman", "The Fellowship\nof the Ring", "Toy Story 3", "Star Wars: Episode I\nThe Phantom Menace", "Jurassic World\nFallen Kingdom", "The Return of\nthe Jedi", "Finding Dory", "The Lion King", "Beauty and the Beast", "The Fate of\nthe Furious", "Minions"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = lightsWordsE[Int(arc4random_uniform(UInt32(lightsWordsE.count)))]
            }
        }
    }
    
    func lunchGameE() {
        
        let lunchWordsE = ["Hamburger", "Cheeseburger", "Hot dog", "French fries", "Chicken nuggets", "Pizza", "Fried chicken", "Tacos", "Burrito", "Quesadilla", "Nachos", "Chicken wings", "Onion rings", "Mozzarella sticks", "Chicken sandwich", "Fish and chips", "Sushi", "Ramen", "Fried rice", "Egg rolls", "Spring rolls", "Dim sum", "Dumplings", "Pad Thai", "Pho", "Bánh mì", "Doner kebab", "Shawarma", "Falafel", "Gyro", "Pita bread", "Kebabs", "Samosa", "Empanada", "Churros", "Pretzel", "Soft serve ice cream", "Milkshake", "Fried dough", "Apple pie", "Donut", "Cupcake", "Brownie", "Chocolate chip cookie", "Pancakes", "Waffles", "Crepes", "Croissant", "Bagel", "Cinnamon roll", "Muffin", "Fried egg", "Scrambled eggs", "Omelette", "Bacon", "Sausage", "Hash browns", "Avocado toast", "Breakfast burrito", "Granola", "Yogurt", "Cereal", "Acai bowl", "Smoothie", "Fruit salad", "Banana", "Apple", "Orange", "Grapes", "Watermelon", "Strawberry", "Mango", "Pineapple", "Kiwi", "Peach", "Pear", "Plum", "Cherry", "Raspberry", "Blueberry", "Blackberry", "Grapefruit", "Lemon", "Lime", "Papaya", "Avocado", "Pomegranate", "Fig", "Cranberry", "Apricot", "Coconut", "Guava", "Passion fruit", "Dragon fruit", "Lychee", "Cantaloupe", "Honeydew", "Star fruit", "Persimmon", "Jackfruit", "Tangerine", "Clementine", "Nectarine", "Olive", "Pineapple", "Coconut", "Mango", "Banana", "Papaya", "Guava", "Kiwi", "Pomegranate", "Dragon fruit", "Blackberry", "Raspberry", "Strawberry", "Blueberry", "Watermelon", "Cantaloupe", "Honeydew", "Grapefruit", "Lemon", "Lime", "Orange", "Peach", "Pear", "Apple", "Plum", "Cherry", "Avocado", "Fig", "Cranberry", "Apricot", "Pineapple", "Coconut", "Banana", "Mango", "Papaya", "Guava", "Kiwi", "Pomegranate", "Dragon fruit", "Blackberry", "Raspberry", "Strawberry", "Blueberry", "Watermelon", "Cantaloupe", "Honeydew", "Grapefruit"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = lunchWordsE[Int(arc4random_uniform(UInt32(lunchWordsE.count)))]
                
            }
        }
    }
    
    func feelingGameE() {
        
        let feelingWordsE = ["Happiness", "Sadness", "Joy", "Anger", "Fear", "Surprise", "Love", "Appreciation", "Gratitude", "Guilt", "Shame", "Pain", "Anxiety", "Empathy", "Worry", "Confidence", "Hope", "Frustration", "Loneliness", "Desperation", "Euphoria", "Satisfaction", "Dissatisfaction", "Insecurity", "Disbelief", "Envy", "Relief", "Desire", "Helplessness", "Revenge", "Contentment", "Regret", "Disappointment", "Attachment", "Indifference", "Apathy", "Resentment", "Grief", "Hostility", "Scorn", "Overwhelm", "Vulnerability", "Uncertainty", "Phobia", "Melancholy", "Forgiveness", "Passion", "Comfort", "Impatience", "Consternation", "Despondency", "Longing", "Restlessness", "Dejection", "Stupor", "Guilt", "Detachment", "Amazement", "Aversion", "Panic", "Compassion", "Empowerment", "Being overwhelmed", "Caution", "Fascination", "Gratification", "Thankfulness", "Carelessness"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = feelingWordsE[Int(arc4random_uniform(UInt32(feelingWordsE.count)))]
                
            }
        }
    }
    
    func spotlightGameE() {
        
        let spotlightWordsE = ["The Beatles", "Michael Jackson", "Elvis Presley", "Madonna", "Queen", "Beyoncé", "Bob Marley", "Frank Sinatra", "Rihanna", "Elton John", "Taylor Swift", "Prince", "Mariah Carey", "Whitney Houston", "Johnny Cash", "David Bowie", "Stevie Wonder", "Led Zeppelin", "Adele", "Bruno Mars", "Ed Sheeran", "Eminem", "Lady Gaga", "Justin Bieber", "Katy Perry", "U2", "Nirvana", "Coldplay", "The Rolling\nStones", "The Weeknd", "Pink Floyd", "Drake", "John Lennon", "Celine Dion", "Aerosmith", "Bob Dylan", "Alicia Keys", "Jay-Z", "Britney Spears", "The Police", "Bruce Springsteen", "Usher", "Kanye West", "Shakira", "Maroon 5", "Guns N' Roses", "Sam Smith", "Red Hot\nChili Peppers", "Bon Jovi", "Billie Eilish", "Sia", "John Legend", "Linkin Park", "Nicki Minaj", "Calvin Harris", "Ricky Martin", "Kendrick Lamar", "Metallica", "Selena Gomez", "Ella Fitzgerald", "Ariana Grande", "Frank Zappa", "Fleetwood Mac", "One Direction", "Miley Cyrus", "Janis Joplin", "Lil Wayne", "Aretha Franklin", "The Notorious B.I.G.", "Ella Fitzgerald", "Stevie Nicks", "Jimi Hendrix", "Imagine Dragons", "Lana Del Rey", "Louis Armstrong", "Bill Withers", "Ludwig van\nBeethoven", "Avicii", "Dua Lipa", "Khalid", "Travis Scott", "Zayn Malik", "SZA", "Camila Cabello", "Charlie Puth", "Demi Lovato", "Post Malone", "Halsey", "Doja Cat", "J. Cole", "Billie Holiday", "Cher", "Frank Ocean", "Cardi B", "Meghan Trainor", "Jonas Brothers", "Travis Barker", "Kacey Musgraves", "Keith Urban", "Skrillex", "Zedd", "Ari Lennox", "Kurt Cobain", "Niall Horan", "Lizzo", "Harry Styles", "Santana", "Lil Nas X", "R. Kelly", "Bonnie Raitt", "Pitbull", "Shania Twain", "Migos", "Nick Jonas", "Charlie XCX", "Kesha", "Maren Morris", "Sam Hunt", "John Mayer", "Gwen Stefani", "Alicia Keys", "Daft Punk", "Christina Aguilera", "P!nk", "Coldplay", "OutKast", "Adele", "John Legend", "Rihanna", "Mariah Carey", "Britney Spears", "Justin Timberlake", "Ed Sheeran", "Shakira", "Lady Gaga", "Michael Jackson", "Madonna", "Usher", "Beyoncé", "Taylor Swift", "Eminem", "Ariana Grande", "Bruno Mars", "Elton John", "The Weeknd", "Whitney Houston", "Drake", "Katy Perry", "Coldplay", "Alicia Keys", "Bob Marley", "Billie Eilish", "Selena Gomez", "Prince", "Jay-Z", "Nicki Minaj", "Sia", "David Bowie", "Post Malone", "Ricky Martin", "Kendrick Lamar"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = spotlightWordsE[Int(arc4random_uniform(UInt32(spotlightWordsE.count)))]
            }
        }
    }
    
    func legendsGameE() {
        
        let legendsWordsE = ["Albert Einstein", "Oprah Winfrey", "Leonardo da Vinci", "Nelson Mandela", "Amelia Earhart", "Martin Luther King Jr.", "Marie Curie", "Mahatma Gandhi", "Queen Elizabeth II", "Michael Jackson", "Marilyn Monroe", "Steve Jobs", "Serena Williams", "Barack Obama", "Cristiano Ronaldo", "Malala Yousafzai", "William Shakespeare", "Elon Musk", "Madonna", "Frida Kahlo", "Albert Pujols", "Mother Teresa", "Stephen Hawking", "Audrey Hepburn", "Bill Gates", "Muhammad Ali", "Angela Merkel", "Ellen DeGeneres", "George Washington", "Taylor Swift", "Malcom X", "J.K. Rowling", "Beyoncé", "Pablo Picasso", "Dalai Lama", "Walt Disney", "Michelle Obama", "Winston Churchill", "Charlie Chaplin", "Bob Marley", "Neil Armstrong", "Anne Frank", "Adele", "Charles Darwin", "Vincent van Gogh", "Pope Francis", "Nikola Tesla", "Michael Jordan", "Coco Chanel", "Ernest Hemingway", "Princess Diana", "Vladimir Putin", "Maya Angelou", "Mark Zuckerberg", "Billie Holiday", "Elvis Presley", "Princess Diana", "Queen Victoria", "John F. Kennedy", "Wolfgang Amadeus Mozart", "Anne Frank", "Charles Dickens", "Leo Tolstoy", "Mark Twain", "Wolfgang Amadeus Mozart", "Ludwig van Beethoven", "Jane Austen", "Nikola Tesla", "Albert Schweitzer", "Anne Hathaway", "John Lennon", "Paul McCartney", "Charlie Chaplin", "Frank Sinatra", "Freddie Mercury", "Salvador Dali", "Andy Warhol", "Ernest Hemingway", "Maya Angelou", "Albert Einstein", "Salvador Dali", "Pablo Neruda", "James Dean", "Marilyn Monroe", "Audrey Hepburn", "Grace Kelly", "Hedy Lamarr", "Mother Teresa", "Audrey Hepburn", "Bruce Springsteen", "Tom Hanks", "Morgan Freeman", "Leonardo DiCaprio", "Brad Pitt", "Angelina Jolie", "Kate Winslet", "George Clooney", "Clint Eastwood", "Johnny Depp", "Sean Connery", "Meryl Streep", "Emma Watson", "Jennifer Lawrence", "Daniel Radcliffe", "Scarlett Johansson", "Robert Downey Jr.", "Julia Roberts", "Will Smith", "Oprah Winfrey", "Bill Gates", "Warren Buffett", "Jeff Bezos", "Steve Jobs", "Richard Branson", "Elon Musk", "Mark Zuckerberg", "Larry Page", "Sergey Brin", "Tim Cook", "Jack Ma", "Sheryl Sandberg", "Richard Dawkins", "Jane Goodall", "David Attenborough", "Neil deGrasse Tyson", "Carl Sagan", "Stephen Hawking", "Bill Nye", "Jane Goodall", "Dalai Lama", "Pope Francis", "Mother Teresa", "Desmond Tutu", "Billy Graham", "Deepak Chopra", "Eckhart Tolle", "Joel Osteen", "Thich Nhat Hanh", "Ram Dass", "Oprah Winfrey", "Ellen DeGeneres"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = legendsWordsE[Int(arc4random_uniform(UInt32(legendsWordsE.count)))]
            }
        }
    }
    
    func spotlightGameS() {
    
    let spotlightWordsS = ["Shakira", "Enrique Iglesias", "Selena", "Marc Anthony", "Gloria Estefan", "Daddy Yankee", "Juanes", "Romeo Santos", "Luis Fonsi", "Mana", "Juan Gabriel", "Ricky Martin", "Maluma", "J Balvin", "Alejandro Sanz", "Jennifer Lopez", "Thalía", "Vicente Fernández", "Carlos Vives", "Celia Cruz", "Ozuna", "Natalia Lafourcade", "Ana Gabriel", "Bad Bunny", "Gloria Trevi", "Luis Miguel", "Wisin & Yandel", "Don Omar", "Carlos Santana", "Ricardo Arjona", "Soda Stereo", "Aventura", "Calle 13", "Rosalía", "Pablo Alborán", "Jarabe de Palo", "Alejandro Fernández", "Juan Luis Guerra", "La India", "Los Fabulosos Cadillacs", "Juan Magán", "Los Tigres del Norte", "Camila", "Juan Fernando Velasco", "RBD", "Jesse & Joy", "Franco de Vita", "Fonseca", "Mon Laferte", "La Oreja de Van Gogh", "Diego Torres", "Victor Manuelle", "Jarabe de Palo", "Natalia Jiménez", "Eros Ramazzotti", "La Quinta Estación", "Juanes", "Ricky Martin", "Carlos Baute", "Diego El Cigala", "Rosario", "José Luis Perales", "Belinda", "Andrés Calamaro", "Los Enanitos Verdes", "Luis Enrique", "Dani Martín", "Reykon", "La India", "Aleks Syntek", "Ricardo Montaner", "Los Auténticos Decadentes", "Fanny Lu", "Manuel Carrasco", "Juan Gabriel", "Marta Sánchez", "Hombres G", "Paulina Rubio", "Gente de Zona", "La Mafia", "Rosario Flores", "Jarabe de Palo", "Fonseca", "Miguel Bosé", "Los Temerarios", "Shaila Dúrcal", "David Bisbal", "Pablo Alborán", "Luis Fonsi", "Maná", "Shakira", "Enrique Iglesias", "Vicente García", "Natalia Lafourcade", "Romeo Santos", "Ana Gabriel", "Alejandro Sanz", "Gloria Estefan", "Marc Anthony", "Daddy Yankee", "Wisin & Yandel", "Prince Royce", "Laura Pausini", "Maluma", "J Balvin", "Thalía", "Reik", "Juan Luis Guerra", "Chayanne", "Carlos Vives", "Fonseca", "Jesse & Joy", "Luis Miguel", "Ozuna", "Aventura", "Natalia Jiménez", "Gloria Trevi", "Los Tigres del Norte", "Natalia Lafourcade", "Pablo Alborán", "Alejandro Fernández", "Rosalía", "Camila Cabello", "Vicente Fernández", "La Oreja de Van Gogh", "Luis Fonsi", "Thalía", "Mon Laferte", "Carlos Rivera", "Wisin & Yandel", "Juanes", "Reik", "Ricky Martin", "Maluma", "J Balvin", "Shakira", "Enrique Iglesias", "Bad Bunny", "Ana Gabriel", "Romeo Santos", "Juan Gabriel", "Alejandro Sanz", "Natalia Jiménez", "Gloria Trevi", "Luis Miguel", "Daddy Yankee", "Maná", "Vicente Fernández", "Marc Anthony", "Gloria Estefan"]

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation{
            
            currentWord = spotlightWordsS[Int(arc4random_uniform(UInt32(spotlightWordsS.count)))]
        }
    }
}
    
    func onceGameE() {
        
        let onceWordsE = ["\"To Kill a Mockingbird\"\nby Harper Lee", "\"1984\"\nby George Orwell", "\"Pride and Prejudice\"\nby Jane Austen", "\"The Great Gatsby\"\nby F. Scott Fitzgerald", "\"The Catcher in the Rye\"\nby J. D. Salinger", "\"One Hundred Years\nof Solitude\"\nby Gabriel Garcia Marquez", "\"Brave New World\"\nby Aldous Huxley", "\"The Lord of the Rings\"\nby J. R. R. Tolkien", "\"The Alchemist\"\nby Paulo Coelho", "\"Gone with the Wind\"\nby Margaret Mitchell", "\"The Chronicles of Narnia\"\nby C. S. Lewis", "\"Moby-Dick\"\nby Herman Melville", "\"Jane Eyre\"\nby Charlotte Bronte", "\"The Grapes of Wrath\"\nby John Steinbeck", "\"The Picture of Dorian Gray\"\nby Oscar Wilde", "\"Crime and Punishment\"\nby Fyodor Dostoevsky", "\"The Kite Runner\"\nby Khaled Hosseini", "\"The Count of Monte Cristo\"\nby Alexandre Dumas", "\"Fahrenheit 451\"\nby Ray Bradbury", "\"Anna Karenina\"\nby Leo Tolstoy", "\"The Brothers Karamazov\"\nby Fyodor Dostoevsky", "\"The Handmaid's Tale\"\nby Margaret Atwood", "\"The Road\"\nby Cormac McCarthy", "\"The Bell Jar\"\nby Sylvia Plath", "\"Great Expectations\"\nby Charles Dickens", "\"The Color Purple\"\nby Alice Walker", "\"A Clockwork Orange\"\nby Anthony Burgess", "\"Dracula\"\nby Bram Stoker", "\"War and Peace\"\nby Leo Tolstoy", "\"Slaughterhouse-Five\"\nby Kurt Vonnegut", "\"The Lord of the Flies\"\nby William Golding", "\"The Stranger\"\nby Albert Camus", "\"The Little Prince\"\nby Antoine de Saint-Exupery", "\"Middlemarch\"\nby George Eliot", "\"Beloved\"\nby Toni Morrison", "\"A Tale of Two Cities\"\nby Charles Dickens", "\"The Help\"\nby Kathryn Stockett", "\"The Goldfinch\"\nby Donna Tartt", "\"The Night Circus\"\nby Erin Morgenstern", "\"The Book Thief\"\nby Markus Zusak", "\"Eleanor Oliphant Is Completely Fine\"\nby Gail Honeyman", "\"Educated\"\nby Tara Westover", "\"Circe\"\nby Madeline Miller", "\"Where the Crawdads Sing\"\nby Delia Owens", "\"Normal People\"\nby Sally Rooney", "\"The Giver\"\nby Lois Lowry", "\"The Power of One\"\nby Bryce Courtenay", "\"White Teeth\"\nby Zadie Smith", "\"The Secret History\"\nby Donna Tartt", "\"Neverwhere\"\nby Neil Gaiman", "\"Dune\"\nby Frank Herbert", "\"The Hitchhiker's Guide to the Galaxy\"\nby Douglas Adams", "\"Ender's Game\"\nby Orson Scott Card", "\"Neuromancer\"\nby William Gibson", "\"A Wrinkle in Time\"\nby Madeleine L'Engle", "\"The Left Hand of Darkness\"\nby Ursula K. Le Guin", "\"Snow Crash\"\nby Neal Stephenson", "\"A Game of Thrones\"\nby George R. R. Martin", "\"Foundation\"\nby Isaac Asimov", "\"The War of the Worlds\"\nby H. G. Wells", "\"Gone Girl\"\nby Gillian Flynn", "\"The Girl on the Train\"\nby Paula Hawkins", "\"The Da Vinci Code\"\nby Dan Brown", "\"The Silent Patient\"\nby Alex Michaelides", "\"The Woman in White\"\nby Wilkie Collins", "\"In the Woods\"\nby Tana French", "\"Before I Go to Sleep\"\nby S. J. Watson", "\"The Cuckoo's Calling\"\nby Robert Galbraith (J. K. Rowling)", "\"The Girl with the Dragon Tattoo\"\nby Stieg Larsson", "\"The Reversal\"\nby Michael Connelly", "\"The Snowman\"\nby Jo Nesb", "\"Outlander\"\nby Diana Gabaldon", "\"The Rosie Project\"\nby Graeme Simsion", "\"Me Before You\"\nby Jojo Moyes", "\"The Notebook\"\nby Nicholas Sparks", "\"All the Light We Cannot See\"\nby Anthony Doerr", "\"The Nightingale\"\nby Kristin Hannah", "\"The Pillars of the Earth\"\nby Ken Follett", "\"Wolf Hall\"\nby Hilary Mantel", "\"Scythe\"\nby Neal Shusterman", "\"An Ember in the Ashes\"\nby Sabaa Tahir"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                
                currentWord = onceWordsE[Int(arc4random_uniform(UInt32(onceWordsE.count)))]
            }
        }
    }
    
    
    func mimeGameS() {
        
        let mimeWordsS = ["Cocinando", "Montar a Caballo", "Jugar Fútbol", "Salto en Bungee", "Escultura", "Jugar Boliche", "Jardinería", "Bombero", "Correr", "Acrobata", "Jugar Voleibol", "Jugar a la Baraja", "Escultura en Arena", "Detective", "Tiro con Arco", "Yoga", "Montar en Bicicleta", "Karate", "Patinaje", "Mecánico", "Soldador", "Elefante", "Tocar la Guitarra", "Nadar", "Ver por un Telescopio", "Panqueque", "Estornudar", "Máquina de Escribir", "Cactus", "Cebra", "Lluvia", "Helicóptero", "Bola de Nieve", "Ir de Compras", "Jugar Fútbol Americano", "Malabares", "Koala", "Paseo en Globo Aerostático", "Pescar", "Dentista", "Aro Hula", "Granjero", "Mago", "Tocar el Piano", "Hornear", "Patinaje sobre Hielo", "Piloto", "Avión", "Jugar Tenis", "Tocar la Batería", "Sirena", "Pintar", "Surf", "Paracaidismo", "Boxeo", "Cuidador de Zoológico", "Cata de Vinos", "Acrobata", "Trabajador de la Construcción", "Trepar un Árbol", "Construir un Castillo de Arena", "Reportero de Noticias", "Mimo", "Dj", "Jugar Béisbol", "Nadar Sincronizado", "Luchadores de Sumo", "Resolver un Rompecabezas", "Mesero", "Baile sobre Hielo", "Caminar sobre Zancos", "Jugar Golf", "Parapente", "Escalada en Roca", "Tocar el Saxofón", "Snowboard", "Caminar en la Cuerda Floja", "Camarógrafo", "Nieve", "Estatua de la Libertad", "Tenochtitlan", "Robot", "Circo", "Hablar por Teléfono", "Tijeras", "Comer", "Escribir", "Manejar un Carro", "Dormir", "Reírte", "Llorar", "Escalar", "Bailar", "Leyendo un Libro", "Besar", "Abrazar", "Gritar", "Susurrar", "Enviando un Mensaje de Texto", "Robar", "Cantar", "Beber Agua", "Bostezando", "Rascarte la Espalda", "Bañarte", "Ducharte", "Cortar el Césped", "Caminar el Perro", "Jugar Videojuegos", "Ir a la Escuela", "Profesor", "Tendiendo la Cama", "Lavar los Trastes", "Sacar la Basura", "Chiflar", "Hacer Ejercicio", "Parpadear", "Tocar el Violín", "Lavar tu Carro", "Aspirar", "Cerrar las Persianas", "Cerrar las Cortinas", "Ver la Televisión", "Amarrar cintas de zapato", "Tomar el Sol", "Asistir", "Pensar", "Sosteniendo un Paraguas", "Remando en un Bote", "Montar a Caballo", "Soplando Burbujas", "Matar una Mosca", "Montar en Montaña Rusa", "Jugar Baloncesto", "Jugar Ajedrez", "Haciendo Maromas", "Maquillándote", "Rizándote el Cabello", "Alisándote el Cabello", "Pintándote el Cabello", "Cortando tus Uñas", "Afeitándote el bigote", "Haciendo un ángel de nieve", "Atrapando una mariposa", "Haciendo una parada de manos", "Zombi", "Trotar", "Jugar a las Escondidas", "Saltar en un trampolín"]

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = mimeWordsS[Int(arc4random_uniform(UInt32(mimeWordsS.count)))]
                
            }
        }
    }
    
    func wildGameS() {
        
        let wildWordsS = ["Perro", "Gato", "Elefante", "León", "Tigre", "Oso", "Jirafa", "Cebra", "Canguro", "Panda", "Mono", "Gorila", "Chimpancé", "Delfín", "Ballena", "Tiburón", "Pulpo", "Pingüino", "Koala", "Perezoso", "Cocodrilo", "Caimán", "Serpiente", "Lagarto", "Tortuga", "Rana", "Sapo", "Salamandra", "Caracol", "Mariposa", "Abeja", "Hormiga", "Foca", "Murciélago", "Zorro", "Lobo", "Coyote", "Mapache", "Erizo", "Ardilla", "Ardilla rayada", "Conejo", "Liebre", "Hámster", "Cuyo", "Ratón", "Rata", "Nutria", "Hurón", "Zorrillo", "Puercoespín", "Loro", "Águila", "Halcón", "Halcón", "Búho", "Tucán", "Pichón", "Cuervo", "Gaviota", "Pelícano", "Flamenco", "Avestruz", "Emú", "Faisán", "Pavo real", "Cisne", "Pato", "Ganso", "Gallo", "Pollo", "Pavo", "Frailecillo", "Gorrión", "Buitre", "Albatros", "Urraca", "Koel", "Colibrí", "Urogallo", "Codorniz", "Frailecillo", "Pinzón", "Guacamayo", "Camarón", "Cangrejo", "Langosta", "Medusa", "Estrella de mar", "Caballito de mar", "Pez payaso", "Pez globo", "Pez espada", "Mantarraya", "Calamar", "Sepia", "Tiburón ballena", "Manta raya", "Tiburón martillo", "Barracuda", "Tortuga marina", "León marino", "Morsa", "Manatí", "Nutria marina", "Dugongo", "Narval", "Ballena beluga", "Orca", "Ballena azul", "Oso polar", "Oso grizzly", "Panda", "Oso negro", "Panda rojo", "Zorro ártico", "Leopardo de las nieves", "Guepardo", "Jaguar", "Pantera", "Leopardo", "Lince", "Caracal", "Puma", "Hiena", "Coyote", "Elefante africano", "Rinoceronte", "Hipopótamo", "Jirafa", "Okapi", "Bongo", "Alce", "Alce", "Reno", "Caribú"]

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = wildWordsS[Int(arc4random_uniform(UInt32(wildWordsS.count)))]
                
            }
        }
    }
    
    func singGameS() {
    
    let singWordsS = ["\"Despacito\"\nLuis Fonsi", "\"Hips Don't Lie\"\nShakira", "\"Querida\"\nJuan Gabriel", "\"Vivir Mi Vida\"\nMarc Anthony", "\"Rayando el Sol\"\nManá", "\"De Música Ligera\"\nSoda Stereo", "\"Bailando\"\nEnrique Iglesias", "\"Bidi Bidi Bom Bom\"\nSelena", "\"La Bicicleta\"\nCarlos Vives", "\"Malamente\"\nRosalía", "\"Volver, Volver\"\nVicente Fernández", "\"Gasolina\"\nDaddy Yankee", "\"Matador\"\nLos Fabulosos Cadillacs", "\"La Vida Es un Carnaval\"\nCelia Cruz", "\"Corazón Partío\"\nAlejandro Sanz", "\"A Dios le Pido\"\nJuanes", "\"La Incondicional\"\nLuis Miguel", "\"Limón y Sal\"\nJulieta Venegas", "\"Lady Blue\"\nEnrique Bunbury", "\"Livin' la Vida Loca\"\nRicky Martin", "\"En el Muelle de San Blas\"\nMana", "\"La Tortura\"\nShakira", "\"La Flaca\"\nJarabe de Palo", "\"Felices los 4\"\nMaluma", "\"Sin Documentos\"\nLos Rodríguez", "\"Amor a la Mexicana\"\nThalía", "\"Atrévete-Te-Te\"\nCalle 13", "\"Lamento Boliviano\"\nLos Enanitos Verdes", "\"Bachata Rosa\"\nJuan Luis Guerra", "\"Ojos Así\"\nShakira", "\"En la Ciudad de la Furia\"\nSoda Stereo", "\"Valió la Pena\"\nMarc Anthony", "\"Tren al Sur\"\nLos Prisioneros", "\"Me Enamora\"\nJuanes", "\"Hijo de la Luna\"\nMecano", "\"Dura\"\nDaddy Yankee", "\"Quién Como Tú\"\nAna Gabriel", "\"Échame la Culpa\"\nLuis Fonsi", "\"Ingrata\"\nCafé Tacvba", "\"Piel Morena\"\nThalía", "\"Rosas\"\nLa Oreja de Van Gogh", "\"Propuesta Indecente\"\nRomeo Santos", "\"Vasos Vacíos\"\nLos Fabulosos Cadillacs", "\"Amiga Mía\"\nAlejandro Sanz", "\"Todo Cambió\"\nCamila", "\"Tiempo de Vals\"\nChayanne", "\"Hasta la Raíz\"\nNatalia Lafourcade", "\"Fruta Fresca\"\nCarlos Vives", "\"Rakata\"\nWisin & Yandel", "\"Andrea\"\nBad Bunny", "\"Callaíta\"\nBad Bunny, Tainy", "\"Después de la Playa\"\nBad Bunny", "\"Me Fui de Vacaciones\"\nBad Bunny", "\"Me Porta Bonito\"\nBad Bunny", "\"Neverita\"\nBad Bunny", "\"Un X100to\"\nGrupo Frontera", "\"Yo No Soy Celoso\"\nBad Bunny", "\"Las Morras\"\nPeso Pluma", "\"No Se Va\"\nGrupo Frontera", "\"Ayer\"\nGrupo Frontera", "\"Te Boté (con Casper, Nio García, Darell, Nicky Jam, Ozuna)\"\nBad Bunny", "\"Está Cabrón Ser Yo\"\nBad Bunny", "\"Mi Dulce Niña\"\nGrupo Frontera", "\"Tragos de Amargo Licor\"\nGrupo Frontera", "\"Ignorantes (con Sech)\"\nBad Bunny", "\"Vida Loca\"\nBad Bunny", "\"Después de Ti\"\nGrupo Frontera", "\"La Canción\"\nBad Bunny", "\"Pero Ya No\"\nBad Bunny", "\"Ella es Bonita\"\nGrupo Frontera", "\"No Me Abandones\"\nGrupo Frontera", "\"Hoy Cobré\"\nBad Bunny", "\"Yo Perreo Sola\"\nBad Bunny", "\"Bichiyal (con Yaviah)\"\nBad Bunny", "\"Mentirosa\"\nGrupo Frontera", "\"Si Tú No Estás\"\nGrupo Frontera", "\"Safaera (con Jowell & Randy, Ñengo Flow)\"\nBad Bunny", "\"Amor en Silencio\"\nGrupo Frontera", "\"PFK\"\nBad Bunny", "\"Volví\"\nBad Bunny", "\"Bye Me Fui\"\nBad Bunny", "\"Un Alma Sentenciada\"\nGrupo Frontera", "\"Amigos No Por Favor\"\nGrupo Frontera", "\"Puesto Pa' Guerrial\"\nBad Bunny", "\"Mía (con Drake)\"\nBad Bunny", "\"Que Levante la Mano\"\nGrupo Frontera", "\"La Santa (con Daddy Yankee)\"\nBad Bunny", "\"Solía\"\nBad Bunny", "\"Ay Amor\"\nGrupo Frontera", "\"Lágrimas\"\nGrupo Frontera", "\"Otra Noche en Miami\"\nBad Bunny", "\"Nunca Es Suficiente\"\nLos Ángeles Azules", "\"Llorar\"\nLos Socios del Ritmo", "\"Tiene Espinas el Rosal\"\nGrupo Cañaveral", "\"Adoro\"\nBronco", "\"Que No Quede Huella\"\nBronco", "\"Oye Mujer\"\nRaymix", "\"Cumbia de la Cobra\"\nFito Olivares y su Grupo", "\"El Baile del Gorila\"\nMassore", "\"Dákiti\"\nBad Bunny", "\"Te Boté\"\nNio García", "\"Todo de Ti\"\nRauw Alejandro", "\"La Fama\"\nRosalía", "\"Telepatía\"\nKali Uchis", "\"Taki Taki\"\nDJ Snake", "\"Vete\"\nBad Bunny", "\"Pepas\"\nFarruko"]

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation{
            currentWord = singWordsS[Int(arc4random_uniform(UInt32(singWordsS.count)))]
            
        }
    }
}
    
    func lunchGameS() {
        
        let lunchWordsS = ["Hamburguesa", "Cheeseburger", "Hot dog", "Papas fritas", "Nuggets de pollo", "Pizza", "Pollo frito", "Tacos", "Burrito", "Quesadilla", "Nachos", "Alitas de pollo", "Aros de cebolla", "Palitos de mozzarella", "Sandwich de pollo", "Pescado con papas", "Sushi", "Ramen", "Arroz frito", "Rollitos de huevo", "Rollitos de primavera", "Dim sum", "Empanadas", "Pad Thai", "Pho", "Bánh mì", "Doner kebab", "Shawarma", "Falafel", "Gyro", "Pan de pita", "Brochetas", "Samosas", "Empanada", "Churros", "Pretzel", "Helado suave", "Batido", "Masa frita", "Tarta de manzana", "Dona", "Cupcake", "Brownie", "Galleta con chispas de chocolate", "Panqueques", "Waffles", "Creppes", "Croissant", "Bagel", "Rollito de canela", "Muffin", "Huevo frito", "Huevos revueltos", "Tortilla", "Tocino", "Salchicha", "Hash browns", "Tostada de aguacate", "Burrito de desayuno", "Granola", "Yogur", "Cereal", "Acai bowl", "Batido", "Ensalada de frutas", "Plátano", "Manzana", "Naranja", "Uvas", "Sandía", "Fresa", "Mango", "Piña", "Kiwi", "Durazno", "Pera", "Ciruela", "Cereza", "Frambuesa", "Arándano", "Mora", "Toronja", "Limón", "Lima", "Papaya", "Aguacate", "Granada", "Higo", "Cranberry", "Damasco", "Coco", "Guayaba", "Maracuyá", "Pitaya", "Lichi", "Melón", "Melón", "Cantalupo", "Limón", "Naranja", "Durazno", "Pera", "Manzana", "Ciruela", "Cereza", "Aguacate", "Higo", "Cranberry", "Damasco", "Papaya", "Coco", "Plátano", "Mango", "Papaya", "Guayaba", "Kiwi", "Granada", "Pitaya", "Lichi", "Melón", "Melón", "Cantalupo", "Limón"]

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = lunchWordsS[Int(arc4random_uniform(UInt32(lunchWordsS.count)))]
                
            }
        }
    }
    
    func lightsGameS() {
        
        let lightsWordsS = ["Amores Perros", "Y Tu Mamá\nTambién", "Cidade de Deus", "El Secreto\nde sus Ojos", "Relatos Salvajes", "Diarios de\nMotocicleta", "La Jaula de Oro", "La Misma Luna", "La Historia\nOficial", "No", "Coco", "El Laberinto\ndel Fauno", "La La Land", "Biutiful", "Roma", "Avatar", "Titanic", "Star Wars", "Avengers: Endgame", "El Rey León\n(The Lion King)", "El Padrino\n(The Godfather)", "Parque Jurásico\n(Jurassic Park)", "Los Vengadores\n(The Avengers)", "Harry Potter", "E.T", "Frozen", "Pantera Negra\n(Black Panther)", "Mundo Jurásico\n(Jurassic World)", "Los Vengadores: La Era de Ultrón", "El Titanic", "Star Wars: El\nDespertar de la Fuerza", "Los Increíbles", "La Bella y La Bestia", "Buscando a Nemo\n(Finding Nemo)", "El Rey León", "Vengadores: Infinity War\n(Avengers: Infinity War)", "Star Wars: Episodio VI\nEl Retorno del Jedi", "Spider-Man: No Way Home", "El Imperio Contraataca\n(The Empire Strikes Back)", "E.T.\nelExtraterrestre", "El Caballero de\nla Noche Asciende", "Toy Story 4", "Spider-Man\nDe Regreso a Casa"]

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = lightsWordsS[Int(arc4random_uniform(UInt32(lightsWordsS.count)))]
                
            }
        }
    }
    
    func feelingGameS() {
        
        let feelingWordsS = ["Felicidad", "Tristeza", "Alegría", "Enojo", "Miedo", "Sorpresa", "Amor", "Aprecio", "Gratitud", "Culpa", "Vergüenza", "Dolor", "Ansiedad", "Empatía", "Preocupación", "Confianza", "Esperanza", "Frustración", "Soledad", "Desesperación", "Euforia", "Gratificación", "Insatisfacción", "Inseguridad", "Incredulidad", "Envidia", "Alivio", "Deseo", "Impotencia", "Venganza", "Satisfacción", "Arrepentimiento", "Desilusión", "Apego", "Indiferencia", "Apatía", "Resentimiento", "Aflicción", "Hostilidad", "Desprecio", "Agobio", "Vulnerabilidad", "Incertidumbre", "Fobia", "Melancolía", "Perdón", "Pasión", "Comodidad", "Impaciencia", "Consternación", "Desánimo", "Anhelo", "Inquietud", "Abatimiento", "Estupor", "Culpa", "Desapego", "Asombro", "Aversión", "Pánico", "Compasión", "Empoderamiento", "Estar abrumado", "Cautela", "Fascinación", "Gratificación", "Agradecimiento", "Despreocupación"]


        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = feelingWordsS[Int(arc4random_uniform(UInt32(feelingWordsS.count)))]
                
            }
        }
    }
    
    func legendsGameS() {
        
        let legendsWordS = ["Luis Fonsi", "Shakira", "Juan Gabriel", "Marc Anthony", "Maná", "Soda Stereo", "Enrique Iglesias", "Selena", "Carlos Vives", "Rosalía", "Vicente Fernández", "Daddy Yankee", "Los Fabulosos Cadillacs", "Celia Cruz", "Alejandro Sanz", "Juanes", "Luis Miguel", "Julieta Venegas", "Ricky Martin", "Maluma", "Thalía", "Calle 13", "Los Enanitos Verdes", "Juan Luis Guerra", "Jarabe de Palo", "Los Rodríguez", "Ana Gabriel", "Café Tacvba", "La Oreja de Van Gogh", "Romeo Santos", "Camila", "Chayanne", "Natalia Lafourcade", "Wisin & Yandel", "Bad Bunny", "Grupo Frontera", "Los Ángeles Azules", "Los Socios del Ritmo", "Grupo Cañaveral", "Bronco", "Raymix", "Fito Olivares y su Grupo", "Massore", "Nio García", "Rauw Alejandro", "Kali Uchis", "DJ Snake", "Farruko", "Redimi2", "Manu Chao", "Ricardo Arjona", "Pablo Alborán", "Romeo Santos", "Prince Royce", "Reik", "Carlos Santana", "Gloria Estefan", "Los Tigres del Norte", "J Balvin", "La India", "El Tri", "Aventura", "Natalia Lafourcade", "Alejandro Sanz", "Los Amigos Invisibles", "Camilo", "Mau y Ricky", "Ricardo Montaner", "Pedro Infante", "Fonseca", "Pablo López", "Ozuna", "Los Bukis", "Jesse & Joy", "Jenny and the Mexicats", "Jesse & Joy", "Calle 13", "Karol G", "Becky G", "Don Omar", "Nicky Jam", "Wisin", "Yandel", "Tego Calderón", "Residente", "Daddy Yankee", "Natti Natasha", "Anuel AA", "CNCO", "Prince Royce", "Tito Puente", "Gente de Zona", "J Balvin", "Bad Bunny", "Maluma", "Karol G", "Rosalía", "Juan Gabriel", "Los Ángeles Azules", "Ana Gabriel", "Shakira", "Maná", "Luis Miguel", "Vicente Fernández", "Marco Antonio Solís", "Chayanne", "Selena", "Thalía", "Paulina Rubio", "Julieta Venegas", "Ricky Martin", "Camila Cabello", "Daddy Yankee", "Ozuna", "Becky G", "Nicky Jam", "Bad Bunny", "Maluma", "J Balvin", "Shakira", "Juan Gabriel", "Vicente Fernández", "Selena", "Luis Miguel", "Rosalía", "Daddy Yankee", "Marc Anthony", "Maná", "Enrique Iglesias", "Camila Cabello", "Julieta Venegas", "Ricky Martin", "Ozuna", "Becky G", "Nicky Jam", "Bad Bunny", "Maluma", "J Balvin", "Shakira", "Juan Gabriel", "Vicente Fernández", "Selena", "Luis Miguel", "Rosalía", "Daddy Yankee", "Marc Anthony", "Maná", "Enrique Iglesias", "Camila Cabello", "Julieta Venegas", "Albert Einstein", "Oprah Winfrey", "Leonardo da Vinci", "Nelson Mandela", "Amelia Earhart", "Martin Luther King Jr.", "Marie Curie", "Mahatma Gandhi", "Queen Elizabeth II", "Michael Jackson", "Marilyn Monroe", "Steve Jobs", "Serena Williams", "Barack Obama", "Cristiano Ronaldo", "Malala Yousafzai", "William Shakespeare", "Elon Musk", "Madonna", "Frida Kahlo", "Albert Pujols", "Mother Teresa", "Stephen Hawking", "Audrey Hepburn", "Bill Gates", "Muhammad Ali", "Angela Merkel", "Ellen DeGeneres", "George Washington", "Taylor Swift", "Malcom X", "J.K. Rowling", "Beyoncé", "Pablo Picasso", "Dalai Lama", "Walt Disney", "Elon Musk", "Michelle Obama", "Winston Churchill", "Charlie Chaplin", "Bob Marley", "Neil Armstrong", "Anne Frank", "Adele", "Charles Darwin", "Vincent van Gogh", "Pope Francis", "Nikola Tesla", "Michael Jordan", "Coco Chanel", "Ernest Hemingway", "Princess Diana", "Vladimir Putin", "Maya Angelou", "Mark Zuckerberg", "Billie Holiday"]


        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = legendsWordS[Int(arc4random_uniform(UInt32(legendsWordS.count)))]
                
            }
        }
    }
    
    func onceGameS() {
        
        let onceWordsS = ["\"Cien anos de soledad\"\nGabriel Garcia Marquez", "\"Don Quijote de la Mancha\"\nMiguel de Cervantes Saavedra", "\"Rayuela\"\nJulio Cortazar", "\"La sombra del viento\"\nCarlos Ruiz Zafon", "\"Pedro Paramo\"\nJuan Rulfo", "\"Ficciones\"\nJorge Luis Borges", "\"La casa de los espiritus\"\nIsabel Allende", "\"Los detectives salvajes\"\nRoberto Bolano", "\"La ciudad y los perros\"\nMario Vargas Llosa", "\"Ensayo sobre la ceguera\"\nJose Saramago", "\"La muerte de Artemio Cruz\"\nCarlos Fuentes", "\"La noche de Tlatelolco\"\nElena Poniatowska", "\"La casa de Bernarda Alba\"\nFederico Garcia Lorca", "\"La voragine\"\nJose Eustasio Rivera", "\"Aura\"\nCarlos Fuentes", "\"Los renglones torcidos de Dios\"\nTorcuato Luca de Tena", "\"Crimen y castigo\"\nFyodor Dostoevsky (traducido al espanol)", "\"La Regenta\"\nLeopoldo Alas 'Clarin'", "\"Ficciones verdaderas\"\nMartin Caparros", "\"La casa de papel\"\nCarlos Maria Dominguez", "\"El amor en los tiempos del colera\"\nGabriel Garcia Marquez", "\"La tregua\"\nMario Benedetti", "\"Los hombres me explican cosas\"\nRebecca Solnit", "\"La reina del sur\"\nArturo Perez-Reverte", "\"Los siete locos\"\nRoberto Arlt", "\"Palomar\"\nItalo Calvino (traducido al espanol)", "\"Los girasoles ciegos\"\nAlberto Mendez", "\"Cronica de una muerte anunciada\"\nGabriel Garcia Marquez", "\"El coronel no tiene quien le escriba\"\nGabriel Garcia Marquez", "\"La casa de las bellas durmientes\"\nYasunari Kawabata (traducido al espanol)", "\"Las venas abiertas\nde America Latina\"\nEduardo Galeano", "\"Pantaleon y\nlas visitadoras\"\nMario Vargas Llosa", "\"La colmena\"\nCamilo Jose Cela", "\"El amor en los\ntiempos del colera\"\nGabriel Garcia Marquez", "\"La piel del tambor\"\nArturo Perez-Reverte", "\"Pedro Paramo\"\nJuan Rulfo", "\"La fiesta ajena\"\nLiliana Heker", "\"La caverna\"\nJose Saramago", "\"El tunel\"\nErnesto Sabato", "\"Los detectives salvajes\"\nRoberto Bolano", "\"La reina del sur\"\nArturo Perez-Reverte", "\"Los juegos del hambre\"\nSuzanne Collins", "\"El mundo y\nsus demonios\"\nCarl Sagan", "\"La insoportable\nlevedad del ser\"\nMilan Kundera (traducido al espanol)", "\"Ficciones\"\nJorge Luis Borges", "\"La casa de los espiritus\"\nIsabel Allende", "\"La casa de papel\"\nCarlos Maria Dominguez"]


        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                currentWord = onceWordsS[Int(arc4random_uniform(UInt32(onceWordsS.count)))]
                
            }
        }
    }
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(isOn: .constant(true), gameTime: .constant(false), mime: .constant(false), wild: .constant(false), sing: .constant(false), lunch: .constant(false), lights: .constant(false), feeling: .constant(false), legends: .constant(false), spotlight: .constant(false), once: .constant(false), mimeS: .constant(false), wildS: .constant(false), singS: .constant(false), lunchS: .constant(false), lightsS: .constant(false), feelingS: .constant(false), legendsS: .constant(false), spotlightS: .constant(false), onceS: .constant(false), english: .constant(false), spanish: .constant(true))
            
        }
    }
}
