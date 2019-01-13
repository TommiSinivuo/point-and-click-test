return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 120,
  height = 68,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 8,
  nextobjectid = 13,
  properties = {},
  tilesets = {
    {
      name = "background",
      firstgid = 1,
      tilewidth = 1920,
      tileheight = 1080,
      spacing = 0,
      margin = 0,
      columns = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {
        {
          id = 0,
          image = "room/background/room-background.png",
          width = 1920,
          height = 1080
        }
      }
    },
    {
      name = "objects",
      firstgid = 2,
      tilewidth = 80,
      tileheight = 160,
      spacing = 0,
      margin = 0,
      columns = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      terrains = {},
      tilecount = 2,
      tiles = {
        {
          id = 0,
          image = "room/objects/player.png",
          width = 80,
          height = 160
        },
        {
          id = 1,
          image = "room/objects/walkbox.png",
          width = 64,
          height = 64
        }
      }
    },
    {
      name = "foreground",
      firstgid = 4,
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      columns = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {
        {
          id = 0,
          image = "room/foreground/foo-object.png",
          width = 128,
          height = 128
        }
      }
    }
  },
  layers = {
    {
      type = "objectgroup",
      id = 4,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1088,
          width = 1920,
          height = 1080,
          rotation = 0,
          gid = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 7,
      name = "walkboxes",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      id = 6,
      name = "game",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "player",
          type = "player",
          shape = "rectangle",
          x = 437.333,
          y = 638.667,
          width = 80,
          height = 160,
          rotation = 0,
          gid = 2,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 5,
      name = "foreground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1088,
          width = 128,
          height = 128,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 1088,
          width = 128,
          height = 128,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 960,
          width = 128,
          height = 160,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 390.667,
          y = 1088,
          width = 128,
          height = 82.6667,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 1088,
          width = 128,
          height = 128,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 624,
          y = 960,
          width = 128,
          height = 112,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 688,
          y = 1088,
          width = 128,
          height = 128,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 912,
          y = 1088,
          width = 128,
          height = 128,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
