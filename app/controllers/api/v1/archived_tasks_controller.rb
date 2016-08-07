class Api::V1::ArchivedTasksController < Api::V1::BaseController

  def search
    missing_params = check_required_params params, [:date]
    return render_response false, I18n.t('missing_params') + missing_params.join(', '), [], 400 if missing_params.any?

    date = params[:date]
    begin
      tasks = ArchivedTask.search date
      return render_response(true, I18n.t('data_not_found'), [], 200) if tasks.empty?
      # Serialize Date
      # tasks = serialize tasks, CommingTaskSerializer
      tasks = ActiveModel::Serializer::ArraySerializer.new(tasks, each_serializer: ArchivedTaskSerializer)

      render_response(true, I18n.t('data_found'), tasks, 200)
    rescue ArgumentError => e
      render_response false, e.message, [], 400
    end
  end

end
