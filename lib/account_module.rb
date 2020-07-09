module AccountModule
    #print balance in the form $xxxx.xx
    def balance_to_s
      dollars,cents = self.balance.to_s.split('.')
      string = "$#{dollars}."
      #decimal doesnt always come back with two decimal places
      cents[1] ? string += cents[0..1] : string += cents[0] + "0"    
    end
    

    #open?closed?  uses closed date
    def status
      self.closed_date == nil ? "Open" : "Closed"
    end
end