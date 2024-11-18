import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SnakeGame());
}

class SnakeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Game with Walls',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const int _rowSize = 40;
  static const int _totalGridSize = _rowSize * _rowSize;

  // Centered snake position
  final List<int> _snakePosition = [
    (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2) - 1,
    (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2),
    (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2) + 1,
  ];

  int _foodPosition = Random().nextInt(_totalGridSize);
  String _direction = 'down';
  Timer? _timer;

  // Define walls: borders and some internal cells
  final Set<int> _wallPositions = Set<int>();

  @override
  void initState() {
    super.initState();
    _createWalls();
    _startGame();
  }

  void _createWalls() {
    // Border walls
    for (int i = 0; i < _rowSize; i++) {
      _wallPositions.add(i); // Top border
      _wallPositions.add(_totalGridSize - i - 1); // Bottom border
      _wallPositions.add(i * _rowSize); // Left border
      _wallPositions.add((i * _rowSize) + _rowSize - 1); // Right border
    }

    // Internal walls for extra challenge
    for (int i = 10; i < 15; i++) {
      _wallPositions.add(i + _rowSize * 10); // Horizontal line in upper-middle
      _wallPositions.add(i + _rowSize * 30); // Horizontal line in lower-middle
    }
  }

  void _startGame() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _updateSnake();
    });
  }

  void _updateSnake() {
    setState(() {
      switch (_direction) {
        case 'up':
          _moveSnake(-_rowSize);
          break;
        case 'down':
          _moveSnake(_rowSize);
          break;
        case 'left':
          _moveSnake(-1);
          break;
        case 'right':
          _moveSnake(1);
          break;
      }
      if (_snakePosition.first == _foodPosition) {
        _snakePosition.add(_snakePosition.last);
        _generateNewFood();
      }
    });
  }

  void _moveSnake(int shift) {
    int newHead = _snakePosition.first + shift;
    if (_checkCollision(newHead)) {
      _timer?.cancel();
      _showGameOver();
    } else {
      _snakePosition.insert(0, newHead);
      _snakePosition.removeLast();
    }
  }

  bool _checkCollision(int position) {
    return position < 0 ||
        position >= _totalGridSize ||
        _snakePosition.contains(position) ||
        _wallPositions.contains(position) ||
        (position % _rowSize == 0 && _direction == 'right') ||
        (position % _rowSize == _rowSize - 1 && _direction == 'left');
  }

  void _showGameOver() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("Score: ${_snakePosition.length - 3}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: Text("Restart"),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      _snakePosition.clear();
      _snakePosition.addAll([
        (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2) - 1,
        (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2),
        (_rowSize * (_rowSize ~/ 2)) - (_rowSize ~/ 2) + 1,
      ]);
      _foodPosition = Random().nextInt(_totalGridSize);
      _direction = 'down';
      _startGame();
    });
  }

  void _changeDirection(String newDirection) {
    if ((_direction == 'up' && newDirection == 'down') ||
        (_direction == 'down' && newDirection == 'up') ||
        (_direction == 'left' && newDirection == 'right') ||
        (_direction == 'right' && newDirection == 'left')) {
      return;
    }
    _direction = newDirection;
  }

  void _generateNewFood() {
    _foodPosition = Random().nextInt(_totalGridSize);
    while (_snakePosition.contains(_foodPosition) || _wallPositions.contains(_foodPosition)) {
      _foodPosition = Random().nextInt(_totalGridSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake Game with Walls'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            switch (event.logicalKey.keyLabel) {
              case 'Arrow Up':
                _changeDirection('up');
                break;
              case 'Arrow Down':
                _changeDirection('down');
                break;
              case 'Arrow Left':
                _changeDirection('left');
                break;
              case 'Arrow Right':
                _changeDirection('right');
                break;
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0) {
                    _changeDirection('down');
                  } else if (details.delta.dy < 0) {
                    _changeDirection('up');
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    _changeDirection('right');
                  } else if (details.delta.dx < 0) {
                    _changeDirection('left');
                  }
                },
                child: GridView.builder(
                  itemCount: _totalGridSize,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _rowSize,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (_snakePosition.contains(index)) {
                      return Container(
                        color: Colors.green,
                      );
                    } else if (_wallPositions.contains(index)) {
                      return Container(
                        color: Colors.black,
                      );
                    } else if (index == _foodPosition) {
                      return Container(
                        color: Colors.red,
                      );
                    } else {
                      return Container(
                        color: Colors.grey[200],
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Score: ${_snakePosition.length - 3}',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
