class ReportPdf < Prawn::Document
  def initialize(user_profile, ingredients)
    super()
    @user_profile = user_profile
    @ingredients = ingredients
    header
    text_content
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    # image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text @user_profile[:first_name] + " " + @user_profile[:last_name], size: 15, style: :bold
      text @user_profile[:address], size: 15, style: :bold
      text @user_profile[:birthday], size: 15, style: :bold
    end
  end

  def table_content
    # This makes a call to ingredient_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table ingredient_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

  def ingredient_rows
    [['#', 'Name', 'Percentage']] +
      @ingredients.map do |ingredient|
      [ingredient[:ingredient][:id], ingredient[:ingredient][:name], ingredient[:percentage]]
    end
  end
end