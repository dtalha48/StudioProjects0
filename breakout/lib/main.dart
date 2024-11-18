import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(BreakOutGame());

class BreakOutGame extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: GameScreen(),
        )
    );
  }

}

class GameScreen extends StatefulWidget{

  @override
  _GameScreenState createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen>{


  // Ball Position and speed
  double ballX = 0.0;
  double ballY = 0.0;
  double ballSpeedX = 0.9;
  double ballSpeedY = 0.9;

  // Paddle Position
  double paddleX = 0.0;
  double paddleWidth = 0.4;

  // Brick Variables
  int numRows = 3;
  int numCols = 5;
  List<List<bool>> bricks = [];

  // setup/ initialize brickes
  void _intializeBricks(){

    for(int i = 0; i < numRows; i++)
    {
      bricks.add(List.filled(numCols,true));
    }

  }

  void _startGame(){

    Timer.periodic(Duration(milliseconds: 30),(timer){

      setState((){
        _moveBall();
      });

    } );

  }

  @override
  void initState(){
    super.initState();
    _intializeBricks();
    _startGame();
    print("Game Start");
  }

  void _moveBall(){

    ballX += ballSpeedX;
    ballY += ballSpeedY;


    // Ball collisions with walls
    if(ballX <= -1 || ballX >= 1)
    {
      ballSpeedX = -ballSpeedX;
    }

    if(ballY <= -1)
    {
      ballSpeedY = -ballSpeedY;
    }

    // ball collisions with paddle
    if( ballY >= 0.9 &&
        ballX >= paddleX - paddleWidth / 2 &&
        ballX <= paddleX + paddleWidth / 2)
    {
      ballSpeedY = -ballSpeedY;
    }

    // ball collides with the bricks
    // r row  | c column

    for(int r = 0; r < numRows; r++)
    {
      for(int c = 0; c < numCols; c++)
      {
        if(bricks[r][c]){
          double brickTop = -0.8 + r * 0.2;
          double brickLeft = -1 + c * 0.4;
          double brickRight = brickLeft + 0.4;

          if( ballY >=  brickTop &&
              ballY <=  brickTop + .1 &&
              ballX >=  brickLeft &&
              ballX <=  brickRight)
          {
            bricks[r][c] = false;
            ballSpeedY = -ballSpeedY;
          }

        }
      }
    } //end of for

    if(ballY >= 1 )
    {
      _resetGame();
    }
  }// end of move ball

//reset game
  void _resetGame(){
    ballX = 0.0;
    ballY = 0.0;
    ballSpeedX = 0.02;
    ballSpeedY = 0.02;
    bricks.clear();
    _intializeBricks();

  }

// move the paddles
  void _movePaddle(DragUpdateDetails details)
  {
    setState((){
      paddleX += details.delta.dx /MediaQuery.of(context).size.width*2;
      paddleX = paddleX.clamp(-1 + paddleWidth/2, 1 - paddleWidth/2);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onHorizontalDragUpdate: _movePaddle,
      child: Stack(
        children: [
          // ball
          Align(
            alignment: Alignment(ballX, ballY),
            child: Container(
              width:  20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
            ),
          ),
          // paddle
          Align(
              alignment: Alignment(paddleX, 0.95),
              child: Container(
                  width: MediaQuery.of(context).size.width * paddleWidth,
                  height: 20,
                  color: Colors.blue
              )
          ),
          // bricks
          for(int r = 0; r < numRows; r++)
            for(int c = 0; c < numCols; c++)
              if(bricks[r][c])
                Align(
                  alignment: Alignment(-1 + c* 0.4 + 0.2, -0.8 + r * 0.2),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 40,
                      color: Colors.red
                  ),
                ),
        ],
      ),
    );
  }

} //end of class

