# frozen_string_literal: true

module ApplicationHelper
  def breadcrumbs(crumbs = [])
    render partial: "shared/breadcrumbs", locals: { crumbs: crumbs }
  end

  def table(columns:, collection:, empty_message: "No records found", row_class: nil, row_link: nil)
    render partial: "shared/table",
           locals: {
             columns: columns,
             collection: collection,
             empty_message: empty_message,
             row_class: row_class,
             row_link: row_link
           }
  end

  def home_icon
    <<~SVG.html_safe
      <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
        <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
      </svg>
    SVG
  end

  def chevron_icon
    <<~SVG.html_safe
      <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
      </svg>
    SVG
  end
end
