import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/food_delivery/model/drink_model.dart';
import 'package:flutter_challenge/features/food_delivery/model/food_model.dart';
import 'package:flutter_challenge/features/food_delivery/model/sauces_model.dart';
import 'package:flutter_challenge/features/list_books/model/book_model.dart';
import 'package:flutter_challenge/features/list_books/model/category_model.dart';
import 'package:flutter_challenge/features/sond_player/model/audio_model.dart';

class BlocServices {
  var play = AudioPlayer();

  List<BookModel> books = [
    BookModel(
      idCategory: 1,
      view: 1000,
      title: "Crying in H Mart",
      author: "Michelle Zauner",
      description:
          "This is the memoir and debut book of Michelle Zauner, lead singer of the indie band Japanese Breakfast. Zauner writes about growing up Korean American and how losing her mother to cancer when she was 25 forced her to reconnect with her identity. It's a story of Zauner's grief and an exploration of all the gifts (language, food, history) her mother left behind.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/20448873/media/f6fbd6c9ee15fd277816ec16c61acdcf.jpg",
      star: 3,
    ),
    BookModel(
      idCategory: 2,
      view: 400,
      title: "On Earth We're Briefly Gorgeous",
      author: "Ocean Vuong",
      description:
          "Ocean Vuong is a Vietnamese-American poet and his debut novel is written in the form of a letter from a son to a mother who cannot read. Exploring race, class, and masculinity, the novel handles difficult topics with beauty and the kind of lines that will hang in the air long after you've set the book down.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/20444809/media/6c54badb014ad5455a9063a4fbad6352.jpg",
      star: 2,
    ),
    BookModel(
      idCategory: 1,
      view: 450,
      title: "All About Love",
      author: "Bell hooks",
      description:
          "Feminist scholar and activist bell hooks died in 2021 at age 69, but her works have long been and will remain timeless. Her 1999 book is, as the title says, all about love, from personal, psychological, and philosophical perspectives.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/19656834/media/ee7035df4834b361c44396b1023c7f14.jpg",
      star: 10,
    ),
    // BookModel(
    //   title: "",
    //   author: "",
    //   description: "",
    //   imageUrl:
    //       "https://cdn.dribbble.com/users/2066214/screenshots/20448873/media/f6fbd6c9ee15fd277816ec16c61acdcf.jpg",
    //   star: 10,
    // ),
    BookModel(
      idCategory: 1,
      view: 100,
      title: "Good Company",
      author: "Cynthia D'Aprix Sweeney",
      description:
          "This summer-perfect read about secrets in a marriage offers an insider's glimpse into the New York theater and Hollywood scenes.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/18581502/media/64482ae99d5e0b5e29801fde276a86cd.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 2,
      view: 200,
      title: "Girls With Bright Futures",
      author: "Tracy Dobmeier and Wendy Katzman",
      description:
          "This thriller follows three moms as they go into overdrive to try to get their daughters a single, coveted spot at Stanford—including possibly attempted murder. (So no, you're doing just fine!)",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/18471137/media/168c3e1a0214bc8359a697574fcaa9fd.jpg",
      star: 5,
    ),
    BookModel(
      idCategory: 2,
      view: 300,
      title: "The Dutch House",
      author: "Ann Patchett",
      description:
          "Spoiler alert: Life isn't as perfect on the inside of a dream house as it appears. This artful portrait of a dysfunctional family—and the house they inhabit—is worthy book club fare.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/18414588/media/fa6a5b379ba63c0921916808cda4c95d.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 3,
      view: 150,
      title: "Normal People",
      author: "Sally Rooney",
      description:
          "If you haven't yet read Rooney's Normal People or her 2017 debut, Conversations with Friends, the Irish author's novels are great books to read if you like biting dialogue and stories about messy, real relationships.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/18414578/media/42e8a0112b8fe4d957ab537dde47967c.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 3,
      view: 30,
      title: "Trust Exercise",
      author: "Susan Choi",
      description:
          "In Choi's experimental coming of age novel, which won the 2019 National Book Award for fiction, two theater kids, Sarah and David, fall in love and explore their relationship for their craft under the watchful eye of their drama teacher. The twists are unexpected and the setting—a high-pressure arts school in the 1980s—is pitch-perfect. You'll want to talk about it with everyone.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/18215768/media/59e08b4affd373e8213e835e35566fe2.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 4,
      view: 490,
      title: "Women Talking",
      author: "Miriam Toews",
      description:
          "A lot of books claim to be the next Handmaid's Tale, but Women Talking really fits the bill. This feminist fiction novel about a group of Mennonite women who are drugged and attacked by men from their community is particularly haunting because it's based on real events. Margaret Atwood herself says the story could be right out of The Handmaid's Tale, so it has the official stamp of approval. If you're feeling helpless about the state of the world, Women Talking will inspire you to stand up, use your voice, and keep fighting.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/17025088/media/a4f4ae24879dbb624e36c494824bef86.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 4,
      view: 358,
      title: "The Kiss Quotient",
      author: "Helen Hoang",
      description:
          "Stella is great with numbers, but because she has Asperger's, she's not so great at romance. To gain experience, she hires an escort to practice and perfect her skills in the bedroom—and accidentally falls in love with him. Helen Hoang's #ownvoices novel is equal parts sweet and steamy. After reading The Kiss Quotient, you can jump immediately into the next book in the trilogy: The Bride Test, a companion novel about a woman searching for love and an autistic man who doesn't know if he can return her feelings.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/15354459/media/a82c2f396f935e58181e1992885f37be.jpg",
      star: 10,
    ),
    BookModel(
      idCategory: 5,
      view: 10,
      title: "Mostly Dead Things",
      author: "Kristen Arnett",
      description:
          "Everyone's family has their strange quirks, and Jessa's is no exception. After her father commits suicide in their family's taxidermy shop, their behavior gets even stranger; for starters, her mom begins making aggressive and sexually suggestive taxidermy art. Jessa takes over the business and tries to be strong for everyone but struggles to reach her loved ones that refuse to talk about their issues. Mostly Dead Things is one of the strangest, most bizarre books you'll ever read—in the best possible way.",
      imageUrl:
          "https://cdn.dribbble.com/users/2066214/screenshots/15229006/media/b4adde84efc428441687f3bf9908da38.jpg",
      star: 10,
    ),
  ];

