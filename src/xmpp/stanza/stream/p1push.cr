require "../../stanza"

module XMPP::Stanza
  # P1 extensions
  # Reference: https://docs.ejabberd.im/developer/mobile/core-features/
  # p1:push support
  private class P1Push
    class_getter xml_name : XMLName = XMLName.new("p1:push push")

    def self.new(node : XML::Node)
      raise "Invalid node(#{node.name}, expecting #{@@xml_name.to_s}" unless (node.namespace.try &.href == @@xml_name.space) &&
                                                                             (node.name == @@xml_name.local)
      new()
    end

    def to_xml(elem : XML::Builder)
      elem.element(@@xml_name.local, xmlns: @@xml_name.space)
    end
  end
end
