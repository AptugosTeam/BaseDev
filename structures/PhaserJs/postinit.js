const phaserTemplate = {
	"name": "Phaser Template",
	"type": "page",
	"path": "",
	"filename": "",
	"collapseStatus": "expand",
	"children": [{
	  "name": "Before Page Render",
	  "type": "element",
	  "value": "bpr",
	  "prevent_delete": true,
	  "cascades": false,
	  "collapseStatus": "collapse",
	  "children": []
	}, {
	  "name": "Page Header",
	  "type": "element",
	  "value": "ph",
	  "prevent_delete": true,
	  "cascades": false,
	  "collapseStatus": "expand",
	  "children": []
	},  {
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": []
	  }, {
	  "name": "Page Footer",
	  "type": "element",
	  "value": "pf",
	  "prevent_delete": true,
	  "cascades": false,
	  "collapseStatus": "collapse",
	  "children": []
	}, {
	  "name": "After Page Render",
	  "type": "element",
	  "value": "apr",
	  "prevent_delete": true,
	  "cascades": false,
	  "collapseStatus": "collapse",
	  "children": []
	}]
};

// Verificar si "Non Restricted Zone" ya existe
const existingZone = Application.pages[0].children.find(child => child.name === "Phaser Template");

if (!existingZone) {
	Application.pages[0].children.push(phaserTemplate);
}

return Application;