unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  LCLtype, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Memo1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    snake, food:Tshape;

    { private declarations }
  public

    { public declarations }
  end;

var
  Form1: TForm1;
  xdirection, ydirection, total, i:integer;

const
  scl=20;

implementation

{$R *.lfm}

{ TForm1 }

function direction(x,y:integer):integer;
begin
  xdirection:=x;
  ydirection:=y;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  snake:=tshape.create(self);
  snake.parent:=self;
  snake.width:=scl;
  snake.height:=scl;
  snake.shape:=strectangle;
  snake.top:=100;
  snake.left:=100;

  food:=tshape.create(self);
  food.parent:=self;
  food.width:=scl;
  food.height:=scl;
  food.shape:=strectangle;
  food.top:=random(height div scl)*scl;
  food.left:=random(width div scl)*scl;
  food.brush.color:=clred;
  food.pen.color:=clred;

  xdirection:=1;
  ydirection:=0;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if key=vk_left then
    direction(-1,0);
  if key=vk_right then
   direction(1,0);
  if key=vk_down then
   direction(0,1);
  if key=vk_up then
   direction(0,-1);
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  snake.left:=snake.left+(xdirection*scl);
  snake.top:=snake.top+(ydirection*scl);

  if (snake.left = 0) or (snake.left = width-scl) then
    xdirection:=0;
  if (snake.top = 0) or (snake.top = height-scl) then
    ydirection:=0;

  if (snake.left = food.left) and (snake.top = food.top) then
    begin
     food.top:=random(height div scl)*scl;
     food.left:=random(width div scl)*scl;
    end;
end;

end.

