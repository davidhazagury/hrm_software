class PasswordsController < Devise::PasswordsController
  private

  def after_resetting_password_path_for(resource)
    sign_in(resource) # In case you want to sign in the user
    if resource.company.users.size <= 1
      create_bucket(resource)
    end
    employees_path
  end

  def create_bucket(user)
    # Create a bucket for eac company that sign's up. When do we create it? when the user is confirmed? When the company is created?
    c = Aws::S3::Client.new(region: 'eu-west-1', access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['SECRET_ACCESS_KEY'])
    bucket_name = "#{user.company.name_of_company.parameterize}-#{user.company.id}"
    c.create_bucket(bucket: bucket_name, acl: 'private')
    # MAKE THE BUCKET BLOCK ALL PUBLIC!
    # USE CREATE BUCKET METHOD IN THIS WEB: https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/s3-example-create-buckets.html
  end
end
