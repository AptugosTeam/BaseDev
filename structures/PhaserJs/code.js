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
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: `this.load.image('background', '/img/bg.png')`,
                      },
                    },
                    {
                      cascades: false,
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: `this.load.image('spaceship', '/img/fighter.png')`,
                      },
                    },
                    {
                      cascades: false,
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: `this.load.spritesheet('asteroids', '/img/enemy.png', {
                                frameWidth: 70,
                                frameHeight: 64,
                              })`,
                      },
                    },
                    {
                      cascades: false,
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: `this.load.image('bullet', '/img/shoot.png')`,
                      },
                    },
                  ],
                },
                {
                  cascades: false,
                  name: "Phaser Scene Function",
                  path: "PhaserSceneFunction.tpl",
                  prevent_delete: false,
                  type: "element",
                  value: "PhaserSceneFunction",
                  values: {
                    stage: "create",
                  },
                  children: [
                    {
                      cascades: false,
                      name: "SceneImage",
                      path: "SceneImage.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneImage",
                      values: {
                        asset: "background",
                        posX: 475,
                        posY: 300,
                        displayX: 1000,
                        displayY: 600,
                      },
                    },
                    {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "score",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "code",
                          path: "code.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "code",
                          values: {
                            code: `this.score = 0`,
                          }
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "nave",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "SceneSprite",
                          path: "SceneSprite.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "SceneSprite",
                          values: {
                            asset: "spaceship",
                            posX: 500,
                            posY: 600,
                            collide: true,
                            Physics: true,
                            scaleX: 0.1,
                            scaleY: 0.1,
                          },
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "SceneImage",
                      path: "SceneImage.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneImage",
                      values: {
                        asset: "asteroids",
                        posX: 500,
                        posY: 500,
                        displayX: 1,
                        displayY: 1,
                      },
                    },
                    {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "keys",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "CreateWatchForKeys",
                          path: "CreateWatchForKeys.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "CreateWatchForKeys",
                          values: {
                            keys: "A, D",
                          },
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "spaceBar",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "code",
                          path: "code.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "code",
                          values: {
                            code: `this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);`,
                          },
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "bullets",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "code",
                          path: "code.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "code",
                          values: {
                            code: `this.physics.add.group({
                                    defaultKey: 'bullet',
                                    maxSize: 1000
                                  });`,
                          },
                        },
                      ],
                    }, {
                      cascades: false,
                      name: "SceneVariable",
                      path: "SceneVariable.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "SceneVariable",
                      values: {
                        name: "asteroids",
                        type: "any",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "code",
                          path: "code.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "code",
                          values: {
                            code: `this.physics.add.group()`,
                          },
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "checkCollision",
                      path: "checkCollision.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "checkCollision",
                      values: {
                        objectA: "bullets",
                        objectB: "asteroids",
                        functionCollision: 'overlap',
                        functionCall: "destroyAsteroid",
                      },
                      },
                      {
                        cascades: false,
                        name: "code",
                        path: "code.tpl",
                        prevent_delete: false,
                        type: "element",
                        value: "code",
                        values: {
                          code: `this.time.addEvent({
                                delay: 1000,
                                callback: this.spawnAsteroid,
                                callbackScope: this,
                                loop: true
                              })`,
                        },
                      },
                      {
                        cascades: false,
                        name: "SceneSpriteAnims",
                        path: "SceneSpriteAnims.tpl",
                        prevent_delete: false,
                        type: "element",
                        value: "SceneSpriteAnims",
                        values: {
                          spriteName: "asteroids",
                          key: "asteroids",
                          frames: "[0, 1]",
                          frameRate: 10,
                          repeat: -1,
                          },
                      },
                      {
                        cascades: false,
                        name: "SceneVariable",
                        path: "SceneVariable.tpl",
                        prevent_delete: false,
                        type: "element",
                        value: "SceneVariable",
                        values: {
                          name: "scoreText",
                          type: "any",
                        },
                        children: [
                          {
                            cascades: false,
                            name: "code",
                            path: "code.tpl",
                            prevent_delete: false,
                            type: "element",
                            value: "code",
                            values: {
                            code: `this.scoreText = this.add.text(20,20,"kill: 0", { font: '24px', color: '#d20a0a' });`,
                            },
                          },
                        ],
                      },
                  ],
                },
                {
                  cascades: false,
                  name: "Phaser Scene Function",
                  path: "PhaserSceneFunction.tpl",
                  prevent_delete: false,
                  type: "element",
                  value: "PhaserSceneFunction",
                  values: {
                    stage: "update",
                  },
                  children: [
                    {
                      cascades: false,
                      name: "UpdateCheckForKeyDown",
                      path: "UpdateCheckForKeyDown.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "UpdateCheckForKeyDown",
                      values: {
                        key: "A, D",
                      },
                      children: [
                        {
                          cascades: false,
                          name: "updateSpriteProperty",
                          path: "updateSpriteProperty.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "updateSpriteProperty",
                          values: {
                            spriteName: "nave",
                            property: "VelocityX",
                            newValue: "-200",
                          },
                        },
                        {
                          cascades: false,
                          name: "updateSpriteProperty",
                          path: "updateSpriteProperty.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "updateSpriteProperty",
                          values: {
                            spriteName: "nave",
                            property: "VelocityX",
                            newValue: "+200",
                          },
                        },
                        {
                          cascades: false,
                          name: "updateSpriteProperty",
                          path: "updateSpriteProperty.tpl",
                          prevent_delete: false,
                          type: "element",
                          value: "updateSpriteProperty",
                          values: {
                            spriteName: "nave",
                            property: "VelocityX",
                            newValue: "0",
                          },
                        },
                      ],
                    },
                    {
                      cascades: false,
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: ` if (Phaser.Input.Keyboard.JustDown(this.spaceBar)) {
                                this.shootBullet.call(this);
                              }`,
                      },
                    },
                  ],
                },
                {
                  cascades: false,
                  name: "Phaser Scene Function",
                  path: "PhaserSceneFunction.tpl",
                  prevent_delete: false,
                  type: "element",
                  value: "PhaserSceneFunction",
                  values: {
                    stage: "other",
                    customFunctionName: "shootBullet",
                    customFunctionArguments: "",
                  },
                  children: [
                    {
                      cascades: false,
                      name: "code",
                      path: "code.tpl",
                      prevent_delete: false,
                      type: "element",
                      value: "code",
                      values: {
                        code: `const bullet = this.bullets.get(); 
                    if (bullet) {
                        bullet.enableBody(true, this.nave.x, this.nave.y - 20, true, true);
                        bullet.setVelocityY(-400);
                      }`,
                      },
                    },
                  ],
                  },
                  {
                    cascades: false,
                    name: "Phaser Scene Function",
                    path: "PhaserSceneFunction.tpl",
                    prevent_delete: false,
                    type: "element",
                    value: "PhaserSceneFunction",
                    values: {
                      stage: "other",
                      customFunctionName: "spawnAsteroid",
                      customFunctionArguments: "",
                    },
                    children: [
                      {
                        cascades: false,
                        name: "code",
                        path: "code.tpl",
                        prevent_delete: false,
                        type: "element",
                        value: "code",
                        values: {
                          code: `const x = Phaser.Math.Between(50, 750);
                          const y = Phaser.Math.Between(50, 100);
                          const asteroid = this.asteroids.create(x, y, 'asteroids').anims.play('asteroids').setScale(0.9);
                          asteroid.setVelocity(Phaser.Math.Between(-100, 100), Phaser.Math.Between(50, 200));`,
                        },
                      },
                    ],
                  },
                  {
                    cascades: false,
                    name: "Phaser Scene Function",
                    path: "PhaserSceneFunction.tpl",
                    prevent_delete: false,
                    type: "element",
                    value: "PhaserSceneFunction",
                    values: {
                      stage: "other",
                      customFunctionName: "destroyAsteroid",
                      customFunctionArguments: "bullet, asteroid",
                    },
                    children: [
                      {
                        cascades: false,
                        name: "code",
                        path: "code.tpl",
                        prevent_delete: false,
                        type: "element",
                        value: "code",
                        values: {
                          code: ` bullet.disableBody(true, true);
                                  asteroid.disableBody(true, true);
                                  this.score += 10
                                  this.scoreText.setText('kill: ' + this.score)`,
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
