module CommentsHelper
  def rating_stars(rating)
    gold_star = "<div class='star-gold'></div>"
    gray_star = "<div class='star-gray'></div>"
    html = ''
    rating.times { html += gold_star }
    (5 - rating).times { html += gray_star }
    html.html_safe
  end

  def timestamp(date)
    "#{date.strftime('%d')}.#{date.strftime('%m')}.#{date.strftime('%Y')} в #{date.strftime('%I:%M')}"
  end
end
