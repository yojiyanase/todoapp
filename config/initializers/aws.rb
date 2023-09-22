s3 = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],  ENV['AWS_SECRET_ACCESS_KEY']),
      region: 'us-west-1'
    )

    obj = s3.bucket(ENV['S3_BUCKET']).object('key')