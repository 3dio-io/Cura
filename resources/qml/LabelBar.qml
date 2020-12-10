// Copyright (c) 2019 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import UM 1.2 as UM

// The labelBar shows a set of labels that are evenly spaced from one another.
// The first item is aligned to the left, the last is aligned to the right.
// It's intended to be used together with RadioCheckBar. As such, it needs
// to know what the used itemSize is, so it can ensure the labels are aligned correctly.
Item
{
    id: base
    property var model: null
    property string modelKey: ""
    property int itemSize: 14
    height: childrenRect.height
    RowLayout
    {
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0
        Repeater
        {
            id: repeater
            model: base.model

            Item
            {
                Layout.fillWidth: true
                Layout.maximumWidth: Math.round(index + 1 === repeater.count || repeater.count <= 1 ? itemSize : base.width / (repeater.count - 1))
                height: label.height

                Label
                {
                    id: label
                    text: model[modelKey]
                    color: UM.Theme.getColor("text")
                    font: UM.Theme.getFont("default")
                    renderType: Text.NativeRendering
                    height: contentHeight
                    anchors.left: parent.left
                }
            }
        }
    }
}
