command: 'curl -s "https://en.wikipedia.org/w/api.php?action=parse&page=$(date +"%B_%d")&format=json&section=4&prop=text"'

refreshFrequency: 30000

style: """

  background: rgba(#000, 0.3)
  bottom: 3%
  right: 3%
  color: #fff
  font-family 'HelveticaNeue-Light', 'Helvetica Neue Light', 'Helvetica Neue', Helvetica, 'Open Sans', sans-serif
  font-smooth always

  padding: 10px 20px

  .output
    padding: 5px 10px
    width: 600px
    font-size: 20px
    font-family: Helvetica Neue
    font-smoothing: antialiased

"""
render: (output) -> """
  <div class="output">
    <div class="quote"></div>
  </div>
"""

update: (output, domEl) ->

  data = JSON.parse(output)  
  dom = $(domEl)

  dom.find('.quote').html data.parse.text[Object.keys(data.parse.text)[0]].split(/<a\b[^>]*>/i).join("").replace(/\s*\[.*?\]\s*/g, '')
