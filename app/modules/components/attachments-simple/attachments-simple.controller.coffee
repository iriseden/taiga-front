class AttachmentsSimpleController
    @.$inject = [
        "tgAttachmentsService"
    ]

    constructor: (@attachmentsService) ->

    addAttachment: (file) ->
        attachment = Immutable.fromJS({
            file: file,
            name: file.name,
            size: file.size
        })

        if @attachmentsService.validate(file)
            @.attachments = @.attachments.push(attachment)

            @.onAdd({attachment: attachment}) if @.onAdd

    addAttachments: (files) ->
        _.forEach files, @.addAttachment.bind(this)

    deleteAttachment: (toDeleteAttachment) ->
        @.attachments = @.attachments.filter (attachment) -> attachment != toDeleteAttachment

        @.onDelete({attachment: toDeleteAttachment}) if @.onDelete

angular.module("taigaComponents").controller("AttachmentsSimple", AttachmentsSimpleController)
