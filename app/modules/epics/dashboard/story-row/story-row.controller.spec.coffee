describe "StoryRowCtrl", ->
    controller = null

    beforeEach ->
        module "taigaEpics"

        inject ($controller) ->
            controller = $controller

    it "calculate percentage for some closed tasks", () ->
        data = {
            story: Immutable.fromJS(
                tasks: [
                    {is_closed: true},
                    {is_closed: true},
                    {is_closed: true},
                    {is_closed: false},
                    {is_closed: false},
                ]
            )
        }

        ctrl = controller "StoryRowCtrl", null, data
        expect(ctrl.percentage).to.be.equal("60%")

    it "calculate percentage for closed story", () ->
        data = {
            story: Immutable.fromJS(
                tasks: [
                    {is_closed: true},
                    {is_closed: true},
                    {is_closed: true},
                    {is_closed: false},
                    {is_closed: false},
                ]
                is_closed: true
            )
        }

        ctrl = controller "StoryRowCtrl", null, data
        expect(ctrl.percentage).to.be.equal("100%")

    it "calculate percentage for closed story", () ->
        data = {
            story: Immutable.fromJS(
                tasks: []
            )
        }

        ctrl = controller "StoryRowCtrl", null, data
        expect(ctrl.percentage).to.be.equal("0%")

