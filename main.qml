import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    //这个是所有的item以动画的形式进入
    ListView {
        id: listview;
        anchors.centerIn: parent;
        width: 300;
        height: count * rowHeight;
        model: ["Apple" , "Windows" , "Ubuntu" , "Read Hat", "Linux Mint" , "Feadora"];
        property int rowHeight: 40;
        property int currentRowIndex: -1;

        delegate: Item {
            width: listview.width;
            height: listview.rowHeight;

            Rectangle {
                id: scrollRect;
                x: width * 2;
                width: parent.width;
                height: parent.height;
                color: "blue";
                border.color: "white";
                border.width: 3;
                Text {
                    anchors.centerIn: parent;
                    text: modelData;
                }
                Component.onCompleted: {
                    console.log("index = " , index);
                }

                NumberAnimation {
                    target: scrollRect;
                    running: listview.currentRowIndex === index;
                    property: "x";
                    to: 0;
                    duration: 300;
                    loops: 1;
                }
            }
        }

        Timer {
            id: timer;
            interval: 300;
            repeat: true;
            onTriggered: {
                listview.currentRowIndex ++;
                console.log(listview.currentRowIndex );

                if(listview.currentRowIndex === listview.count){
                    timer.stop();
                }
            }
        }

        Component.onCompleted: {
            timer.start();
        }
    }

/*
    //这个是带header的listview
    ListView{
            id:listView
            anchors.fill: parent
            model: 10
            headerPositioning: ListView.OverlayHeader

            header: Rectangle{
                width: listView.width
                height: 70
                z: 3;
                color: "green"
                Label{
                    anchors.centerIn: parent
                    text: "this is header"
                }
            }

            onCurrentIndexChanged: {
                console.log("current index = ",currentIndex)
            }

            delegate: Rectangle{
                  width: listView.width
                  height: 280
                  color: index%2 ? "red":"yellow"
                  Label{
                      id:txt
                      anchors.centerIn: parent
                      font.pointSize: 100
                      text: index
                  }
                  Label{
                      anchors.top: txt.bottom
                      font.pointSize: 30
                      text: "currentIndex = " + listView.currentIndex
                      anchors.horizontalCenter: parent.horizontalCenter
                  }
            }
        }
*/

}





















