module FilterableTable

  unloadable

  module Helper
    unloadable
  
    # To make this work, set the class name of each table row in your table to 'filterable'.
    # Then insert the filter_table method just before your table appears in the layout.
    #
    # Example:
    #
    #   <%= filter_table -%>
    #
    #   <table>
    #     <thead>
    #       <tr>
    #         <th>Name</th>
    #         <th>URL</th>
    #       </tr>
    #     </thead>
    #     <tbody>
    #       <%- @foos.each do |foo| -%>
    #         <tr class="filterable">
    #           <td><%= foo.name -%></td>
    #           <td><%= foo.url -%></td>
    #         </tr>
    #       <%- end -%>
    #     </tbody>
    #   </table>
    #
    def filter_table(args = {:show_instructions => true})
      insert = ""
      insert << %{
        <p class="instructions">To filter this table, start typing your search term and press 'enter'. To show all table rows, press 'escape'.</p>
      } if args[:show_instructions]
      insert << %{
        <script type="text/javascript">
          var head = document.getElementsByTagName('head')[0];
          var script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = '/javascripts/filterable_table.js';
          head.appendChild(script);
        </script>
      }
      insert
    end
    
  end
  
end