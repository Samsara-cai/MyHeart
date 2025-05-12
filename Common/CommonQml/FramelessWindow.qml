import QtQuick
import QtQuick.Controls


/**
  * 窗口存在的缺点： 1. 无法响应任务栏的点击应用图标最小，需要在c++代码中处理系统的任务栏点击事件
  *                  2. 边框拉伸时，鼠标的形状会发生改变（应该是在Draghandler处理时 MouseArea 仍会响应的原因）
  *                  3. 界面的样式属性暂未对外暴露
  *                  4. 界面未实现windows下的圆角（需要在设置window背景透明 和 主程序添加了 QCoreApplication::setAttribute(Qt::AA_TranslucentBackground)的基础上布局）
  */
ApplicationWindow{
    id: window
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint |Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.WindowMaximizeButtonHint;
    minimumWidth: 1200
    minimumHeight: 800
    color: "#1f1f1f"
    readonly property int resizeHandlerWidth: 7
    property alias logoSources: appLogo.source

    function toggleMaximized() {
        if (window.visibility === Window.Maximized) {
            window.showNormal();
        } else {
            window.showMaximized();
        }
    }



    ToolBar {
        width: parent.width
        height: 40
        leftPadding: 0
        rightPadding: 0
        x:0
        y:0

        background: Rectangle {
            border.width: 0
            anchors.fill: parent
            color: "#181818"   // 设置你想要的颜色
        }

        Item {
            anchors.fill: parent
            TapHandler {
                onTapped: if (tapCount === 2) toggleMaximized()
                gesturePolicy: TapHandler.DragThreshold
            }
            DragHandler {
                id: moveHandler
                grabPermissions: DragHandler.TakeOverForbidden
                onActiveChanged: if (active) { window.startSystemMove(); }
            }
        }

        Image {
            id: appLogo
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            width: 28
            height: 28
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: {
                resizeHandler.enabled = false;
            }
            onExited: {
                resizeHandler.enabled = true;
            }
        }


        ToolButton {
            id: closeBtn
            width: 40
            height: 40
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked: window.close()

            icon.source: "qrc:/qt/qml/CommonQml/img/close.svg"

            background: Rectangle {
                anchors.fill: parent
                color: closeBtn.hovered ? "#e81123" : "transparent"
            }
        }

        ToolButton {
            id: maxBtn
            width: 40
            height: 40
            anchors.right: closeBtn.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                toggleMaximized()
            }

            icon.source: window.visibility === Window.Maximized ?
                             "qrc:/qt/qml/CommonQml/img/normalize.svg" :
                             "qrc:/qt/qml/CommonQml/img/maxmize.svg"

            background: Rectangle {
                anchors.fill: parent
                color: maxBtn.hovered ? "#373737" : "transparent"
            }

            // 自动更新图标（绑定）
            Component.onCompleted: window.visibilityChanged.connect(() => maxBtn.forceActiveFocus())
        }

        ToolButton {
            id: minBtn
            width: 40
            height: 40
            anchors.right: maxBtn.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: window.showMinimized()

            icon.source: "qrc:/qt/qml/CommonQml/img/minimize.svg"

            background: Rectangle {
                anchors.fill: parent
                color: minBtn.hovered ? "#373737" : "transparent"
            }
        }

    }

    MouseArea {
        id: topleft
        z:999
        width: resizeHandlerWidth
        height: resizeHandlerWidth
        anchors.left: parent.left
        anchors.top: parent.top
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeFDiagCursor;
            }
        }
    }

    MouseArea {
        id: topright
        z:999
        width: resizeHandlerWidth
        height: resizeHandlerWidth
        anchors.right: parent.right
        anchors.top: parent.top
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeBDiagCursor;
            }
        }
    }
    MouseArea{
        id:top
        height: resizeHandlerWidth
        z:999
        anchors.top: parent.top
        anchors.left: topleft.right
        anchors.right: topright.left
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeVerCursor;
            }
        }
    }

    MouseArea {
        id: bottomleft
        z:999
        width: resizeHandlerWidth
        height: resizeHandlerWidth
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeBDiagCursor;
            }
        }
    }

    MouseArea {
        id: bottomright
        z:999
        width: resizeHandlerWidth
        height: resizeHandlerWidth
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeFDiagCursor;
            }
        }
    }
    MouseArea{
        id:bottom
        z:999
        height: resizeHandlerWidth
        anchors.bottom: parent.bottom
        anchors.left: bottomleft.right
        anchors.right: bottomright.left
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeVerCursor;
            }
        }
    }
    MouseArea{
        id:left
        width:resizeHandlerWidth
        z:999
        anchors.top: topleft.bottom
        anchors.bottom: bottomleft.top
        anchors.left: parent.left
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeHorCursor;
            }
        }
    }
    MouseArea{
        id:right
        width:resizeHandlerWidth
        z:999
        anchors.top: topright.bottom
        anchors.bottom: bottomright.top
        anchors.right: parent.right
        cursorShape: {
            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }else{
                resizeHandler.enabled = true;
                return Qt.SizeHorCursor;
            }
        }
    }

    DragHandler {
        id: resizeHandler
        grabPermissions: DragHandler.CanTakeOverFromAnything
        target: null
        dragThreshold: 2
        onActiveChanged: if (active) {
                             const p = resizeHandler.centroid.position;
                             const b = resizeHandlerWidth; // Increase the corner size slightly
                             let e = 0;
                             if (p.x < b) { e |= Qt.LeftEdge }
                             if (p.x >= width - b) { e |= Qt.RightEdge }
                             if (p.y < b) { e |= Qt.TopEdge }
                             if (p.y >= height - b) { e |= Qt.BottomEdge }
                             if(e!=0){
                                 window.startSystemResize(e);
                             }
                         }
    }


}

