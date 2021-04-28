import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

import '../widgets.dart';

// ignore: must_be_immutable
class BoardView extends StatefulWidget {
  final List<BoardList> lists;
  final double width;
  Widget middleWidget;
  double bottomPadding;
  bool isSelecting;
  BoardViewController boardViewController;
  int dragDelay;

  Function(bool) itemInMiddleWidget;
  OnDropBottomWidget onDropItemInMiddleWidget;
  BoardView(
      {Key key,
        this.itemInMiddleWidget,
        this.boardViewController,
        this.dragDelay = 300,
        this.onDropItemInMiddleWidget,
        this.isSelecting = false,
        this.lists,
        this.width = 330,
        this.middleWidget,
        this.bottomPadding})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BoardViewState();
  }
}

typedef void OnDropBottomWidget(int listIndex, int itemIndex, double percentX);
typedef void OnDropItem(int listIndex, int itemIndex);
typedef void OnDropList(int listIndex);

class BoardViewState extends State<BoardView>
    with AutomaticKeepAliveClientMixin {
  Widget draggedItem;
  int draggedItemIndex;
  int draggedListIndex;
  double dx;
  double dxInit;
  double dyInit;
  double dy;
  double offsetX;
  double offsetY;
  double initialX = 0;
  double initialY = 0;
  double rightListX;
  double leftListX;
  double topListY;
  double bottomListY;
  double topItemY;
  double bottomItemY;
  double height;
  int startListIndex;
  int startItemIndex;

  bool canDrag = true;

  ScrollController boardViewController = new ScrollController();

  List<BoardListState> listStates = [];

  OnDropItem onDropItem;
  OnDropList onDropList;

  bool isScrolling = false;

  bool _isInWidget = false;

  GlobalKey _middleWidgetKey = GlobalKey();

  var pointer;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (widget.boardViewController != null) {
      widget.boardViewController.state = this;
    }
  }

  void moveDown() {
    topItemY +=
        listStates[draggedListIndex].itemStates[draggedItemIndex + 1].height;
    bottomItemY +=
        listStates[draggedListIndex].itemStates[draggedItemIndex + 1].height;
    var item = widget.lists[draggedListIndex].items[draggedItemIndex];
    widget.lists[draggedListIndex].items.removeAt(draggedItemIndex);
    var itemState = listStates[draggedListIndex].itemStates[draggedItemIndex];
    listStates[draggedListIndex].itemStates.removeAt(draggedItemIndex);
    widget.lists[draggedListIndex].items.insert(++draggedItemIndex, item);
    listStates[draggedListIndex].itemStates.insert(draggedItemIndex, itemState);
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
  }

  void moveUp() {
    topItemY -=
        listStates[draggedListIndex].itemStates[draggedItemIndex - 1].height;
    bottomItemY -=
        listStates[draggedListIndex].itemStates[draggedItemIndex - 1].height;
    var item = widget.lists[draggedListIndex].items[draggedItemIndex];
    widget.lists[draggedListIndex].items.removeAt(draggedItemIndex);
    var itemState = listStates[draggedListIndex].itemStates[draggedItemIndex];
    listStates[draggedListIndex].itemStates.removeAt(draggedItemIndex);
    widget.lists[draggedListIndex].items.insert(--draggedItemIndex, item);
    listStates[draggedListIndex].itemStates.insert(draggedItemIndex, itemState);
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
  }

  void moveListRight() {
    var list = widget.lists[draggedListIndex];
    var listState = listStates[draggedListIndex];
    widget.lists.removeAt(draggedListIndex);
    listStates.removeAt(draggedListIndex);
    draggedListIndex++;
    widget.lists.insert(draggedListIndex, list);
    listStates.insert(draggedListIndex, listState);
    canDrag = false;
    if (boardViewController != null && boardViewController.hasClients) {
      int tempListIndex = draggedListIndex;
      boardViewController
          .animateTo(draggedListIndex * widget.width,
          duration: new Duration(milliseconds: 400), curve: Curves.ease)
          .whenComplete(() {
        RenderBox object = listStates[tempListIndex].context.findRenderObject();
        Offset pos = object.localToGlobal(Offset.zero);
        leftListX = pos.dx;
        rightListX = pos.dx + object.size.width;
        Future.delayed(new Duration(milliseconds: widget.dragDelay), () {
          canDrag = true;
        });
      });
    }
    if (mounted) {
      setState(() {});
    }
  }

  void moveRight() {
    var item = widget.lists[draggedListIndex].items[draggedItemIndex];
    var itemState = listStates[draggedListIndex].itemStates[draggedItemIndex];
    widget.lists[draggedListIndex].items.removeAt(draggedItemIndex);
    listStates[draggedListIndex].itemStates.removeAt(draggedItemIndex);
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
    draggedListIndex++;
    double closestValue = 10000;
    draggedItemIndex = 0;
    for (int i = 0; i < listStates[draggedListIndex].itemStates.length; i++) {
      if (listStates[draggedListIndex].itemStates[i].mounted &&
          listStates[draggedListIndex].itemStates[i].context != null) {
        RenderBox box = listStates[draggedListIndex]
            .itemStates[i]
            .context
            .findRenderObject();
        Offset pos = box.localToGlobal(Offset.zero);
        var temp = (pos.dy - dy + (box.size.height / 2)).abs();
        if (temp < closestValue) {
          closestValue = temp;
          draggedItemIndex = i;
          dyInit = dy;
        }
      }
    }
    widget.lists[draggedListIndex].items.insert(draggedItemIndex, item);
    listStates[draggedListIndex].itemStates.insert(draggedItemIndex, itemState);
    canDrag = false;
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
    if (boardViewController != null && boardViewController.hasClients) {
      int tempListIndex = draggedListIndex;
      int tempItemIndex = draggedItemIndex;
      boardViewController
          .animateTo(draggedListIndex * widget.width,
          duration: new Duration(milliseconds: 400), curve: Curves.ease)
          .whenComplete(() {
        RenderBox object = listStates[tempListIndex].context.findRenderObject();
        Offset pos = object.localToGlobal(Offset.zero);
        leftListX = pos.dx;
        rightListX = pos.dx + object.size.width;
        RenderBox box = listStates[tempListIndex]
            .itemStates[tempItemIndex]
            .context
            .findRenderObject();
        Offset itemPos = box.localToGlobal(Offset.zero);
        topItemY = itemPos.dy;
        bottomItemY = itemPos.dy + box.size.height;
        Future.delayed(new Duration(milliseconds: widget.dragDelay), () {
          canDrag = true;
        });
      });
    }
    if (mounted) {
      setState(() {});
    }
  }

  void moveListLeft() {
    var list = widget.lists[draggedListIndex];
    var listState = listStates[draggedListIndex];
    widget.lists.removeAt(draggedListIndex);
    listStates.removeAt(draggedListIndex);
    draggedListIndex--;
    widget.lists.insert(draggedListIndex, list);
    listStates.insert(draggedListIndex, listState);
    canDrag = false;
    if (boardViewController != null && boardViewController.hasClients) {
      int tempListIndex = draggedListIndex;
      boardViewController
          .animateTo(draggedListIndex * widget.width,
          duration: new Duration(milliseconds: widget.dragDelay),
          curve: Curves.ease)
          .whenComplete(() {
        RenderBox object = listStates[tempListIndex].context.findRenderObject();
        Offset pos = object.localToGlobal(Offset.zero);
        leftListX = pos.dx;
        rightListX = pos.dx + object.size.width;
        Future.delayed(new Duration(milliseconds: widget.dragDelay), () {
          canDrag = true;
        });
      });
    }
    if (mounted) {
      setState(() {});
    }
  }

  void moveLeft() {
    var item = widget.lists[draggedListIndex].items[draggedItemIndex];
    var itemState = listStates[draggedListIndex].itemStates[draggedItemIndex];
    widget.lists[draggedListIndex].items.removeAt(draggedItemIndex);
    listStates[draggedListIndex].itemStates.removeAt(draggedItemIndex);
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
    draggedListIndex--;
    double closestValue = 10000;
    draggedItemIndex = 0;
    for (int i = 0; i < listStates[draggedListIndex].itemStates.length; i++) {
      if (listStates[draggedListIndex].itemStates[i].mounted &&
          listStates[draggedListIndex].itemStates[i].context != null) {
        RenderBox box = listStates[draggedListIndex]
            .itemStates[i]
            .context
            .findRenderObject();
        Offset pos = box.localToGlobal(Offset.zero);
        var temp = (pos.dy - dy + (box.size.height / 2)).abs();
        if (temp < closestValue) {
          closestValue = temp;
          draggedItemIndex = i;
          dyInit = dy;
        }
      }
    }
    widget.lists[draggedListIndex].items.insert(draggedItemIndex, item);
    listStates[draggedListIndex].itemStates.insert(draggedItemIndex, itemState);
    canDrag = false;
    if (listStates[draggedListIndex].mounted) {
      listStates[draggedListIndex].setState(() {});
    }
    if (boardViewController != null && boardViewController.hasClients) {
      int tempListIndex = draggedListIndex;
      int tempItemIndex = draggedItemIndex;
      boardViewController
          .animateTo(draggedListIndex * widget.width,
          duration: new Duration(milliseconds: 400), curve: Curves.ease)
          .whenComplete(() {
        RenderBox object = listStates[tempListIndex].context.findRenderObject();
        Offset pos = object.localToGlobal(Offset.zero);
        leftListX = pos.dx;
        rightListX = pos.dx + object.size.width;
        RenderBox box = listStates[tempListIndex]
            .itemStates[tempItemIndex]
            .context
            .findRenderObject();
        Offset itemPos = box.localToGlobal(Offset.zero);
        topItemY = itemPos.dy;
        bottomItemY = itemPos.dy + box.size.height;
        Future.delayed(new Duration(milliseconds: widget.dragDelay), () {
          canDrag = true;
        });
      });
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    //print("dy:$dy");
    //print("topListY:$topListY");
    //print("bottomListY:$bottomListY");
    List<Widget> stackWidgets = <Widget>[
      ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: widget.lists.length,
        scrollDirection: Axis.horizontal,
        controller: boardViewController,
        itemBuilder: (BuildContext context, int index) {
          if (widget.lists[index].boardView == null) {
            widget.lists[index] = BoardList(
              items: widget.lists[index].items,
              headerBackgroundColor: widget.lists[index].headerBackgroundColor,
              backgroundColor: widget.lists[index].backgroundColor,
              footer: widget.lists[index].footer,
              header: widget.lists[index].header,
              boardView: this,
              draggable: widget.lists[index].draggable,
              onDropList: widget.lists[index].onDropList,
              onTapList: widget.lists[index].onTapList,
              onStartDragList: widget.lists[index].onStartDragList,
            );
          }
          if (widget.lists[index].index != index) {
            widget.lists[index] = BoardList(
              items: widget.lists[index].items,
              headerBackgroundColor: widget.lists[index].headerBackgroundColor,
              backgroundColor: widget.lists[index].backgroundColor,
              footer: widget.lists[index].footer,
              header: widget.lists[index].header,
              boardView: this,
              draggable: widget.lists[index].draggable,
              index: index,
              onDropList: widget.lists[index].onDropList,
              onTapList: widget.lists[index].onTapList,
              onStartDragList: widget.lists[index].onStartDragList,
            );
          }

          var temp = Container(
              width: widget.width,
              padding: EdgeInsets.fromLTRB(6, 0, 6, widget.bottomPadding ?? 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Expanded(child: widget.lists[index])],
              ));
          if (draggedListIndex == index && draggedItemIndex == null) {
            return Opacity(
              opacity: 0.0,
              child: temp,
            );
          } else {
            return temp;
          }
        },
      )
    ];
    bool isInBottomWidget = false;
    if (dy != null) {
      if (MediaQuery.of(context).size.height - dy < 80) {
        isInBottomWidget = true;
      }
    }
    if (widget.itemInMiddleWidget != null && _isInWidget != isInBottomWidget) {
      widget.itemInMiddleWidget(isInBottomWidget);
      _isInWidget = isInBottomWidget;
    }
    if (initialX != null &&
        initialY != null &&
        offsetX != null &&
        offsetY != null &&
        dx != null &&
        dy != null &&
        height != null &&
        widget.width != null) {
      if (canDrag && dxInit != null && dyInit != null && !isInBottomWidget) {
        if (draggedItemIndex != null &&
            draggedItem != null &&
            topItemY != null &&
            bottomItemY != null) {
          //dragging item
          if (0 <= draggedListIndex - 1 && dx < leftListX + 45) {
            //scroll left
            if (boardViewController != null && boardViewController.hasClients) {
              boardViewController.animateTo(
                  boardViewController.position.pixels - 5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease);
              if (listStates[draggedListIndex].mounted) {
                RenderBox object =
                listStates[draggedListIndex].context.findRenderObject();
                Offset pos = object.localToGlobal(Offset.zero);
                leftListX = pos.dx;
                rightListX = pos.dx + object.size.width;
              }
            }
          }
          if (widget.lists.length > draggedListIndex + 1 &&
              dx > rightListX - 45) {
            //scroll right
            if (boardViewController != null && boardViewController.hasClients) {
              boardViewController.animateTo(
                  boardViewController.position.pixels + 5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease);
              if (listStates[draggedListIndex].mounted) {
                RenderBox object =
                listStates[draggedListIndex].context.findRenderObject();
                Offset pos = object.localToGlobal(Offset.zero);
                leftListX = pos.dx;
                rightListX = pos.dx + object.size.width;
              }
            }
          }
          if (0 <= draggedListIndex - 1 && dx < leftListX) {
            //move left
            moveLeft();
          }
          if (widget.lists.length > draggedListIndex + 1 && dx > rightListX) {
            //move right
            moveRight();
          }
          if (dy < topListY + 70) {
            //scroll up
            if (listStates[draggedListIndex].boardListController != null &&
                listStates[draggedListIndex].boardListController.hasClients &&
                !isScrolling) {
              isScrolling = true;
              double pos = listStates[draggedListIndex]
                  .boardListController
                  .position
                  .pixels;
              listStates[draggedListIndex]
                  .boardListController
                  .animateTo(
                  listStates[draggedListIndex]
                      .boardListController
                      .position
                      .pixels -
                      5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease)
                  .whenComplete(() {
                pos -= listStates[draggedListIndex]
                    .boardListController
                    .position
                    .pixels;
                if (initialY == null) initialY = 0;
//                if(widget.boardViewController != null) {
//                  initialY -= pos;
//                }
                isScrolling = false;
                if (topItemY != null) {
                  topItemY += pos;
                }
                if (bottomItemY != null) {
                  bottomItemY += pos;
                }
                if (mounted) {
                  setState(() {});
                }
              });
            }
          }
          if (0 <= draggedItemIndex - 1 &&
              dy <
                  topItemY -
                      listStates[draggedListIndex]
                          .itemStates[draggedItemIndex - 1]
                          .height /
                          2) {
            //move up
            moveUp();
          }
          double tempBottom = bottomListY;
          if (widget.middleWidget != null) {
            if (_middleWidgetKey.currentContext != null) {
              RenderBox _box =
              _middleWidgetKey.currentContext.findRenderObject();
              tempBottom = _box.size.height;
              print("tempBottom:$tempBottom");
            }
          }
          if (dy > tempBottom - 70) {
            //scroll down

            if (listStates[draggedListIndex].boardListController != null &&
                listStates[draggedListIndex].boardListController.hasClients) {
              isScrolling = true;
              double pos = listStates[draggedListIndex]
                  .boardListController
                  .position
                  .pixels;
              listStates[draggedListIndex]
                  .boardListController
                  .animateTo(
                  listStates[draggedListIndex]
                      .boardListController
                      .position
                      .pixels +
                      5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease)
                  .whenComplete(() {
                pos -= listStates[draggedListIndex]
                    .boardListController
                    .position
                    .pixels;
                if (initialY == null) initialY = 0;
//                if(widget.boardViewController != null) {
//                  initialY -= pos;
//                }
                isScrolling = false;
                if (topItemY != null) {
                  topItemY += pos;
                }
                if (bottomItemY != null) {
                  bottomItemY += pos;
                }
                if (mounted) {
                  setState(() {});
                }
              });
            }
          }
          if (widget.lists[draggedListIndex].items.length >
              draggedItemIndex + 1 &&
              dy >
                  bottomItemY +
                      listStates[draggedListIndex]
                          .itemStates[draggedItemIndex + 1]
                          .height /
                          2) {
            //move down
            moveDown();
          }
        } else {
          //dragging list
          if (0 <= draggedListIndex - 1 && dx < leftListX + 45) {
            //scroll left
            if (boardViewController != null && boardViewController.hasClients) {
              boardViewController.animateTo(
                  boardViewController.position.pixels - 5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease);
              leftListX += 5;
              rightListX += 5;
            }
          }

          if (widget.lists.length > draggedListIndex + 1 &&
              dx > rightListX - 45) {
            //scroll right
            if (boardViewController != null && boardViewController.hasClients) {
              boardViewController.animateTo(
                  boardViewController.position.pixels + 5,
                  duration: new Duration(milliseconds: 10),
                  curve: Curves.ease);
              leftListX -= 5;
              rightListX -= 5;
            }
          }
          if (widget.lists.length > draggedListIndex + 1 && dx > rightListX) {
            //move right
            moveListRight();
          }
          if (0 <= draggedListIndex - 1 && dx < leftListX) {
            //move left
            moveListLeft();
          }
        }
      }
      if (widget.middleWidget != null) {
        stackWidgets
            .add(Container(key: _middleWidgetKey, child: widget.middleWidget));
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          setState(() {});
        }
      });
      stackWidgets.add(Positioned(
        // todo test this in different phones -32 or  * .904
        width: widget.width - 32,
        height: height,
        child: Opacity(
            opacity: .7,
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(5 / 360),
              child: draggedItem,
            )),
        left: (dx - offsetX) + initialX,
        top: (dy - offsetY) + initialY,
      ));
    }

    return Container(
        child: Listener(
            onPointerMove: (opm) {
              if (draggedItem != null) {
                if (dxInit == null) {
                  dxInit = opm.position.dx;
                }
                if (dyInit == null) {
                  dyInit = opm.position.dy;
                }
                dx = opm.position.dx;
                dy = opm.position.dy;
                if (mounted) {
                  setState(() {});
                }
              }
            },
            onPointerDown: (opd) {
              RenderBox box = context.findRenderObject();
              Offset pos = box.localToGlobal(opd.position);
              offsetX = pos.dx;
              offsetY = pos.dy;
              pointer = opd;
              if (mounted) {
                setState(() {});
              }
            },
            onPointerUp: (opu) {
              if (onDropItem != null) {
                int tempDraggedItemIndex = draggedItemIndex;
                int tempDraggedListIndex = draggedListIndex;
                int startDraggedItemIndex = startItemIndex;
                int startDraggedListIndex = startListIndex;

                if (_isInWidget && widget.onDropItemInMiddleWidget != null) {
                  onDropItem(startDraggedListIndex, startDraggedItemIndex);
                  widget.onDropItemInMiddleWidget(
                      startDraggedListIndex,
                      startDraggedItemIndex,
                      opu.position.dx / MediaQuery.of(context).size.width);
                } else {
                  onDropItem(tempDraggedListIndex, tempDraggedItemIndex);
                }
              }
              if (onDropList != null) {
                int tempDraggedListIndex = draggedListIndex;
                if (_isInWidget && widget.onDropItemInMiddleWidget != null) {
                  onDropList(tempDraggedListIndex);
                  widget.onDropItemInMiddleWidget(tempDraggedListIndex, null,
                      opu.position.dx / MediaQuery.of(context).size.width);
                } else {
                  onDropList(tempDraggedListIndex);
                }
              }
              draggedItem = null;
              offsetX = null;
              offsetY = null;
              initialX = null;
              initialY = null;
              dx = null;
              dy = null;
              draggedItemIndex = null;
              draggedListIndex = null;
              onDropItem = null;
              onDropList = null;
              dxInit = null;
              dyInit = null;
              leftListX = null;
              rightListX = null;
              topListY = null;
              bottomListY = null;
              topItemY = null;
              bottomItemY = null;
              startListIndex = null;
              startItemIndex = null;
              if (mounted) {
                setState(() {});
              }
            },
            child: new Stack(
              children: stackWidgets,
            )));
  }

  void run() {
    if (pointer != null) {
      dx = pointer.position.dx;
      dy = pointer.position.dy;
      if (mounted) {
        setState(() {});
      }
    }
  }
}
