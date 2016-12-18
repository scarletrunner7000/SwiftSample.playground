//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



// # 『本気で始める iPhone アプリ作り 〜黒帯エンジニアがしっかり教える基本テクニック〜』
// 本に従ってすすめる


// ## Capter 2 Swiftプログラミングの基本


// ## 2-02 Swiftコードの書き方: 型と関数


str = "Hellow, " + "playground!!!"
print(str)

// ### 定数
let value1 = "りんごが大好きです"

var a = 1
var b = 2
var value1_1 = "りんごを\(a)個、みかんを\(b)個"


// ### 配列型

// #### ミュータブル
var array1 :[String] = [String]() // 空配列を宣言
array1.append("りんご")
array1.append("ごりら")

// #### イミュータブル
let array3 :[String] = ["りんご", "ごりら"]

// #### 別記法
var array4 :Array<String> = Array<String>()


// ### 辞書型

// #### ミュータブル
var dict1 :[String:String] = [String:String]()
dict1["りんご"] = "1個"
dict1["ごりら"] = "1匹"
// ### イミュータブル
let dict2 :[String:String] = ["りんご":"1個", "ごりら":"1匹"]


/// ### Optional 型、アンラップ
var value2 :String?
value2 = "こんにちは"
print(value2)
if let value2 = value2 { // アンラップ前後の変数名を同じにするといい (P59)
    print(value2)
}


// ### 関数

// #### 戻り値なしパターン
func myFunc(value :Int) {
    // 処理週略
}
myFunc(100)

// #### 戻り値ありパターン
func square(value :Int) -> Int {
    return value * value
}

// #### 引数に別名を付けるバターン
func showTestScore(mathematicsTestScore score:Int) -> String {
    return "数学の点数は\(score)点"
}
showTestScore(mathematicsTestScore: 80)


// ### throw 処理
enum MyError :ErrorType {
    case InvalidValue
}
func doubleUp(value :Int) throws -> Int {
    if value < 0 {
        throw MyError.InvalidValue
    }
    return value * 2
}

do {
    var doubleResultValue = try doubleUp(10)
    print("正常終了")
} catch MyError.InvalidValue {
    print("エラー発生")
}


// ### defer 処理
func longMethod() throws {
    // 時間がかかる処理
}
do {
    // 終了時に必ず行う
    defer {
        print("処理終了時間: \(NSDate())")
    }
    print("処理開始時間: \(NSDate())")
    try longMethod()
} catch {
    print("エラー発生")
}


// ## 2-03 Swiftコードの書き方: クラスと構造体


var radio = UISwitch()
radio.on = true
radio.setOn(false, animated: true)

class Dog {
    var name = ""
    var type = ""
    var birthday = ""

    func bark() {
        print("わんわん")
    }
}

class GuideDog :Dog {
    override func bark() {
        super.bark()
        print("きゃんきゃん")
    }
}

var dog = Dog()
dog.bark()
var guideDog = GuideDog()
guideDog.bark()

// クラスのインスタンス -> 参照渡し
// 構造体 -> 値渡し


// ### タプル
// -> 複数の値をまとめる

func requestMinAndMax() -> (min :Int, max :Int) {
    return (1, 100)
}
let minAndMax = requestMinAndMax()
let minValue = minAndMax.min // minAndMax.0 でも OK
let maxValue = minAndMax.max // minAndMax.1 でも OK


// ## 2-03 Swiftコードの書き方: 各種構文


// ### for 文
for var index = 0; index < 5; index++ {
    print("index: \(index)")
}
for index in 0...5 {
    print("index: \(index)")
}
for index in 0..<5 {
    print("index: \(index)")
}

// ### switch 文
enum Fluit {
    case Apple
    case Orange
}

let fl = Fluit.Orange
switch fl {
    case .Apple:
        print("りんご です")
    case .Orange:
        print("みかん です")
}

let value3 = "りんご"
switch value3 {
case "りんご":
    print("りんご です")
case "みかん":
    print("みかん です")
default:
    print("どちらでもない")
}


// ### guard 文
func buyItem(myMoney :Int?) {
    guard let _ = myMoney else {
        // 処理終了
        return
    }
    // 商品購入処理
}


// ### Swift でより簡潔にコードを記述する方法
var values = [11, 4, 25, 16, 5]
var results = []
var total = 0


// #### filter
results = values.filter({ (x :Int) -> Bool in
    if x < 10 {
        return true
    }
    return false
})
results = values.filter({ $0 < 10 })
print(results)

// #### map
results = values.map({ $0 * 2 })
print(results)

// #### reduce
total = values.reduce(0) { (nowTotal :Int, value :Int) -> Int in
    return nowTotal + value
}
print(total)
total = values.reduce(0, combine: { $0 + $1 })
print(total)

// #### sort
results = values.sort{ $0 < $1 }
print(results)

// #### for-in-where
for value in 0..<5 where value != 3 {
    print("index: \(value)")
}

// #### case-let-where
let value4 = "みかん"
switch value4 {
case let x where x.hasPrefix("み"):
    print("みかん です")
case "りんご":
    print("りんご です")
default:
    print("どちらでもよい")
}

// #### for-case-in
let fluits :[Fluit] = [.Apple, .Orange, .Apple, .Apple]
for case .Apple in fluits {
    print("りんご です")
}


