module Demo
  module Version_1
    class Root < Grape::API
      mount Demo::Version_1::BigData
      mount Demo::Version_1::Twitter
    end
  end
end