  List<CategoryModel> categories = [
    CategoryModel(title: "Adventure stories", id: 1),
    CategoryModel(title: "Classics", id: 2),
    CategoryModel(title: "Crime", id: 3),
    CategoryModel(title: "Fantasy", id: 4),
    CategoryModel(title: "Historical fiction", id: 5),
    CategoryModel(title: "Horror", id: 6),
  ];

//* Food delivery datas
  List<FoodModel> foods = [
    FoodModel(
      color: const Color(0xffFF6161),
      title: "Fried fish",
      subTitle: "Salad",
      price: "10",
      isFavorite: false,
      user: UserModel(imageUrl: "paula.png", name: "Paula João"),
      dataCad: DateTime.now().add(const Duration(minutes: -10)),
      imageUrl: "fish_second.png",
    ),
    FoodModel(
      color: const Color(0xff98CA91),
      title: "Steak Egg",
      subTitle: "Salad and Lemon",
      price: "10",
      isFavorite: false,
      user: UserModel(imageUrl: "pedro.png", name: "Pedro Costa"),
      dataCad: DateTime.now().add(const Duration(minutes: -5)),
      imageUrl: "meal.png",
    ),
    FoodModel(
      color: const Color(0xff904D24),
      title: "Beef",
      subTitle: "Salad",
      price: "15",
      isFavorite: false,
      user: UserModel(imageUrl: "manuel.png", name: "Manuel Junior"),
      dataCad: DateTime.now().add(const Duration(minutes: -1)),
      imageUrl: "steak.png",
    ),
    FoodModel(
      color: const Color(0xffFFC82C),
      title: "Grilled Fish",
      subTitle: "Salad",
      price: "7",
      isFavorite: false,
      user: UserModel(imageUrl: "paula.png", name: "Paula João"),
      dataCad: DateTime.now().add(const Duration(minutes: -8)),
      imageUrl: "fish.png",
    )
  ];

  List<SaucesModel> sacues = [
    SaucesModel(
      name: "Mayonnaise",
      price: 2.0,
      imageUrl: "mayonnaise.png",
    ),
    SaucesModel(
      name: "Ketchup",
      price: 1.0,
      imageUrl: "ketchup.png",
    ),
    SaucesModel(
      name: "Spicy",
      price: 1.0,
      imageUrl: "spicy.png",
    ),
  ];

  List<DrinkModel> drinks = [
    DrinkModel(
      price: 3.0,
      name: "Cola",
      imageUrl: "cola.png",
    ),
    DrinkModel(
      price: 3.5,
      name: "Pepsi",
      imageUrl: "pepsi.png",
    ),
    DrinkModel(
      price: 4.0,
      name: "Beer",
      imageUrl: "beer.png",
    )
  ];
  //* End food delivery
}
