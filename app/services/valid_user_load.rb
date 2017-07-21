class ValidUserLoad
  def initialize
    @token = ENV["GITHUB_PERSONAL_TOKEN"]
  end

  def client
    Octokit::Client.new(access_token: @token)
  end

  def members(cohort)
    client.org_members(cohort.url)
      .map { |member| { nickname: member.login, cohort: cohort } }
  end

  def load_all_valid_users
    Cohort.select(&:active?)
      .each do |cohort|
      self.members(cohort)
        .each do |member|
        ValidUser
          .find_or_initialize_by(nickname: member[:nickname])
          .update_attributes!(cohort: member[:cohort])
      end
    end
  end
end
