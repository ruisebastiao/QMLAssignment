var component;
var sprite;

// ******************************************************************************* section 1: autoCircularGauge

function createAutoCircularGauge(){
    component = Qt.createComponent("AutoCircularGauge.qml");
    if (component.status === Component.Ready)
        finishCircularGaugeCreation()
    else
        component.statusChanged.connect(finishCircularGaugeCreation);
}

function finishCircularGaugeCreation() {
    if (component.status === Component.Ready) {
        sprite = component.createObject(autoCircularGauge, {"x": 1100, "y": 30, "width":50, "height":50}); // on right side
        sprite = component.createObject(autoCircularGauge, {"x": 600, "y": 30, "width":50, "height":50});  // on left side
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

// ******************************************************************************* section 2: autoVerticalGauge

function createAutoVerticalGauge() {
    component = Qt.createComponent("AutoVerticalGauge.qml");
    if (component.status === Component.Ready)
        finishAutoVerticalGauge();
    else
        component.statusChanged.connect(finishAutoVerticalGauge);
}

function finishAutoVerticalGauge() {
    if (component.status === Component.Ready) {
        sprite = component.createObject(autoVerticalGauge, {"x": 1190, "y": 440, "width":40, "height":150});
        sprite = component.createObject(autoVerticalGauge, {"x": 630, "y": 440, "width":40, "height":150});
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

// ******************************************************************************* section 3 : autoStatusIndicator

function createAutoStatusIndicator() {
    component = Qt.createComponent("AutoStatusIndicator.qml");
    if (component.status === Component.Ready)
        finishAutoStatusIndicator();
    else
        component.statusChanged.connect(finishAutoStatusIndicator);
}

function finishAutoStatusIndicator() {
    if (component.status === Component.Ready) {
        sprite = component.createObject(autoStatusIndicator);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}


// ******************************************************************************* section 4: sprite animation icons
function createSpriteAnimation() {
    component = Qt.createComponent("SpriteAnimation.qml");
    if (component.status === Component.Ready)
        finishSpriteAnimation(); 
    else
        component.statusChanged.connect(finishSpriteAnimation);
}

function finishSpriteAnimation() {
    if (component.status === Component.Ready) {
        sprite = component.createObject(spriteAnimation);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}







































