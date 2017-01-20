class Builders::UserBuilder

  def initialize
    @name = 'NameUser',
    @email = 'email@email.com'
    @password = '1234'
    @username = 'username'
  end

  def build
    User.create(
    name: @name,
    email: @email,
    password: @password,
    username: @username
  )
  end

  def paramName name
    @name = name
    self
  end

  def paramEmail email
    @email = email
    self
  end

  def paramPassword password
    @password = password
    self
  end

  def paramUsername username
    @username = username
    self
  end

end
