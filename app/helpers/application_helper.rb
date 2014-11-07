#encoding: utf-8
module ApplicationHelper
  def page_heading(str)
    content_for(:page_heading) { str }
  end

  def rental_days
  	{
  		1=> "3 Ngày",
  		2=> "1 Tuần",
  		3=> '2 Tuần'
  	}
  end

end
