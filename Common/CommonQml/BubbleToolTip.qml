import QtQuick
import QtQuick.Controls

ToolTip {
    id: root
    property string tipText: ""
    width: textBox.implicitWidth + 8 + triangle.width
    height: textBox.implicitHeight + 8 + triangle.height
    enum ToolTipPositionEnum {
        TOP,
        LEFT,
        BOTTOM,
        RIGHT

    }

    property int currentPosition: BubbleToolTip.ToolTipPositionEnum.TOP

    // 主背景
    background: Rectangle{
        id:background
        border.width: 0
        color:"transparent";
        width: textBox.implicitWidth + 8 + triangle.width
        height: textBox.implicitHeight + 8 + triangle.height

        Rectangle {
            id: backgroundBox
            color: "#ffffff"
            radius: 6
            border.width: 0
            state: "onTop"


            width: textBox.implicitWidth + 8
            height: textBox.implicitHeight + 8

            Text {
                id: textBox
                text: root.tipText
                anchors.centerIn: parent
                color: "#181818"
                font.pixelSize: 14
                font.family: "Arial"
            }

            states: [
                State {
                    name: "onTop"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.TOP
                    PropertyChanges {
                        target: backgroundBox
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                },

                State {
                    name: "onLeft"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.LEFT
                    PropertyChanges {
                        target: backgroundBox
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                    }
                },

                State {
                    name: "onBottom"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.BOTTOM
                    PropertyChanges {
                        target: backgroundBox
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                },

                State {
                    name: "onRight"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.RIGHT
                    PropertyChanges {
                        target: backgroundBox
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            ]
        }

        // 三角形箭头
        Canvas {
            id: triangle
            width: 10
            height: 10
            rotation: 0
            state: "onTop"
            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.beginPath();
                if (root.currentPosition === BubbleToolTip.ToolTipPositionEnum.TOP) {
                    ctx.moveTo(0, height);
                    ctx.lineTo(width / 2, 0);
                    ctx.lineTo(width, height);
                } else if (root.currentPosition === BubbleToolTip.ToolTipPositionEnum.BOTTOM) {
                    ctx.moveTo(0, 0);
                    ctx.lineTo(width / 2, height);
                    ctx.lineTo(width, 0);
                } else if (root.currentPosition === BubbleToolTip.ToolTipPositionEnum.LEFT) {
                    ctx.moveTo(width, 0);
                    ctx.lineTo(0, height / 2);
                    ctx.lineTo(width, height);
                } else if (root.currentPosition === BubbleToolTip.ToolTipPositionEnum.RIGHT) {
                    ctx.moveTo(0, 0);
                    ctx.lineTo(width, height / 2);
                    ctx.lineTo(0, height);
                }
                ctx.closePath();

                ctx.fillStyle = backgroundBox.color;
                ctx.fill()
            }



            states: [
                State {
                    name: "onTop"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.TOP
                    PropertyChanges {
                        triangle{
                            anchors.bottom: backgroundBox.top
                            anchors.bottomMargin: -1
                            anchors.horizontalCenter: backgroundBox.horizontalCenter
                        }

                    }
                },

                State {
                    name: "onLeft"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.LEFT
                    PropertyChanges {
                        triangle{
                            anchors.right: backgroundBox.left
                            anchors.rightMargin: -1
                            anchors.verticalCenter: backgroundBox.verticalCenter
                        }
                    }
                },

                State {
                    name: "onBottom"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.BOTTOM
                    PropertyChanges {
                        triangle{
                            anchors.top: backgroundBox.bottom
                            anchors.topMargin: -1
                            anchors.horizontalCenter: backgroundBox.horizontalCenter
                        }
                    }
                },

                State {
                    name: "onRight"
                    when: currentPosition === BubbleToolTip.ToolTipPositionEnum.RIGHT
                    PropertyChanges {
                        triangle{
                            anchors.left: backgroundBox.right
                            anchors.leftMargin: -1
                            anchors.verticalCenter: backgroundBox.verticalCenter
                        }
                    }
                }
            ]


        }
    }
}

