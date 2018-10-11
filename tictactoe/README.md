# Tic Tac Toe
[Source code is here](https://github.com/calvinfeng/go-academy/tree/master/tictactoe)

## Object Oriented Programming in Go
Let's define what are entities that we need for a terminal based Tic Tac Toe game. 

1. `Game`: This is a struct that keeps track of the turns, the players, and the board information.
2. `Board`: This is a struct that keeps track of `X` and `O` marks. 
3. `Player`: This is an interface that implements the following methods
    * `GetMove(*Board) (int, int, error)`
    * `Mark() string`
    * `Name() string`
4. `HumanPlayer` and `ComputerPlayer`

First step, let's create a folder called `ttt` which is short for tic tac toe. Inside this folder we
will create a `ttt` package.

### Game
The data structure should look like the following.
```golang
type Game struct {
    PlayerOne Player
    PlayerTwo Player
    CurrentPlayer Player
    Board *Board
    TurnNum int
}
```

It should have one exported method and bunch of other private methods for internal logic.
```
func (g *Game) Start() {
    // Implementation...
}
```

### Board
The board is probably the most complicated and annoying because one needs to check columns, rows,
and diagonals. We can define Board as a 3 by 3 array of string.
```golang
type Board [3][3]string
```

It should have the following API(s).
* `IsOver() bool`
* `String() string`
* `Winner() string`

For bonus phase, we also need the following.
* `Copy() *Board`
* `GetAvailablePos() [][2]int`

There is a very neat trick with doing a deep copy of an array. We can declare the function as value receiver, which means it takes the value of pointer to `Board` and copies into the function. Thus, the `b` inside the function is already a copy of the original board. We just need to take its pointer address and return it.
```
func (b Board) Copy() *Board {
    return *b
}
```

### Player Interface
Each player should have name and mark. Mark is either `X` or `O`. 
```golang
type Player interface {
    GetMove(*Board) (int, int, error)
    Mark() string
    Name() string
}
```

### Human Player
The main responsibility of a `HumanPlayer` struct is to obtain user input from terminal. And 
of course, it should implement the `Player` interface.
```golang 
type HumanPlayer struct {
	name string
	mark string
}
```

For example, we can use `fmt.Scanf` to get user inputs.
```golang
// GetMove returns next move.
func (p *HumanPlayer) GetMove(b *Board) (int, int, error) {
	fmt.Print("Enter position: ")
	var i, j int
	if n, err := fmt.Scanf("%d %d", &i, &j); err != nil || n != 2 {
		return 0, 0, err
	}

	fmt.Println("Your input:", i, j)
	return i, j, nil
}
```

## Additional Note
### Private vs Public
Upper cased function names and variable names mean they are exported from a package. If they are
lowered case, then program outside of the package cannot invoke them or call on them.

## Bonus
Create a `ComputerPlayer` that implements the `Player` interface and make it undefeatable with 
*Minimax* algorithm. Here are some other recommendations for projects you can work on

* Connect 4
* Minesweeper
* Sudoku

## (Optional) Video 02: Tic Tac Toe in Go
* [Tic Tac Toe in Go Part 1](https://youtu.be/644HhokVkbI)
* [Tic Tac Toe in Go Part 2](https://youtu.be/eL6ruTgOQG0)
* [Tic Tac Toe in Go Part 3](https://youtu.be/rdSgqye50Qw)
