const userTable = Application.tables.find(
  (table) => table.unique_id === Parameters.table_unique_id
);

const dmz = {
  name: "Phaser Template",
  type: "page",
  path: "/phaserGame01",
  filename: "phasergame01.tsx",
  collapseStatus: "expand",
  delays: {
    bpr: [
      "import minimum from '../components/Themes/minimum.module.scss'",
      "import { mergeClasses } from '../services/utils'",
    ],
    ph: ["const theme = minimum"],
  },
  children: [
    {
      name: "Before Page Render",
      type: "element",
      value: "bpr",
      prevent_delete: true,
      cascades: false,
      collapseStatus: "collapse",
      children: [],
    },
    {
      name: "Page Header",
      type: "element",
      value: "ph",
      prevent_delete: true,
      cascades: false,
      collapseStatus: "expand",
      children: [],
    },
    {
      name: "Body",
      type: "element",
      value: "b",
      prevent_delete: true,
      cascades: false,
      collapseStatus: "collapse",
      children: [
        {
          children: [
            {
              cascades: false,
              name: "Phaser Scene",
              path: "PhaserScene.tpl",
              prevent_delete: false,
              type: "element",
              value: "PhaserScene",
              values: {
                name: "StartSceneDesafioTemplate",
              },
              children: [
                {
                  cascades: false,
                  name: "Phaser Scene Function",
                  path: "PhaserSceneFunction.tpl",
                  prevent_delete: false,
                  type: "element",
                  value: "PhaserSceneFunction",
                  values: {
                    stage: "preload",
                  },
                  children: [
                    {
                      cascades: false,
					name: "Asset Loader",
					  path: "AssetLoader.tpl",
					  prevent_delete: false,
					  type: "element",
					  value: "AssetLoader",
					  values: {
						"name": "background",
						"useAsset": ['bg.png'],
						"imagePath": "/img/bg.png"
                    },
				},
                  ],
                },
              ],
            },
          ],
          cascades: false,
          name: "Phaser Game",
          path: "PhaserGame.tpl",
          prevent_delete: false,
          type: "element",
          value: "PhaserGame",
          values: {
            Width: 950,
            Height: 600,
            PhysicsEngine: "arcade",
            WholeScreen: true,
          },
        },
      ],
    },
    {
      name: "Page Footer",
      type: "element",
      value: "pf",
      prevent_delete: true,
      cascades: false,
      collapseStatus: "expand",
      children: [],
    },
    {
      name: "After Page Render",
      type: "element",
      value: "apr",
      prevent_delete: true,
      cascades: false,
      collapseStatus: "collapse",
      children: [],
    },
  ],
};

const allPages = Application.pages[0].children
  .filter((child) => child.type === "page")
  .map((page) => {
    return { ...page, parent: dmz.unique_id };
  });

dmz.children.push(...allPages);

Application.pages[0].children = [
  ...Application.pages[0].children.slice(0, 5),
  dmz,
];
console.log(Application.pages);

return Application;
