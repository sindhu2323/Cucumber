class Dashboard
  
  def initialize(browser)
    @browser = browser
    @txt_fields = @browser.elements(:xpath => "//*[starts-with(@id,'txt_val_')]")
  end
  
  def get_count_of_text_fields()
    return @txt_fields.size
  end
  
  def visit()
    @browser.goto "http://www.exercise1.com/values"
  end
  
  def verify_total_fields()
    $num = get_count_of_text_fields()
    assert($num == 5)
  end
  
  def verify_currency_format()
    elem=@txt_fields
    elem.each do |e|
        $val=e.attribute_value('value')
        $amt='%.2f' % $val.delete( "$" ).to_f
        assert($amt>0)
    end
  end
  
  def verify_total_balance()
    $total=0
    elem = @txt_fields
    elem.each do |e|
      $val=e.attribute_value('value')
      $amt='%.2f' % $val.delete( "$" ).to_f
      $total=$total+$amt
    end
    $total_bal=browser.elements(:id => "txt_ttl_val").attribute_value('value')
    assert($total_bal == $total)
  end
  
  def verify_values_not_zero()
    elem = @txt_fields
    elem.each do |e|
      $val=e.attribute_value('value')
      $amt='%.2f' % $val.delete( "$" ).to_f
      assert($amt>0)
    end
  end
end