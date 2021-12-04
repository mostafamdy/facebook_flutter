class ReactionsData {
  int count = 0;
  int countLike = 0;
  int countLove = 0;
  int countCare = 0;
  int countHaha = 0;
  int countWow = 0;
  int countSad = 0;
  int countAngry = 0;
  Reaction myReaction = Reaction.none;
  List<_UsersReactionsData>? whoLikes;
  List<_UsersReactionsData>? whoLoves;
  List<_UsersReactionsData>? whoCare;
  List<_UsersReactionsData>? whoHaha;
  List<_UsersReactionsData>? whoWow;
  List<_UsersReactionsData>? whoSad;
  List<_UsersReactionsData>? whoAngry;
}

class _UsersReactionsData {
  String? name;
  String? image;
  bool? isFriend;
}

enum Reaction { none, like, love, care, haha, wow, sad, angry }
