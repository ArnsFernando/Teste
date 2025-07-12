import QtQuick
import QtQuick.Controls
import org.qfield  1.0   // expõe iface.mapCanvas()

Item {
  width: parent.width
  height: 100

  // Pega o controlador temporal
  property var temporal: iface.mapCanvas().temporalController

  // Slider para navegar no tempo
  Slider {
    id: timeSlider
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    width: parent.width * 0.9

    // define intervalo conforme o controlador
    from: temporal.minimumValue
    to:   temporal.maximumValue
    stepSize: temporal.stepSize

    // atualiza a posição do tempo no mapa
    onValueChanged: temporal.setCurrentValue(value)
  }

  // Label opcional para mostrar data/hora legível
  Text {
    anchors.top: timeSlider.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    text: Qt.formatDateTime(
            new Date(temporal.currentValue),
            "dd/MM/yyyy hh:mm")
  }
}
