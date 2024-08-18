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
		"children": [
		  {
			"children": [
			  {
				"cascades": false,
				"name": "Phaser Scene",
				"path": "PhaserScene.tpl",
				"prevent_delete": false,
				"type": "element",
				"value": "PhaserScene",
				"values": {
				  "name": "StartSceneDesafioTemplate"
				},
				"children": [
				  {
					"cascades": false,
					"name": "Phaser Scene Function",
					"path": "PhaserSceneFunction.tpl",
					"prevent_delete": false,
					"type": "element",
					"value": "PhaserSceneFunction",
					"values": {
					  "stage": "preload"
					},
					"children": [
					  {
						"cascades": false,
					  "name": "Asset Loader",
						"path": "AssetLoader.tpl",
						"prevent_delete": false,
						"type": "element",
						"value": "AssetLoader",
						"values": {
						  "name": "background",
						  "useAsset": ['bg.png'],
						  "imagePath": "/img/bg.png"
					  }
				  }
					]
				  }
				]
			  }
			],
			"cascades": false,
			"name": "Phaser Game",
			"path": "PhaserGame.tpl",
			"prevent_delete": false,
			"type": "element",
			"value": "PhaserGame",
			"values": {
			  "Width": 950,
			  "Height": 600,
			  "PhysicsEngine": "arcade",
			  "WholeScreen": true
			}
		  }
		]
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