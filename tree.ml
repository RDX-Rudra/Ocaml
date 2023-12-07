type 'a tree =
|Leaf
|Node of 'a * 'a tree *'a tree;;

type 'a mylist =
  |Nil
  |Cons of 'a * 'a mylist;;

let t =
  Node(4,
    Node(2,
      Node(1,Leaf,Leaf),
      Node(3,Leaf,Leaf)
    ),
    Node(5,
      Node(6,Leaf,Leaf),
      Node(7,Leaf,Leaf)));;
  